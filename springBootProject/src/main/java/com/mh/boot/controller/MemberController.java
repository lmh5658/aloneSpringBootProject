package com.mh.boot.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mh.boot.dto.MemberDto;
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
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	
	// * 로그인관련 --------------------------------------
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
		
		out.println("<script>");
		//if(loginUser != null) { // 암호화전 로그인성공에 대한 조건
		if(loginUser != null && bcryptPwdEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { // 암호화후 로그인성공에 대한 조건
			request.getSession().setAttribute("loginUser", loginUser);
			out.println("alert('" + loginUser.getNickName() + "님 환영합니다~');");
			//out.println("location.href = '" + request.getContextPath() + "';");
			out.println("location.href = '" + request.getHeader("referer") + "';"); // 이전에보던페이지 재요청
			
		}else {
			out.println("alert('로그인 실패하였습니다. 아이디 및 비밀번호를 다시 확인해주세요.');");
			out.println("history.back();");
		}
		out.println("</script>");
		
	}
	
	@RequestMapping("/signout.do")
	public String signout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	 * 
	 * @param checkNickName
	 * @return 닉네임 체크용 AJAX 
	 * 		   값이 0일경우 => "NNNNN" 
	 * 		   값이 0이 아닐경우 => "YYYYY" 전달
	 */
	@ResponseBody
	@GetMapping("/nickNamecheck.do")
	public String nickNamecheck(String checkNickName) {
		return memberService.selectNickNamecount(checkNickName) > 0 ? "NNNNN" : "YYYYY";
	}
	/**
	 * 
	 * @param member
	 * @return 회원가입 스프링 시큐리티 적용(BcryptPasswordEncoder) => 랜덤값 암호화
	 * 		   회원가입 실패 => 이전 화면 + alert
	 * 		   회원가입 성공 => 메인페이지로 이동 + alert
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
	
	// * 마이페이지 관련 ------------------------------------
	@GetMapping("/myinfo.page")
	public String myinfo() {
		return "member/myinfo";
	}
	
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
	
	
	
	
	
	

}
