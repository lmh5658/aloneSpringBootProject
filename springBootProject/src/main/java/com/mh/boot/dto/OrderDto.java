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
	private String orderRequest; //요청사항
	private String paymentMethod; // 결제방법 ( 예)카카오결제 )
	private String orderTotalPrice;
	private String orderDate; //주문날짜
	private String paymentDate; //결제날짜
	private String paymentStatus; //결제상태 => 'Y/N' 
	private String orderState; // 배송상태 1.결재완료 2.배송준비중 3.배송중 4.배송완료
	private int userPoint; // 포인트 (총 결제 금액에서 5%) DEFAULT => 0
	private String couponMethod; // 쿠폰적용 유무? DEFAULT=> 'N' /가입쿠폰:3000원
	
	//주문상품 테이블 따로 INSERT
	private List<OrderProductDto> orderProduct;  //다수의 구매 상품 정보 주문번호/상품이름/상품번호/상품수량
	
}
