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
public class CommunityDto {
	
	private int postNo;
	private String postContent;
	private String postTitle;
	private int writerNo;
	private String writerNickName;
	private String postType;
	private String postUploadDt;
	private int fileStatus;
	private String postStatus;
	private int postCount;
	
	List<AttachDto> attachList;
	
	

}
