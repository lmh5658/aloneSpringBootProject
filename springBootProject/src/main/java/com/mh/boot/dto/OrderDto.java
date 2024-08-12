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
public class OrderDto {
	
	
	private int orderNo;
	private int memberNo;
	private String orderName;
	private String orerPhone;
	private String orderEmail;
	private String orderDetail;
	private String orderRequest;
	private String paymentMethod; // 결제방법 ( 예)카카오결제 )
	private String orderTotalPrice;
	private String orderDate;
	private String paymentDate;
	private String paymentStatus;
	
	List<Integer> productNo; // 구매한 상품 번호
	List<Integer> productAmount; //구매한 상품 수량
	
}
