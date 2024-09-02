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
public class AlarmDto {
	
	private int alarmNo;
	private String alarmContent;
	private String userId;
	private int postNo;
	private String postType;
}
