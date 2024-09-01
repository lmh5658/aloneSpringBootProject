package com.mh.boot.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.CommentDto;
import com.mh.boot.dto.CommunityDto;
import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.MessageBoxDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.service.CommunityService;
import com.mh.boot.util.FileUtil;
import com.mh.boot.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/community")
@RequiredArgsConstructor
@Controller
@Slf4j
public class CommunityController {
	
	
	private final FileUtil fileUtil;
	private final CommunityService communityService;
	private final PagingUtil pagingUtil;
	

	/**
	 * > 쪽지함 리스트 조회
	 */
	@ResponseBody
	@GetMapping("/ajaxSelectMessage.do")
	public ResponseEntity<?> ajaxSelectMessageList(@SessionAttribute("loginUser") MemberDto member
											 , @RequestParam(value = "page", defaultValue = "1") int currentPage){
		Map<String, Object> sendMap = new HashMap<>();
		sendMap.put("userId", member.getUserId());
		sendMap.put("send", "send");
		
		Map<String, Object> recMap = new HashMap<>();
		recMap.put("userId", member.getUserId());
		recMap.put("receive", "receive");
		
		Map<String, Object> collectMap = new HashMap<>();
		collectMap.put("userId", member.getUserId());
		collectMap.put("collect", "collect");

		
		//보낸쪽지함 조회
		int sendListCount = communityService.selectMessageListCount(sendMap);
		PageInfoDto piSend = pagingUtil.getPageInfoDto(sendListCount, currentPage, 5, 10);
		List<MessageBoxDto> sendList = communityService.ajaxSelectMessageList(sendMap, piSend);
		
		//받은 쪽지함 조회
		int receiveCount = communityService.selectMessageListCount(recMap);
		PageInfoDto piReceive = pagingUtil.getPageInfoDto(receiveCount, currentPage, 5, 10);
		List<MessageBoxDto> receiveList = communityService.ajaxSelectMessageList(recMap, piReceive);
		
		//휴지통 리스트
		int collectCount = communityService.selectMessageListCount(collectMap);
		PageInfoDto piCollect = pagingUtil.getPageInfoDto(collectCount, currentPage, 5, 10);
		List<MessageBoxDto> collectList = communityService.ajaxSelectMessageList(collectMap, piCollect);
		
		//읽지 않은 메세지함 갯수 조회
		int readCount = communityService.selectNoReadCount(member.getUserId());
		
		log.debug("sendList :>>>>>>>>> {}", sendList);
		log.debug("receiveList :>>>>>>>>> {}", receiveList);
		log.debug("collectList :>>>>>>>>> {}", collectList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("piSend", piSend);
		map.put("sendList", sendList);
		
		map.put("piReceive", piReceive);
		map.put("receiveList", receiveList);
		
		map.put("piCollect", piCollect);
		map.put("collectList", collectList);
		
		map.put("readCount", readCount); //읽지 않은 메시지 갯수
		
		return ResponseEntity.ok(map);
	}
	
	
	/**
	 * > 커뮤니티 게시판 리스트 출력
	 * 
	 */
	@GetMapping("/doranMain.page")
	public String doranList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		//커뮤니티 메인페이지(자유게시판 최신글)조회
		Map<String, Object> param = new HashMap<>();
		param.put("type", "J");
		PageInfoDto bpi = pagingUtil.getPageInfoDto(9, currentPage, 5, 9);
		List<CommunityDto> boardList = communityService.boardList(param, bpi);
		
		//커뮤니티 메인페이지(공지사항 최신글)조회
		Map<String, Object> noticeParam = new HashMap<>();
		noticeParam.put("type", "G");
		PageInfoDto npi = pagingUtil.getPageInfoDto(9, currentPage, 5, 9);
		List<CommunityDto> noticeList = communityService.boardList(noticeParam, npi);
		
		//커뮤니티 메인페이지(강아지정보 최신글)조회
		Map<String, Object> infoParam = new HashMap<>();
		noticeParam.put("type", "I");
		PageInfoDto pi = pagingUtil.getPageInfoDto(9, currentPage, 5, 9);
		List<CommunityDto> infoList = communityService.boardList(infoParam, pi);
		
		//커뮤니티 인기글 top3 게시글 조회
		PageInfoDto likePi = pagingUtil.getPageInfoDto(3, currentPage, 1, 3);
		List<CommunityDto> likeList = communityService.communityLikeTopList(likePi);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("infoList", infoList);
		model.addAttribute("likeList", likeList);
		
		return "community/doranMain";		
		
	}
	
