package com.mh.boot.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mh.boot.dto.AttachDto;
import com.mh.boot.dto.CommentDto;
import com.mh.boot.dto.CommunityDto;
import com.mh.boot.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CommunityDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int insertBoard(CommunityDto com) {
		return sqlSessionTemplate.insert("communityMapper.insertBoard", com);
	}
	
	public int insertAttachment(AttachDto attachList) {
		return sqlSessionTemplate.insert("communityMapper.insertAttachment", attachList);
	}
	
	public int selectBoardListCount(String type) {
		return sqlSessionTemplate.selectOne("communityMapper.selectBoardListCount", type);
	}
	
	public List<CommunityDto> boardList(String type, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("communityMapper.boardList", type, rowBounds);
	}
	
	public List<CommunityDto> detail(CommunityDto com) {
		return sqlSessionTemplate.selectList("communityMapper.detail", com);
	}
	
	public int updateIncreaseCount(CommunityDto com) {
		return sqlSessionTemplate.update("communityMapper.updateIncreaseCount", com);
	}
	
	public int insertComment(CommentDto comment) {
		return sqlSessionTemplate.insert("communityMapper.insertComment", comment);
	}
	
	public int insertReplyComment(CommentDto comment) {
		return sqlSessionTemplate.insert("communityMapper.insertReplyComment", comment);
	}
	
	
	public List<CommentDto> selectCommentList(CommentDto comment) {
		return sqlSessionTemplate.selectList("communityMapper.selectCommentList", comment);
	}	
	
	
	public List<CommentDto> ajaxCommentSelect(CommentDto comment, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("communityMapper.ajaxCommentSelect", comment, rowBounds);
	}	
	
	public int selectParentCount(CommentDto comment){
		return sqlSessionTemplate.selectOne("communityMapper.selectParentCount", comment);
	}
	
	public int selectRefGroupCount(CommentDto comment){
		return sqlSessionTemplate.selectOne("communityMapper.selectRefGroupCount", comment);
	}
	
	public int updateAnswerCount(Map<String, Object> map){
		return sqlSessionTemplate.update("communityMapper.updateAnswerCount", map);
	}
	
	public int selectParentRefOrder(Map<String, Object> map){
		return sqlSessionTemplate.selectOne("communityMapper.selectParentRefOrder", map);
	}
	
	public int selectStep(Map<String, Object> map){
		return sqlSessionTemplate.selectOne("communityMapper.selectStep", map);
	}
	
	public int selectCommentCount(int boardNo){
		return sqlSessionTemplate.selectOne("communityMapper.selectCommentCount", boardNo);
	}
	
	public int updateRefOrder(List<String> array){
		return sqlSessionTemplate.update("communityMapper.updateRefOrder", array);
	}
}
