package com.mh.boot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mh.boot.dao.CommunityDao;
import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.CommentDto;
import com.mh.boot.dto.CommunityDto;
import com.mh.boot.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommunityServiceImpl implements CommunityService{

	private final CommunityDao communityDao;
	
	@Override
	public int insertBoards(CommunityDto com, List<AttachDto> attachList) {
		
		int result = communityDao.insertBoard(com);
		int aResult = 0;
		if(result > 0) {
			for(AttachDto a : attachList)
			aResult = communityDao.insertAttachment(a);			
		}
		
		return aResult == attachList.size() ? aResult : 0;
	}

	@Override
	public int selectBoardListCount(String type) {
		return communityDao.selectBoardListCount(type);
	}
	
	@Override
	public List<CommunityDto> boardList(String type, PageInfoDto pi) {
		return communityDao.boardList(type, pi);
	}

	@Override
	public List<CommunityDto> detail(CommunityDto com) {
		return communityDao.detail(com);
	}

	@Override
	public int updateIncreaseCount(CommunityDto com) {
		return communityDao.updateIncreaseCount(com);
	}

	@Override
	public int insertComment(CommentDto comment) {
		return communityDao.insertComment(comment);
	}

	@Override
	public int insertReplyComment(CommentDto comment) {
		return communityDao.insertReplyComment(comment);
	}
	
	@Override
	public List<CommentDto> selectCommentList(CommentDto comment) {
		return communityDao.selectCommentList(comment);
	}

	@Override
	public List<CommentDto> ajaxCommentSelect(CommentDto comment, PageInfoDto pi) {
		return communityDao.ajaxCommentSelect(comment, pi);
	}

	@Override
	public int selectParentCount(CommentDto comment) {
		return communityDao.selectParentCount(comment);
	}

	@Override
	public int selectRefGroupCount(CommentDto comment) {
		return communityDao.selectRefGroupCount(comment);
	}

	@Override
	public int updateAnswerCount(Map<String, Object> map) {
		return communityDao.updateAnswerCount(map);
	}

	@Override
	public int selectParentRefOrder(Map<String, Object> map) {
		return communityDao.selectParentRefOrder(map);
	}

	@Override
	public int selectStep(Map<String, Object> map) {
		return communityDao.selectStep(map);
	}

	@Override
	public int selectCommentCount(int boardNo) {
		return communityDao.selectCommentCount(boardNo);
	}

	@Override
	public int updateRefOrder(List<String> arr) {
		return communityDao.updateRefOrder(arr);
	}
	
	


}
