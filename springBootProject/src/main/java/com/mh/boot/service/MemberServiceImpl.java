package com.mh.boot.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.mh.boot.dao.MemberDao;
import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.MessageBoxDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDao memberDao;

	@Override
	public MemberDto selectMember(MemberDto m) {
		return memberDao.selectMember(m);
	}

	@Override
	public int selectUserIdCount(String checkId) {
		return memberDao.selectUserIdCount(checkId);
	}

	@Override
	public int insertMember(MemberDto m) {
		return memberDao.insertMember(m);
	}

	@Override
	public int updateProfileImg(MemberDto m) {
		return memberDao.updateProfileImg(m);
	}

	@Override
	public int updateMember(MemberDto m) {
		return memberDao.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
	}

	@Override
	public int selectNickNamecount(String checkNickName) {
		return memberDao.selectNickNamecount(checkNickName);
	}

	@Override
	public int insertSend(MessageBoxDto message) {
		return memberDao.insertSend(message);
	}

	@Override
	public int updateMessage(Map<String, Object> map) {
		return memberDao.updateMessage(map);
	}

	@Override
	public MessageBoxDto selectMessage(int messageNo) {
		return memberDao.selectMessage(messageNo);
	}

	@Override
	public MemberDto selectFindUserId(MemberDto member) {
		return memberDao.selectFindUserId(member);
	}

	@Override
	public int findPwdChange(Map<String, Object> map) {
		return memberDao.findPwdChange(map);
	}

	@Override
	public int insertCoupon(Map<String, Object> map) {
		return memberDao.insertCoupon(map);
	}

	@Override
	public String selectLoginUserPwd(String userId) {
		return memberDao.selectLoginUserPwd(userId);
	}

	@Override
	public int updateUserModifyProfile(MemberDto m) {
		return memberDao.updateUserModifyProfile(m);
	}

	@Override
	public int updatePassword(Map<String, Object> map) {
		return memberDao.updatePassword(map);
	}

	@Override
	public MemberDto userSearch(Map<String, Object> map) {
		return memberDao.userSearch(map);
	}

	@Override
	public int selectEmailCheck(String mails) {
		return memberDao.selectEmailCheck(mails);
	}
	
	@Override
	public String findIdcheck(String checkNickName) {
		return memberDao.findIdcheck(checkNickName);
	}

	
	
	
	
	


}
