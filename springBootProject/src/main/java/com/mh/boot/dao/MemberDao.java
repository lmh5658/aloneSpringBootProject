package com.mh.boot.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.MessageBoxDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public MemberDto selectMember(MemberDto m) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMember", m);
	}

	public int selectUserIdCount(String checkId) {
		return sqlSessionTemplate.selectOne("memberMapper.selectUserIdCount", checkId);
	}

	public int insertMember(MemberDto m) {
		return sqlSessionTemplate.insert("memberMapper.insertMember", m);
	}
	
	public int insertCoupon(Map<String, Object> map) {
		return sqlSessionTemplate.insert("memberMapper.insertCoupon", map);
	}

	public int updateProfileImg(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateProfileImg", m);
	}

	public int updateMember(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateMember", m);
	}

	public int deleteMember(String userId) {
		return sqlSessionTemplate.update("memberMapper.deleteMember", userId);
	}
	
	public int selectNickNamecount(String checkNickName) {
		return sqlSessionTemplate.selectOne("memberMapper.selectNickNamecount", checkNickName);
	}
	
	public int insertSend(MessageBoxDto message) {
		return sqlSessionTemplate.insert("memberMapper.insertSend", message);
	}
	
	public int updateMessage(Map<String, Object> map) {
		return sqlSessionTemplate.update("memberMapper.updateMessage", map);
	}
	
	public MessageBoxDto selectMessage(int messageNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMessage", messageNo);
	}
	
	public MemberDto selectFindUserId(MemberDto member) {
		return sqlSessionTemplate.selectOne("memberMapper.selectFindUserId", member);
	}
	
	public int findPwdChange(Map<String, Object> map) {
		return sqlSessionTemplate.update("memberMapper.findPwdChange", map);
	}
	
	public String selectLoginUserPwd(String userId) {
		return sqlSessionTemplate.selectOne("memberMapper.selectLoginUserPwd", userId);
	}
	
	public int updateUserModifyProfile(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateUserModifyProfile", m);
	}
	
	public int updatePassword(Map<String, Object> map) {
		return sqlSessionTemplate.update("memberMapper.updatePassword", map);
	}
	

}
