package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.AlarmDto;
import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.CommentDto;
import com.mh.boot.dto.CommunityDto;
import com.mh.boot.dto.MessageBoxDto;
import com.mh.boot.dto.PageInfoDto;

public interface CommunityService {
	
	int insertBoards(CommunityDto com, List<AttachDto> attachList);
	
	int selectBoardListCount(String type);
	
	List<CommunityDto> boardList(Map<String, Object> map, PageInfoDto pi);
	
	CommunityDto detail(CommunityDto com);
	
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
	
	
	//게시판 검색
	int selectSearchCount(Map<String, Object> map);
	List<CommunityDto> selectSearchList(Map<String, Object> map, PageInfoDto pi);
	
	
	//게시글 좋아요테이블 insert
	int insertLike(Map<String, Object> map);
	
	//게시글 좋아요 삭제
	int deleteLike(Map<String, Object> map);
	
	//게시글 좋아요 조회
	int selectLike(Map<String, Object> map);
	
	//게시글 좋아요했는지 체크
	int selectCheckLike(Map<String, Object> map);
	
	//커뮤니티 좋아요 top3 게시글 조회
	List<CommunityDto> communityLikeTopList(PageInfoDto pi);
	
	//자유게시판(공지사항포함한 게시글)조회
	List<CommunityDto> selectBoardMerge(PageInfoDto pi);
	
	
	int updateDeleteBoard(int postNo);
	
	List<AttachDto> selectDelFileList(List<String> list);
	
	int updateWriter(CommunityDto community, List<AttachDto> attachList, List<String> fileDelNo);
	
	List<Integer> selectLikeUser(int userNo);
	
	int insertAlarmMessage(AlarmDto alarm);
	
	List<AlarmDto> selectAlarmMessage(String userId);
	
	int deleteAlarmMessage(Map<String, Object> map);
	
	int selectInfoCount(String search);
	
	List<CommunityDto> selectInfoSearch(String search, PageInfoDto pi);
	
	//알람 갯수조회
	int selectAlarmCount(String userId);
	
	
	
	
}
