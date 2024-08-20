package com.mh.boot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.CommentDto;
import com.mh.boot.dto.CommunityDto;
import com.mh.boot.dto.MessageBoxDto;
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
	
	int selectRefGroupCount(CommentDto comment);
	
	int updateAnswerCount(Map<String, Object> map);
	
	int selectParentRefOrder(Map<String, Object> map);
	
	int selectStep(Map<String, Object> map);
	
	//페이지갯수
	int selectCommentCount(int boardNo);
	
	int updateRefOrder(List<String> arr);
	
	int updateComment(CommentDto comment);
	
	int updateDeleteComment(CommentDto comment);
	
	int selectMessageListCount(Map<String, Object> sendMap);
	
	List<MessageBoxDto> ajaxSelectMessageList(Map<String, Object> map, PageInfoDto pi);
	
	int selectNoReadCount(String userId);
	
	int selectReplyRefGropCount(Map<String, Object> map);
	
	List<Integer> selectNextRefGroupId(Map<String, Object> map);
	
	
	int checkAnswerNum(Map<String, Object> map);
	
	int selectReplyRefOrder(Map<String, Object> map);
	
	List<Integer> selectNextRefOrders(Map<String, Object> map);
	
	int updateNextRefGroupId(List<Integer> list);
	
	int selectRefOrder(Map<String, Object>map);
	
}
