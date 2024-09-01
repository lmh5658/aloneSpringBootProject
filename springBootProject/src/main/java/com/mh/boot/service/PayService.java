package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.CouponDto;
import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.PointDto;
import com.mh.boot.dto.ProductDto;

public interface PayService {

	int ajaxkakaoPayment(OrderDto order);
	
	int orderProductList(List<OrderProductDto> orderProduct);
	
	int deleteCartList(Map<String, Object> params);
	
	//장바구니에서 체크 박스 체크한 물품만 불러오기
	List<ProductDto> selectCartPayList(Map<String, Object> list);
	
	//결제완료 화면 주문상품 리스트 
	List<ProductDto> selectOrderProducts(Map<String, Object> params);
	
	//결제완료 화면 주문정보
	OrderDto selectOrderInfo(int orderNo);
	
	//결제완료 상품 번호 조회
	List<OrderProductDto> selectProductList(int orderNo);
	
	//결재완료된 상품 포인트 insert
	int insertPayPoint(Map<String, Object> map);
	
	PointDto selectMyPoint(int userNo);
	
	//쿠폰 조회
	List<CouponDto> selectMyCoupon(int userNo, PageInfoDto pi);
	
	//쿠폰 갯수조회(페이징)
	int selectCouponCount(int userNo);
	
	//포인트 차감
	int insertPointRecord(Map<String, Object> map);
	
	//쿠폰 사용
	int updateCoupon(Map<String, Object> map);
	
	//포인트 내역 리스트 조회
	List<PointDto> selectMyUsagePoint(int userNo, PageInfoDto pi);
	
	//포인트 내역 갯수조회
	int selectPointUsageCount(int userNo);
	
	//사용할수 있는 쿠폰만 조회
	List<CouponDto> selectMyUsageCoupon(int userNo);
	
	//마이페이지 주문관리 리스트조회
	int selectMyOrderInfoCount(int userNo);
	List<OrderProductDto> selectMyOrderList(int userNo, PageInfoDto pi);
	
	//마이페이지 주문관리 - 상세
	List<OrderDto> selectOrderDetail(Map<String, Object> map);
	
	//마이페이지 - 주문관리 - 날짜버튼
	int selectDaysCount(Map<String, Object> map);
	
	List<OrderProductDto>selectDaysList(Map<String, Object> map, PageInfoDto pi);
	
	//마이페이지 -메인 결제상태
	Map<String, Object> selectOrderStateCount(int userNo);
	
	//마이페이지 -리뷰 적립 리스트 조회
	int selectMyReviewPointCount(int userNo);
	
	List<PointDto> selectMyReviewPointList(int userNo, PageInfoDto pi);
	
	ProductDto selectDirectPayList(String productNo);

}