	/**
	 * > 자유게시판 게시판
	 */
	@GetMapping("/board.do")
	public String boardList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		String type = "J";
		int listCount = communityService.selectBoardListCount(type);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount + 3, currentPage, 5, 10);
		
		model.addAttribute("list", communityService.selectBoardMerge(pi));
		model.addAttribute("pi", pi);
		model.addAttribute("type", type);
		
		return "community/board";
	}
	
	/**
	 * > 공지사항 게시판
	 */
	@GetMapping("/noticeBoard.do")
	public String noticeBoard(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("type", "G");
		String type = "G";
		int listCount = communityService.selectBoardListCount(type);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		
		model.addAttribute("list", communityService.boardList(param, pi));
		model.addAttribute("pi", pi);
		model.addAttribute("type", type);
		
		return "community/noticeBoard";
	}
	
	/**
	 * > 게시글 강아지정보
	 */
	@GetMapping("/infoBoard.do")
	public String infoBoard(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		
		String type = "I";
		model.addAttribute("type", type);
		return "community/infoBoard";
	}
	
	@ResponseBody
	@GetMapping("/ajaxInfoBoard.do")
	public Map<String, Object> ajaxInfoBoard(@RequestParam(value="page", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("type", "I");
		String type = "I";
		int listCount = communityService.selectBoardListCount(type);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 8);
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		
		Map<String, Object> response = new HashMap<>();
		response.put("list", communityService.boardList(param, pi));
		if(member != null) {
			List<Integer> likeList = communityService.selectLikeUser(member.getUserNo());			
			response.put("likeList", likeList);
		}
		response.put("pi", pi);
		response.put("type", type);
		
		return response;
	}
	
	/**
	 * > Ajax 검색
	 */
	@ResponseBody
	@PostMapping("/selectSearch.do")
	public Map<String, Object> selectSearch(@RequestParam(value="page", defaultValue="1") int currentPage, String search, String category, String type) {
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("category", category);
		param.put("search", search);
		param.put("type", type);
		
		int listCount = communityService.selectSearchCount(param);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		
		List<CommunityDto> list = communityService.selectSearchList(param, pi);
		
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		response.put("pi", pi);
		
		return response;
		
	}
	
	/**
	 * > 강아지 정보 Ajax카테고리 검색
	 */
	@ResponseBody
	@GetMapping("/selectOption.do")
	public Map<String, Object> selectOption(@RequestParam(value="page", defaultValue="1") int currentPage, String select, String type, HttpSession session) {
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("select", select);
		
		int listCount = communityService.selectBoardListCount(type);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 8);
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		
		List<CommunityDto> list = communityService.boardList(param, pi);
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		if(member != null) {
			List<Integer> likeList = communityService.selectLikeUser(member.getUserNo());			
			response.put("likeList", likeList);
		}
		response.put("pi", pi);
		
		return response;
		
	}
	
	/**
	 * >에디터 이미지파일 따로 저장
	 */
	@ResponseBody
	@PostMapping("/editorImageUpload.do")
	public AttachDto editorImageUpload(@RequestParam("image") MultipartFile uploadFile) {
		
		AttachDto at = new AttachDto();
		if(uploadFile != null && !uploadFile.isEmpty()) {
			Map<String, String> map = fileUtil.fileUpload(uploadFile, "editorImage");
			at.setFilePath(map.get("filePath"));
			at.setOriginalName(map.get("originalName"));			
			at.setFilesystemName(map.get("filesystemName"));	
		}
		
		return at;
	}

	/**
	 * > 게시판 글쓰기 Form
	 */
	@GetMapping("/writerForm.page")
	public void writeForm(String type, Model model) {
		model.addAttribute("type", type);
	}
	
	/**
	 * > 게시판 글쓰기 Insert (자유게시판 타입 =>'J', 공지사항 => 'G')
	 */
	@PostMapping("/insertWriter.do")
	public String insertWriter(CommunityDto com, List<MultipartFile> uploadFiles, RedirectAttributes redirectAttributes
										 , HttpSession session) {
		
		List<AttachDto> attachList = new ArrayList<>();
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 파일 업로드
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
				
				attachList.add( AttachDto.builder()
										 .filePath(map.get("filePath"))
										 .filesystemName(map.get("filesystemName"))
										 .originalName(map.get("originalName"))
										 .refType(com.getPostType())
										 .refNo(com.getPostNo())
										 .build() );
			}
		}
		
		try {
			
			if((MemberDto)session.getAttribute("loginUser") != null) {
				MemberDto m = ((MemberDto)session.getAttribute("loginUser"));
				com.setWriterNickName(String.valueOf(m.getNickName()));
				com.setWriterNo(m.getUserNo());				
			}
			
			int result = communityService.insertBoards(com, attachList);
			
			if(result > 0) {
				if ("J".equals(com.getPostType())) {
					redirectAttributes.addFlashAttribute("alertMsg", "자유 게시글 등록 성공!");
				}else if("G".equals(com.getPostType())){
					redirectAttributes.addFlashAttribute("alertMsg", "공지사항 게시글 등록 성공!");
				}else {
					redirectAttributes.addFlashAttribute("alertMsg", "정보 게시판글 등록 성공!");
				}
			}
			
			
		} catch (Exception e) {
			throw new FtpConnectionFailedException("에러오류 : " + e.getMessage());
		}
		
		
		return com.getPostType().equals("J") ? "redirect:/community/board.do" : com.getPostType().equals("G") ? "redirect:/community/noticeBoard.do" : "redirect:/community/infoBoard.do";
		
	}
	
	
	
	/**
	 * > 게시글 수정폼으로 데이터 조회후
	 *  성공시 => return (board + attachList)데이터 
	 */
	@GetMapping("/modifyForm.page")
	public String modifyForm(CommunityDto community, Model model) {
		
		model.addAttribute("board", communityService.detail(community));
		log.debug("수정하기 리스트 : {}>>>", communityService.detail(community));
		
		return "community/modifyForm";
	}
	
	/**
	 * > 게시글 수정
	 */
	
	@PostMapping("/updateWriter.do")
	public String updateWriter(CommunityDto community, Model model, List<MultipartFile> uploadFiles
							 , @RequestParam(required=false) List<String> fileDelNo
							 , RedirectAttributes redirectAttribute) {
		log.debug("fileDelNo : {}", fileDelNo);
		//기존 삭제 파일이 있을 경우 리스트 정보 알아내기(불필요한 파일이므로 삭제)
		List<AttachDto> list = new ArrayList<>();
		if(fileDelNo != null && !fileDelNo.isEmpty()) {
			list = communityService.selectDelFileList(fileDelNo);
		}
		
		//새로운 파일이 넘어왔을 경우 
		List<AttachDto> attachList = new ArrayList<>();
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
				
				attachList.add(AttachDto.builder().filePath(map.get("filePath"))
												  .filesystemName(map.get("filesystemName"))
												  .originalName(map.get("originalName"))
												  .refType(community.getPostType())
												  .refNo(community.getPostNo())
												  .build()
												  );
			}
		}
		//게시글 업데이트 + 파일업로드(있을경우에만)
		int result = communityService.updateWriter(community, attachList, fileDelNo);
		
		if(result > 0) {
			for(AttachDto at : list) {
				new File(at.getFilePath() + "/" +  at.getFilesystemName()).delete();
			}
			redirectAttribute.addFlashAttribute("alertMsg", community.getPostType().equals("J") ? "자유 게시판의 게시글 수정이 완료되었습니다." 
														  : community.getPostType().equals("G") ? "공지사항 게시판의 게시글 수정이 완료되었습니다." : "정보 게시판의 게시글 수정이 완료되었습니다.");
		}else {
			redirectAttribute.addFlashAttribute("alertMsg", "게시글 수정실패");
		}
		
		return "redirect:/community/detail.page?postNo=" + community.getPostNo() + "&postType=" + community.getPostType();
	}
	
	
	
	/**
	 * > 게시글 삭제('Y' -> 'N')업데이트
	 * 성공시 => return 1
	 * 실패시 => return 0
	 */
	@GetMapping("/deleteBoard.do")
	public String deleteBoard(String type, RedirectAttributes redirectAttribute) {
		
		int result = communityService.updateDeleteBoard(type);
		if(result > 0) {
			redirectAttribute.addFlashAttribute("alertMsg", type.equals("J") ? "자유 게시판 게시글 삭제가 완료되었습니다." 
																	 : "공지사항 게시판 게시글 삭제가 완료되었습니다.");
		}
		return "redirect:/community/board.do";
	}
	
	/**
	 * > 게시글 좋아요
	 */
	@ResponseBody
	@PostMapping("/udpateLike.do")
	public int updateLike(String postNo, @SessionAttribute("loginUser") MemberDto member) {
		Map<String, Object> param = new HashMap<>();
		param.put("postNo", postNo);
		param.put("userNo", member.getUserNo());		
		return communityService.insertLike(param) == 1 ? communityService.selectLike(param) : 0;
	}
	
	/**
	 * > 게시글 좋아요 취소
	 */
	@ResponseBody
	@PostMapping("/delteLike.do")
	public int delteLike(String postNo, @SessionAttribute("loginUser") MemberDto member) {
		Map<String, Object> param = new HashMap<>();
		param.put("postNo", postNo);
		param.put("userNo", member.getUserNo());	
		
		return communityService.deleteLike(param) == 1 ? communityService.selectLike(param) : 0;
	} 
	
	/**
	 * > 게시글 조회수 증가 => redirect:/ 게시글 상세페이지 (게시글 작성자가 아닌 사용자만 COUNT + 1)
	 */
	@GetMapping("/increase.do")
	public String increase(CommunityDto com) {
		// 조회수 증가
		communityService.updateIncreaseCount(com);
		
		return "redirect:/community/detail.page?postNo=" + com.getPostNo() + "&postType=" + com.getPostType();
	}
	
	/**
	 * > 게시판 상세페이지 ( 게시글 리스트, 첨부파일 리스트 )
	 */
	@GetMapping("/detail.page")
	public void detail(CommunityDto com, @RequestParam(value = "page", defaultValue = "1") int currentPage
					 , Model model, HttpSession session) {
		//comment list 갯수
		
		CommentDto comment = new CommentDto();
	    comment.setBoardNo(com.getPostNo());
	    
	    int listCount = communityService.selectCommentCount(comment.getBoardNo());
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
	    
		MemberDto member = (MemberDto)session.getAttribute("loginUser");
		if(member != null) {
			Map<String, Object> param = new HashMap<>();
			param.put("postNo", com.getPostNo());
			param.put("userNo", member.getUserNo());			
			model.addAttribute("checkLike",communityService.selectCheckLike(param));
		}
		
	    model.addAttribute("board",communityService.detail(com));
		model.addAttribute("commentList", communityService.ajaxCommentSelect(comment, pi));
	}
	
	
	
	/**댓글 --------------------------------------
	 *  > 댓글 insert
	 */
	@ResponseBody
	@PostMapping("/insertComment.do")
	public ResponseEntity<?> insertComment(@RequestParam(value = "page", defaultValue = "1") int currentPage
										, @RequestParam(value="reply", required=false) String reply
										, CommentDto comment
										, @RequestParam(value = "arr[]", required = false) List<String> arr
										, @SessionAttribute("loginUser") MemberDto member) {
		
		
		//comment list 갯수
		int listCount = communityService.selectCommentCount(comment.getBoardNo());
		
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
		
		
		int result = 0;
		int key = 0;
		//reply로 넘어오는 값이 "부모댓글"이면 실행
		if (reply != null && reply.equals("부모댓글")) {
			
			int refCount = communityService.selectRefGroupCount(comment);
			
			comment.setUserNo(member.getUserNo());
			comment.setUserNickName(member.getNickName());
			comment.setRefGroup( refCount + 1 );
			
            result = communityService.insertComment(comment);
            key = comment.getId();
            
        //reply로 넘어오는 값이 "부모댓글이 아니라면" 실행
        }else{
        	//넘어온 값들 map안에 담아주기
        	Map<String, Object> map = new HashMap<>();
        	map.put("refGroup", comment.getRefGroup());
        	map.put("refOrder", comment.getRefOrder());
        	map.put("boardNo", comment.getBoardNo());
        	map.put("id", comment.getId());
        	map.put("step", comment.getStep());
        	
        	//reply로 넘어오는 값이 "대대대댓글"이면 실행
        	if(reply != null && reply.equals("대대대댓글")) {
        		
        	
        		//ID로 자식 갯수 조회
        		//=> 조회하는 이유 대대댓글을 달기위해서 
        		//CASE 1)자식요소가 없다면 부모요소 + 1
        		//CASE 2)자식요소가 있다면 제일 큰 자식요소의 REF_ORDER를 조회 한 후 + 1 
        		int children = communityService.checkAnswerNum(map);
        		log.debug("children : >>> {}", children);
        		
        		//CASE1)자식요소가 있다면
        		if(children != 0) {      
        			//자식요소의 제일 큰 번호를 조회한 후 + 1
        			comment.setRefOrder(communityService.selectReplyRefOrder(map) + 1);
        			//자식요소를 제외한 뒤에 번호들 REF_ORDER + 1 UPDATE
        			List<Integer> list = communityService.selectNextRefOrders(map);
        			if(list != null && !list.isEmpty()) {
        				communityService.updateNextRefGroupId(list);        				
        			}
        			
        		//CASE2)자식요소가 없다면
        		}else if(children == 0) {
        			//넘어온 ID값의 REF_ORDER를 조회한 후 + 1
        			comment.setRefOrder(communityService.selectRefOrder(map) + 1);
        			//뒤에 번호들 REF_ORDER + 1 UPDATE
        			List<Integer> list = communityService.selectNextRefOrders(map);
        			if(list != null && !list.isEmpty()) {
        				communityService.updateNextRefGroupId(list);        				
        			}
        			
        		}
        		
        	//reply로 넘어오는 값이 "대댓글"이라면 실행
			}else{ //댓글
				
				int refOrderCount = communityService.selectParentRefOrder(map);
	        	
				comment.setRefOrder(refOrderCount + 1);
			}
        	
        	//공통적으로 들어가야 할 값들은 if밖으로
        	int stepCount = communityService.selectStep(map);
			comment.setStep(stepCount + 1);
			
        	//ANSWER_NUM 업데이트 => 자식요소가 몇개인지
        	int answerUpdate = communityService.updateAnswerCount(map);
        	
        	comment.setUserNo(member.getUserNo());
			comment.setUserNickName(member.getNickName());
			comment.setParentNum(comment.getId());
			
			//최종 INSERT
			result = communityService.insertComment(comment);
			key = comment.getId(); //<=등록한 PK값을 알아내서 대댓글, 대대댓글 요소에 대댓글을 등록하면 MARGIN-LEFT STYLE를 주려고했음.
								   //댓글을 달면 스타일은 잘 적용됫지만, 새로고침하면 스타일이 저장되지 않아 풀려버림.
								   //그래서 script바로 뒤쪽에 배열을 두고 배열 안에 아이디값를 저장하고 스타일을 적용하려 했는데 풀려버림.
								   //포기함
        }
		//저장에 성공하면 리스트 조회 후 MAP안에 LIST, PI데이터값 담기
		List<CommentDto> list =  (result > 0) ? communityService.ajaxCommentSelect(comment, pi) : null; 
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return ResponseEntity.ok(map);
		
		
	}
	
	
	
	
	@ResponseBody
	@PostMapping("/updateComment.do")
	public Map<String, Object> updateComment(CommentDto comment, @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		int listCount = communityService.selectCommentCount(comment.getBoardNo());
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
		
		List<CommentDto> list = communityService.updateComment(comment) > 0 ? communityService.ajaxCommentSelect(comment, pi) : null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return map;
	}
		
	
	@ResponseBody
	@GetMapping("/updateDeleteComment.do")
	public Map<String, Object> updateDeleteComment(CommentDto comment, @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		
		int listCount = communityService.selectCommentCount(comment.getBoardNo());
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
		
		List<CommentDto> list = communityService.updateDeleteComment(comment) > 0 ? communityService.ajaxCommentSelect(comment, pi) : null;
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return map;
	}
	
	
	/**
	 * 로딩될때 댓글 ajax list 불러오기
	 */
	@ResponseBody
	@GetMapping("/ajaxCommentSelect.do")
	public ResponseEntity<?> ajaxCommentSelect(CommentDto comment
											 , @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		//comment list 갯수
		int listCount = communityService.selectCommentCount(comment.getBoardNo());
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", communityService.ajaxCommentSelect(comment, pi));
		map.put("pi", pi);
		
		return ResponseEntity.ok(map);
		
	}
	
	
	
	

}
