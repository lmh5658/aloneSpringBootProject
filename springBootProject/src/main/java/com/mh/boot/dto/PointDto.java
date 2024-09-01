package com.mh.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class PointDto {

	
	private int pointNo;
	private int userNo;
	private String pointIssueDt;
	private String pointExpiryDt;
	private int productNo;
	private int earnPoint;
	private int reviewWriterPoint;
	private int netPoint;
	private int pointMinusAmount;
	
	private String pointUsageDt;
	private String proName;
	
	
}
