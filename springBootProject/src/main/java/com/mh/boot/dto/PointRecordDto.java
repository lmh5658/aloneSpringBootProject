package com.mh.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class PointRecordDto {
	
	private int pointRecordNo;
	private String pointUsageDt;
	private int pointMinusAmount;
	private int userNo;
	private int pointNo;
	
}
