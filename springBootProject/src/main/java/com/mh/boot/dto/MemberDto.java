package com.mh.boot.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class MemberDto {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String birthDate;
	private String nickName;
	private String phone;
	private String email;
	private String mail;	
	private String address;
	private String addressDatail;
	private String enrollDate;
	private String modifyDate;
	private String userType;
	private String userStatus;
	private String userPath;
	private String streetAddress;
	private String otherAddress;
	private int point; //default => 0
	private String coupon; // default => '가입' (가입시 3000원할인쿠폰)
	
}
