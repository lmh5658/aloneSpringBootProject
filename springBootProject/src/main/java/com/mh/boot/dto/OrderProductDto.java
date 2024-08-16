package com.mh.boot.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderProductDto {

	private int orderNo;
	private String orderProductName;
	private int orderProductNo;
	private int orderProductAmount;
	
	private int userNo;
	
	
}
