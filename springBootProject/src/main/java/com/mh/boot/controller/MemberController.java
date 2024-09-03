package com.mh.boot.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mh.boot.dto.AlarmDto;
import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.MessageBoxDto;
import com.mh.boot.service.CommunityService;
import com.mh.boot.service.MemberService;
import com.mh.boot.util.FileUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final MemberService memberService;
	private final CommunityService comunityService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	
	// * 로그인관련 --------------------------------------
	@GetMapping("/loginPage.page")
	public void loginPage() {
		
	}
	
	@GetMapping(value="/findLogin.do")
	public void findLogin(String type, Model model) {
		model.addAttribute("type", type);
	}
	
	@ResponseBody
    @PostMapping("/findUser.do")
	 public ResponseEntity<Map<String, Object>> findUserId(MemberDto member, String type) {
		
		MemberDto members = memberService.selectFindUserId(member);
		int idCheck = (members != null) ? 1 : 0;
        log.debug("idCheck : {}", idCheck);
        Map<String, Object> response = new HashMap<>();
        response.put("idCheck", idCheck);
        response.put("userId", members.getUserId());
        response.put("enrollDt", members.getEnrollDate());

        return ResponseEntity.ok(response);
    }
	
	@ResponseBody
	@PostMapping("/findPwdChange.do")
	public int findPwdChange(MemberDto member, String type, String changePwd){
		log.debug(changePwd);
		Map<String, Object> map = new HashMap<>();
		map.put("userId", member.getUserId());
		map.put("userName", member.getUserName());
		map.put("email", member.getEmail());
		// 암호화로 변경 후 
		String distinctionPwd = bcryptPwdEncoder.encode(changePwd);
		map.put("changePwd", distinctionPwd);
		int result = memberService.findPwdChange(map);
		log.debug(distinctionPwd);
		
		return result;
	}
	
	/**
	 * > Ajax 로그인
	 */
	@ResponseBody
	@PostMapping("/loginSignin.do")
	public Map<String, Object> loginSignin(MemberDto m
					 , HttpServletRequest request
					 , HttpServletResponse response) throws IOException {
		
		MemberDto loginUser = memberService.selectMember(m);

		
		Map<String, Object> responses = new HashMap<>();
		if (loginUser != null && bcryptPwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
		    request.getSession().setAttribute("loginUser", loginUser);
		    responses.put("success", true);
		    responses.put("nickName", loginUser.getNickName());
		}else {
			responses.put("success", false);
		}
		return responses;
	}
	
	
	
	@PostMapping("/signin.do")
	public void signin(MemberDto m
					 , HttpServletRequest request
					 , HttpServletResponse response) throws IOException {
		
		log.debug("m: {}", m);
		MemberDto loginUser = memberService.selectMember(m);
		
		// 암호화전 : 아이디와 비밀번호 가지고 조회된 회원객체
		// 암호화후 : 오로지 아이디만을 가지고 조회된 회원객체 (=> 후에 비밀번호 확인해야됨)
		//		   loginUser.getUserPwd() => DB에 저장되어있는 암호문
		//		   매개변수 m.getUserPwd() => 로그인요청시 입력했던 평문 그대로의 비번
		
		// 로그인 성공시 => alert와 함께 메인페이지로 이동
		// 로그인 실패시 => alert와 함께 기존에 보던 페이지 유지
		
		// 실행시킬 script문을 요청햇던 페이지로 돌려주는 방식
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		String uri = request.getHeader("Referer");
		log.debug("uri : {}", uri);
		if (uri != null && !uri.contains("/signin")) {
			request.getSession().setAttribute("prevPage", uri);
		}
		
		
		
		//if(loginUser != null) { // 암호화전 로그인성공에 대한 조건
		// 로그인 성공 시 처리
		if (loginUser != null && bcryptPwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
		    // 세션에 로그인 사용자 정보 저장
		    request.getSession().setAttribute("loginUser", loginUser);
		    
		    // 자바스크립트 코드 생성
		    out.println("<script>");
		    out.println("alert('" + loginUser.getNickName() + "님 환영합니다~');");
		    
		    // 이전 페이지 URL 가져오기
		    HttpSession session = request.getSession();
		    String prevPage = (String) session.getAttribute("prevPage");
		    
		    if (prevPage != null) {
		        // 이전 페이지로 리디렉션
		        out.println("window.location.href = '" + prevPage + "';");
		        // 세션에서 이전 페이지 URL 제거
		        //session.removeAttribute("prevPage");
		    }else {
		        // 기본 페이지로 리디렉션 (예: 홈 페이지)
		        out.println("location.href = '" + request.getContextPath() + "';");
		    }
		    
		    out.println("</script>");
		} else {
		    // 로그인 실패 시 처리
		    out.println("<script>");
		    out.println("alert('로그인 실패하였습니다. 아이디 및 비밀번호를 다시 확인해주세요.');");
		    out.println("history.back();"); // 로그인 페이지로 돌아가기
		    out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("/signout.do")
	public String signout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/comunitySignout.do")
	public String comunitySignout(HttpSession session, HttpServletRequest request) {
		/*
		String uri = request.getHeader("Referer");
		
		if (uri != null) {
			request.getSession().setAttribute("prevPage", uri);
		}
		String prevPage = (String) session.getAttribute("prevPage");
		*/
		session.invalidate();
		return "redirect:/community/doranMain.page";
	}
	
	// * 회원가입 관련 ---------------------------------------
	@GetMapping("/signup.page")
	public String signupPage() {
		return "member/signup";
	}
	
	@ResponseBody
	@GetMapping("/idcheck.do")
	public String ajaxIdCheck(String checkId) {
		return memberService.selectUserIdCount(checkId) > 0 ? "NNNNN" : "YYYYY";
	}
	
	/**
	 * > 닉네임 체크용 AJAX 
	 *   값이 1일경우 => "NNNNN" 
	 * 	 값이 0일경우 => "YYYYY" 전달
	 */
	@ResponseBody
	@GetMapping("/nickNamecheck.do")
	public String nickNamecheck(String checkNickName) {
		return memberService.selectNickNamecount(checkNickName) > 0 ? "NNNNN" : "YYYYY";
	}
	
	/**
	 * > 쪽지 보내기 AJAX 
	 *   닉네임으로 아이디 찾기 또는 아이디로 아이디찾기
	 */
	@ResponseBody
	@GetMapping("/findIdcheck.do")
	public String findIdcheck(String checkNickName) {
		return memberService.findIdcheck(checkNickName);
	}
	
	/**
	 * > 회원가입 스프링 시큐리티 적용(BcryptPasswordEncoder) => 랜덤값 암호화
	 * 	 회원가입 실패 => 이전 화면 + alert
	 * 	 회원가입 성공 => 메인페이지로 이동 + alert
	 * 		   				(redirectAttributs.addFlashAttribute '포워딩' 적용 return "redirect:/")
	 */
	@PostMapping("/signup.do")
	public String signup(MemberDto member, RedirectAttributes redirectAttributes) {
		
		/*
		 * * 암호화
		 * * 솔팅기법
		 * - 매번 입력되는 평문값에 매번 다른 랜덤값을 붙여서 암호화해줌
		 *   => 매번 다른 암호문이 만들어짐
		 * - Spring security에서 제공하는 BCryptPasswordEncoder가
		 * 	 해당 방식을 사용하고 있음 
		 * 
		 *   1) 라이브러리 추가 
		 *   2) 빈 등록 (해당 빈 등록 구문이 쓰여져있는 파일 읽히게끔 해야됨)
		 *   				
		 */
		
		String userMail = member.getMail().concat("@" + member.getEmail());
		member.setEmail(userMail);
		
		member.setUserPwd(  bcryptPwdEncoder.encode(member.getUserPwd()) );
		
		
		
		int result = memberService.insertMember(member);
		int pkMemberNo = member.getUserNo(); //pk userNo 조회
		
		String couponSerialNumber = "CPW001"; // 가입시 10%할인 쿠폰 일련번호
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", pkMemberNo);
		map.put("couponSerialNumber", couponSerialNumber);
		map.put("couponName", "가입축하쿠폰10%");
		if(result > 0) {
			memberService.insertCoupon(map);			
		}

		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
			redirectAttributes.addFlashAttribute("NickName", member.getNickName());
			 // => HomeController의 mainPage메소드실행 => main.jsp 포워딩
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "회원가입에 실패하였습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/";
		
	}
	
	/*
	@ResponseBody
	@PostMapping("/modifyProfile.do")
	public String ajaxModifyProfile(MultipartFile uploadFile
								, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String originalProfileURL = loginUser.getProfileURL();
		
		// 파일업로드 
		Map<String, String> map = fileUtil.fileUpload(uploadFile, "profile");
		loginUser.setProfileURL(map.get("filePath") + "/" + map.get("filesystemName"));
				
		int result = memberService.updateProfileImg(loginUser);
		
		if(result > 0) {
			if(originalProfileURL != null) {
				new File(originalProfileURL).delete();
			}
			return "SUCCESS";
		}else {
			new File(map.get("filePath") + "/" + map.get("filesystemName")).delete();
			return "FAIL";
		}
		
	}
	*/
	
	@PostMapping("/modify.do")
	public String modify(MemberDto member
					   , RedirectAttributes redirectAttributes
					   , HttpSession session) {
		int result = memberService.updateMember(member);
		
		// 성공시 => alert메세지, 세션에 Member객체 갱신
		// 실패시 => alert메세지
		redirectAttributes.addFlashAttribute("alertTitle", "회원정보수정 서비스");
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 정보수정 되었습니다.");
			session.setAttribute("loginUser", memberService.selectMember(member));
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "정보수정에 실패하였습니다.");			
		}
		
		
		return "redirect:/member/myinfo.page";
	}
	
	/*
	@PostMapping("/leave.do")
	public String leave(String userPwd,
						HttpSession session,
						RedirectAttributes redirectAttributes) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		// 현재로그인한회원비번이랑 사용자가입력한비번이 일치하는지 
		// session에 담겨있음      userPwd 
		redirectAttributes.addFlashAttribute("alertTitle", "회원탈퇴 서비스");
		if(bcryptPwdEncoder.matches(userPwd, loginUser.getUserPwd())) {
			memberService.deleteMember(loginUser.getUserId());
			redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.");
			session.invalidate();
		}else { // 비번을 잘못입력했을 경우
			redirectAttributes.addFlashAttribute("alertMsg", "비밀번호가 틀렸습니다. 다시 입력해주세요.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/";
		
	}
	*/
	
	/**
	 * > 쪽지 데이터 저장
	 */
	@ResponseBody
	@PostMapping("/insertSend.do")
	public String insertSend(MessageBoxDto message, @SessionAttribute("loginUser") MemberDto member) {
		/*
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedDate = sdf.format(new Date());
		*/
		message.setSendId(member.getUserId());
		message.setSendNickName(member.getNickName());
		//message.setDateSend(formattedDate);
		
		memberService.insertSend(message);
		int messageNo = message.getMessageNo(); //방금 등록한 pk번호
		MessageBoxDto  messageBox =  memberService.selectMessage(messageNo);
		
		int readCount = comunityService.selectNoReadCount(member.getUserId());
		
		String join = String.valueOf(messageBox.getMessageNo()) + "," + messageBox.getSendId() + "," + messageBox.getReceiveId() + "," +
					  messageBox.getTitle() + "," + messageBox.getContent() + "," + messageBox.getSendNickName() + "," +
					  messageBox.getDateSend() + "," + messageBox.getDateRead() + "," + readCount;
		
		return join;
	}
	
	

	/**
	 * > 쪽지 업데이트
	 */
	@ResponseBody
	@GetMapping("/updateMessage.do")
	public String updateMessage(int messageNo, String type, @SessionAttribute("loginUser") MemberDto member){

		Map<String, Object> map = new HashMap<>();
		map.put("messageNo", messageNo);
		map.put("type", type);
		map.put("userId", member.getUserId());

		if(type != null && type.equals("read")) {
			memberService.updateMessage(map);
			MessageBoxDto  messageBox = memberService.selectMessage(messageNo);
			int readCount = comunityService.selectNoReadCount(member.getUserId());
			
			String join = String.valueOf(messageBox.getMessageNo()) + "," + messageBox.getDateRead() + "," + messageBox.getSendId() + "," + readCount;
			log.debug("readJoin :>>>>>>>", join);
			return join;
			
		}else if(type != null && type.equals("collect")){
			MessageBoxDto  messageBox = memberService.selectMessage(messageNo);
			if(messageBox.getDateRead() == null) {
				memberService.updateMessage(map);
				return "SUCCESS";
			}else {
				return "FAIL";
			}
		}else {
			return memberService.updateMessage(map) == 1 ? "SUCCESS" : "FAIL";
		}
		
	}
	
	/**
	 * > 마이페이지
	 */
	@GetMapping("/myPage.page")
	public void myPage() {
		
	}
	
	
	@ResponseBody
	@PostMapping("/checkPassword.do")
	public int checkPassword(String passwordCheck, @SessionAttribute("loginUser") MemberDto member) {
		
		String password = memberService.selectLoginUserPwd(member.getUserId());
		
		if(password != null && bcryptPwdEncoder.matches(passwordCheck, password)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * > 프로필 이미지만 따로 수정
	 */
	@ResponseBody
	@PostMapping("/userModifyProfileImg.do")
	public Map<String, Object> userModifyProfileImg(MultipartFile uploadFile, @SessionAttribute("loginUser") MemberDto member
									 , HttpSession session) {
		
		
		String originalProfileURL = member.getUserPath();
		//파일업로드
		MemberDto m = new MemberDto();
		Map<String, String> map = fileUtil.fileUpload(uploadFile, "profile");
		m.setUserPath((map.get("filePath") + "/" + map.get("filesystemName"))) ;
		m.setUserId(member.getUserId());
		
		int result = memberService.updateProfileImg(m);
		MemberDto memberDto = memberService.selectMember(member);
		
		if(result > 0) {
			session.setAttribute("loginUser", memberDto);
			if(originalProfileURL != null) {
				new File(originalProfileURL).delete();
			}
			Map<String, Object> response = new HashMap<>();
			response.put("memberDto", memberDto);
			response.put("success", true);
			return response;
		}else {
			
			new File(map.get("filePath") + "/" + map.get("filesystemName")).delete();
			Map<String, Object> response = new HashMap<>();
			response.put("success", false);
			return response;
		}
		
	}
	
	/**
	 * > 프로필 정보 수정
	 */
	@ResponseBody
	@PostMapping("/userModifyProfile.do")
	public MemberDto userModifyProfileImg(MemberDto m, @SessionAttribute("loginUser") MemberDto member, HttpSession session) {
		
		String userMail = m.getMail().concat("@" + m.getEmail());
		m.setEmail(userMail);
		m.setUserId(member.getUserId());
		
		int updateUserinfo = memberService.updateUserModifyProfile(m);
		MemberDto loginUser = memberService.selectMember(member);
		session.setAttribute("loginUser", loginUser);
		
		
		return loginUser;
	}

	
	@ResponseBody
	@PostMapping("/updatePassword.do")
	public int updatePassword(String currentPwd, String modifyPwd
							, HttpSession session) {
		
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		
		String password = memberService.selectLoginUserPwd(member.getUserId());
		
		//비밀번호 확인 후 비밀번호 변경
		if(password != null && bcryptPwdEncoder.matches(currentPwd, password)) {
			
			Map<String, Object> map = new HashMap<>();
			map.put("modifyPwd", bcryptPwdEncoder.encode(modifyPwd));
			map.put("userId", member.getUserId());
			
			int result = memberService.updatePassword(map);
			MemberDto loginUser = memberService.selectMember(member);
			session.setAttribute("loginUser", loginUser);
			
			return result; //비밀번호 변경 성공시 1
			
		}else {
			return 0;
		}
		
	}
	
	@ResponseBody
	@PostMapping("/accountDeletion.do")
	public int accountDeletion(String pwd, HttpSession session) {
		
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		
		String password = memberService.selectLoginUserPwd(member.getUserId());
		
		if(password != null && bcryptPwdEncoder.matches(pwd, password)) {
			
			int result = memberService.deleteMember(member.getUserId());
			session.invalidate();
			return result; //회원 탈퇴 성공시 1
			
		}else {
			return 0;
		}
		
	}
		
	
	@ResponseBody
	@GetMapping("/userSearch.do")
	public String userSearch(String userNo, String postType, int postNo, HttpSession session) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		MemberDto memberSearch = memberService.userSearch(param);
		
		AlarmDto alarm = new AlarmDto();
		alarm.setAlarmContent(memberSearch.getNickName() + "님 게시글에 새 댓글이 달렸습니다.");
		alarm.setUserId(memberSearch.getUserId());
		alarm.setPostNo(postNo);
		alarm.setPostType(postType);
		int result = comunityService.insertAlarmMessage(alarm);
		int alarmNo = alarm.getAlarmNo();
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		int count = 0;
		if(member != null) {
			count = comunityService.selectAlarmCount(member.getUserId());	
		}
		
		return memberSearch.getUserId() + "," + alarmNo + "," + count;
	}
		
		
	
	@ResponseBody
	@GetMapping("/userIdSearch.do")
	public String userIdSearch(String nickName, String postType, int postNo, HttpSession session) {
		Map<String, Object> param = new HashMap<>();
		param.put("nickName", nickName);
		MemberDto memberSearch = memberService.userSearch(param);
		
		AlarmDto alarm = new AlarmDto();
		alarm.setAlarmContent(nickName + "님이 남긴 댓글에 새 댓글이 달렸습니다.");
		alarm.setUserId(memberSearch.getUserId());
		alarm.setPostNo(postNo);
		alarm.setPostType(postType);
		int result = comunityService.insertAlarmMessage(alarm);
		int alarmNo = alarm.getAlarmNo();
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		int count = 0;
		if(member != null) {
			count = comunityService.selectAlarmCount(member.getUserId());	
		}
		
		return memberSearch.getUserId() + "," + alarmNo + "," + count;
	}
	
	/**
	 * > 회원가입 ) 이메일 중복 체크
	 */
	@ResponseBody
	@PostMapping("/emailCheck.do")
	public int emailCheck(String mails) {
		return memberService.selectEmailCheck(mails);
	}
	
	

}
