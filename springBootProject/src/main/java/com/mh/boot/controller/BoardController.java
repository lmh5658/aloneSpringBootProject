package com.mh.boot.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.BoardDto;
import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ReplyDto;
import com.mh.boot.service.BoardService;
import com.mh.boot.util.FileUtil;
import com.mh.boot.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	
	
	// * 게시판 리스트 (페이징) 조회 관련 ---------------------------
	@GetMapping("/list.do")
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int currentPage
				   		   , ModelAndView mv) {
		
		int listCount = boardService.selectBoardListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<BoardDto> list = boardService.selectBoardList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping("/search.do")
	public ModelAndView search(@RequestParam(value="page", defaultValue="1") int currentPage,
							   @RequestParam Map<String, String> search,
							   ModelAndView mv) {
		
		log.debug("search: {}", search);
		
		int listCount = boardService.selectSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<BoardDto> list = boardService.selectSearchList(search, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("search", search)
		  .setViewName("board/list");
		
		return mv;
	}
	
	// * 글 작성 관련 ---------------------------------------
	@GetMapping("/registForm.page")
	public String registForm() {
		return "board/registForm";
	}
	
	@PostMapping("/regist.do")
	public String regist(BoardDto board
					   , List<MultipartFile> uploadFiles
					   , HttpSession session
					   , RedirectAttributes redirectAttributes) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		board.setBoardWriter(String.valueOf(loginUser.getUserNo()));
		
		List<AttachDto> attachList = new ArrayList<>();
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 파일 업로드
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
				
				// insert할 데이터 => AttachDto객체만들기 => attachList쌓기
				attachList.add( AttachDto.builder()
										 .filePath(map.get("filePath"))
										 .filesystemName(map.get("filesystemName"))
										 .originalName(map.get("originalName"))
										 .refType("B")
										 .build() );
			}
		}
		board.setAttachList(attachList); // 첨부파일이 없었을 경우 텅빈리스트
		
		int result = boardService.insertBoard(board);
		
		// 성공시 => alert메세지와 함께 목록페이지로 이동
		// 실패시 => alert메세지와 함께 작성페이지에 그대로
		
		redirectAttributes.addFlashAttribute("alertTitle", "게시판 작성 서비스");
		if(attachList.isEmpty() && result == 1 || !attachList.isEmpty() && result == attachList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", "게시판 작성에 성공하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "게시판 작성에 실패하였습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		
		
		return "redirect:/board/list.do";
	}
	
	// * 글 상세 관련 -----------------------------------
	// /board/increase.do?no=글번호
	@GetMapping("/increase.do") // 조회수 증가용 (내글이 아닌 게시글 클릭시에만 호출)
	public String increase(int no) {
		// 조회수 증가
		boardService.updateIncreaseCount(no);
		
		// 상세페이지 요청
		return "redirect:/board/detail.do?no=" + no;
	}
	
	// /board/detail.do?no=글번호
	@GetMapping("/detail.do") // 게시글 상세 조회용 (내가 작성한 게시글 클릭시 곧바로 호출 | 수정완료 후 곧바로 호출)
	public String detail(int no, Model model) { 
		// 상세페이지에 필요한 데이터 담아서 포워딩 
		model.addAttribute("board", boardService.selectBoard(no));
		
		return "board/detail";
	}
	
	@ResponseBody
	@GetMapping(value="/replyList.do", produces="application/json; charset=utf-8")
	public List<ReplyDto> ajaxReplyList(int no) {
		return boardService.selectReplyList(no);
	}
	
	@ResponseBody
	@PostMapping("/registReply.do")
	public String ajaxInsertReply(ReplyDto reply
								, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		reply.setReplyWriter( String.valueOf(loginUser.getUserNo()) );
		
		return boardService.insertReply(reply) > 0 ? "SUCCESS"
												   : "FAIL";
	}
	
	@ResponseBody
	@GetMapping("/removeReply.do")
	public String ajaxDeleteReply(int no) {
		return boardService.deleteReply(no) > 0 ? "SUCCESS"
												: "FAIL";
	}
	
	// * 게시글 수정 및 삭제 관련 --------------------------------------
	@PostMapping("/modifyForm.page")
	public String modifyForm(int no, Model model) {
		model.addAttribute("board", boardService.selectBoard(no));
		return "board/modifyForm";
	}
	
	@PostMapping("/modify.do")
	public String modify(BoardDto board, String[] delFileNo
					   , List<MultipartFile> uploadFiles
					   , RedirectAttributes redirectAttributes) {
		
		// 삭제할 파일에 대한 정보를 조회해두기 
		List<AttachDto> delFileList = boardService.selectDelFileList(delFileNo);
		
		// 게시글 정보 수정 (update board)
		
		// 삭제할 첨부파일 => delete attachment + 파일자체를 삭제
		// 추가할 첨부파일 => 파일들 업로드 + insert attachment
		List<AttachDto> addFileList = new ArrayList<>();
		for(MultipartFile uploadFile : uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
				addFileList.add( AttachDto.builder()
										  .originalName(map.get("originalName"))
										  .filePath(map.get("filePath"))
										  .filesystemName(map.get("filesystemName"))
										  .refType("B")
										  .refNo(board.getBoardNo())
										  .build() );
			}
		}
		
		board.setAttachList(addFileList);
		// board : 글번호, 제목, 내용, 추가시킬첨부파일에대한정보(attachList)
		
		int result = boardService.updateBoard(board, delFileNo);
		
		redirectAttributes.addFlashAttribute("alertTitle", "게시글 수정 서비스");
		if(result > 0) {
			// 성공시
			// => 삭제할 첨부파일이 있었다면 => 해당 파일 찾아서 삭제되도록
			for(AttachDto at : delFileList) {
				new File( at.getFilePath() + "/" + at.getFilesystemName() ).delete();
			}
			
			redirectAttributes.addFlashAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");			
		}else {
			// 실패시
			redirectAttributes.addFlashAttribute("alertMsg", "게시글 수정에 실패하였습니다.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/board/detail.do?no=" + board.getBoardNo();		
		
		
		
	}
	
	
	
	
	
	
	
}
