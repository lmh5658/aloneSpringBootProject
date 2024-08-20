package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.MessageBoxDto;

public interface MemberService {
	
	// 로그인용 서비스
	MemberDto selectMember(MemberDto m);
	
	// 회원가입용 서비스 (아이디 중복체크도 있어야됨)
	int selectUserIdCount(String checkId); // 아이디중복체크용
	int insertMember(MemberDto m);
	
	// 마이페이지에서 정보수정용 서비스 (+ 프로필이미지만 별도로 수정)
	int updateProfileImg(MemberDto m);
	int updateMember(MemberDto m);
	
	// 회원탈퇴용 서비스 
	int deleteMember(String userId);
	
	// 닉네임 중복 체크용
	int selectNickNamecount(String checkNickName);
	
	//쪽지 저장
	int insertSend(MessageBoxDto message);
	
	//쪽지 삭제
	int updateMessage(Map<String, Object> map);
	
	MessageBoxDto selectMessage(int messageNo);
	

}
