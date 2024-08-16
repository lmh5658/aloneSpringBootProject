package com.mh.boot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.CommentDto;
import com.mh.boot.dto.CommunityDto;
import com.mh.boot.dto.PageInfoDto;

public interface CommunityService {
	
	int insertBoards(CommunityDto com, List<AttachDto> attachList);
	
	int selectBoardListCount(String type);
	
	List<CommunityDto> boardList(String type, PageInfoDto pi);
	
	List<CommunityDto> detail(CommunityDto com);
	
	int updateIncreaseCount(CommunityDto com);
	
	int insertComment(CommentDto comment);
	
	int insertReplyComment(CommentDto comment);
	
	List<CommentDto> selectCommentList(CommentDto comment);

	List<CommentDto> ajaxCommentSelect(CommentDto comment, PageInfoDto pi);
	
	int selectParentCount(CommentDto comment);
	
	int selectRefGroupCount(CommentDto comment);
	
	int updateAnswerCount(Map<String, Object> map);
	
	int selectParentRefOrder(Map<String, Object> map);
	
	int selectStep(Map<String, Object> map);
	
	//페이지갯수
	int selectCommentCount(int boardNo);
	
	int updateRefOrder(List<String> arr);
}
