package com.mh.boot.dto;

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
public class MessageBoxDto {
	
	private int messageNo;
	private String sendId;
	private String receiveId;
	private String title;
	private String content;
	private String dateSend; //보낸날짜 기본값 SYSDATE
	private String dateRead; //읽은날짜
	private String msgCollect; //상태 회수 = > H 영구삭제=>Y 
	private String sendDelStatus; //삭제 기본값 N
	private String reDelStatus; //삭제 기본값 N
	private String custody; //보관
	
	private String sendNickName; //보낸 사람 닉네임
	private String receiveNickName; //받은 사람 닉네임

}

