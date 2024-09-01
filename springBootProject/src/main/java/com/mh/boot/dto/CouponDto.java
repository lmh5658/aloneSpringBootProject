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
public class CouponDto {

	private int couponNo;
	private String couponSerialNumber;
	private int userNo;
	private String couponUsageDt; //사용일자
	private String couponName;
	private String couponIssueDt; //발급일자
	private String couponExprityDt; //소멸일자
	private String couponStatus; //쿠폰상태 Y는 사용가능 N은 사용불가능
	
}
