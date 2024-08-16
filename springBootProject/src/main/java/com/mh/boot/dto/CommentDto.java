package com.mh.boot.dto;

import java.util.List;

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
public class CommentDto {
	
	private int id;
	private int answerNum; // 댓글의 자식 갯수
	private String content; // 댓글내용
	private int refGroup; // 1번 댓글은 1번그룹 / 2번댓글은 2번 그룹
	private int refOrder; //댓글단 최상위  + 1
	private int step; //부모댓글의 + 1
	private int parentNum; // 부모의 id번호
	private int boardNo; //게시글번호
	private String registDt;//생성날짜
	private String modifyDt;//수정날짜
	private String delYN; //삭제여부 기본값=>'N'
	private int userNo; //작성자번호
	private String userNickName; //작성자닉네임
	
	private List<Object> arr;

	
	
	
	
	
}
