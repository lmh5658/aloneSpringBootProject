package com.mh.boot.controller;

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
	 * @param 도란도란 커뮤니티 게시판 리스트 출력
	 * 
	 */
	@GetMapping("/doranMain.page")
	public void doranList() {
		
	}
	
	/**
	 * 자유게시판 페이지
	 */
	@GetMapping("/board.do")
	public String boardList(@RequestParam(value="page", defaultValue="1") int currentPage, String type, Model model) {
		
		int listCount = communityService.selectBoardListCount(type);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		
		model.addAttribute("list", communityService.boardList(type, pi));
		model.addAttribute("pi", pi);
		model.addAttribute("type", type);
		
		return "community/board";
	}
	
	/**
	 * 게시판 글쓰기 Form
	 */
	@GetMapping("/writerForm.page")
	public void writeForm() {
		
	}
	
	/**
	 * 게시판 글쓰기 Insert (자유게시판 타입 =>'J', 공지사항 => 'G')
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
										 .refType("J")
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
			
			if(result == attachList.size()) {
				if ("J".equals(com.getPostType())) {
					redirectAttributes.addFlashAttribute("alert", "자유 게시글 등록 성공!");
				}
			}
			
			
		} catch (Exception e) {
			throw new FtpConnectionFailedException("에러오류 : " + e.getMessage());
		}
		
		
		return "redirect:/community/board.do?type=" + com.getPostType();
		
	}
	/**
	 * 
	 * @param 게시글 조회수 증가 => redirect:/ 게시글 상세페이지 (게시글 작성자가 아닌 사용자만 COUNT + 1)
	 * @return
	 */
	@GetMapping("/increase.do") // 조회수 증가용 (내글이 아닌 게시글 클릭시에만 호출)
	public String increase(CommunityDto com) {
		// 조회수 증가
		communityService.updateIncreaseCount(com);
		
		return "redirect:/community/detail.page?postNo=" + com.getPostNo() + "&postType=" + com.getPostType();
	}
	
	/**
	 * 
	 * @param 게시판 상세페이지 ( 게시글 리스트, 첨부파일 리스트 )
	 * @param model
	 */
	@GetMapping("/detail.page")
	public void detail(CommunityDto com, @RequestParam(value = "page", defaultValue = "1") int currentPage
					 , Model model) {
		//comment list 갯수
		
		CommentDto comment = new CommentDto();
	    comment.setBoardNo(com.getPostNo());
	    
	    int listCount = communityService.selectCommentCount(comment.getBoardNo());
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
	    
		
	    model.addAttribute("board",communityService.detail(com));
		model.addAttribute("commentList", communityService.ajaxCommentSelect(comment, pi));
	}
	
	
	
	/**댓글 --------------------------------------
	 * 댓글INSERT
	 */
	@ResponseBody
	@PostMapping("/insertComment.do")
	public ResponseEntity<?> insertComment(@RequestParam(value = "page", defaultValue = "1") int currentPage
										, @RequestParam(value="reply", required=false) String reply
										, CommentDto comment
										, @RequestParam(value = "arr[]", required = false) List<String> arr
										, @SessionAttribute("loginUser") MemberDto member) {
		
		
		log.debug("arrList >>>>>>>>>>>>> : {}", arr);
		//comment list 갯수
		int listCount = communityService.selectCommentCount(comment.getBoardNo());
		
		PageInfoDto pi = (PageInfoDto)pagingUtil.getPageInfoDto(listCount, currentPage, 5, 20);
		
		
		int result = 0;
		int key = 0;
		
		
		
		
		if (reply != null && reply.equals("부모댓글")) {
			
			int refCount = communityService.selectRefGroupCount(comment);
			
			comment.setUserNo(member.getUserNo());
			comment.setUserNickName(member.getNickName());
			comment.setRefGroup( refCount + 1 );
			
            result = communityService.insertComment(comment);
            key = comment.getId();
            
        }else{
        	
        	//parent_num => id count갯수 알아오기
        	//int count = communityService.selectParentCount(comment);
        	Map<String, Object> map = new HashMap<>();
        	map.put("id", comment.getId());
        	map.put("boardNo", comment.getBoardNo());
        	
        	int refOrderCount = communityService.selectParentRefOrder(map);
        	
        	//대데대댓글 구별해서 
        	if(reply != null && reply.equals("대대대댓글")) {
        		
        		//refOrder => 뒤에 있는 refOrder번호를 본인이 갖는다.
        		if(arr != null && !arr.isEmpty()) {
        			communityService.updateRefOrder(arr);
        			
        			comment.setRefOrder(comment.getRefOrder());
            		//같은 그룹에 속한 뒤에있는 댓글들  (refOrder + 1) update
            		
        		}else {
        			comment.setRefOrder(refOrderCount + 1);
        		}
        		
        	//대댓글
			}else{
				
	        	comment.setRefOrder(refOrderCount + 1);
	        	
			}
        	
        	
        	
        	//자식 갯수 업데이트
        	int answerUpdate = communityService.updateAnswerCount(map);
        	int stepCount = communityService.selectStep(map);
        	
        	comment.setUserNo(member.getUserNo());
			comment.setUserNickName(member.getNickName());
			
			comment.setStep(stepCount + 1);
			comment.setParentNum(comment.getId());
			
			result = communityService.insertComment(comment);
			key = comment.getId();
			
        }
		
		List<CommentDto> list =  (result > 0) ? communityService.ajaxCommentSelect(comment, pi) : null; 
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		if(reply != null && reply.equals("대대대댓글") || reply.equals("대댓글")) {
			map.put("key", key);
		}
		
		return ResponseEntity.ok(map);
		
		
	}
	
	
	
	/*
	@ResponseBody
	@GetMapping("/updateComment.do")
	public void updateComment() {
		
	}
	
	@ResponseBody
	@GetMapping("/updateDeleteComment.do")
	public void updateDeleteComment() {
		
		
	}
	*/
	
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
