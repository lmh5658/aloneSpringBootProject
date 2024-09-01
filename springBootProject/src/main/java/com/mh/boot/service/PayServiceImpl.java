package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mh.boot.dao.PayDao;
import com.mh.boot.dto.CouponDto;
import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.PointDto;
import com.mh.boot.dto.ProductDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor	
@Service
public class PayServiceImpl implements PayService {
	
	private final PayDao payDao;

	@Override
	public int ajaxkakaoPayment(OrderDto order) {
		return payDao.ajaxkakaoPayment(order);		
	}
		
	@Override
	public int orderProductList(List<OrderProductDto> orderProduct) {
		return payDao.orderProductList(orderProduct);
	}	

	@Override
	public int deleteCartList(Map<String, Object> params) {
		return payDao.deleteCartList(params);
	}

	@Override
	public List<ProductDto> selectCartPayList(Map<String, Object> list) {
		return payDao.selectCartPayList(list);
	}

	@Override
	public List<ProductDto> selectOrderProducts(Map<String, Object> params) {
		return payDao.selectOrderProducts(params);
	}

	@Override
	public OrderDto selectOrderInfo(int orderNo) {
		return payDao.selectOrderInfo(orderNo);
	}

	@Override
	public List<OrderProductDto> selectProductList(int orderNo) {
		return payDao.selectProductList(orderNo);
	}

	@Override
	public int insertPayPoint(Map<String, Object> map) {
		return payDao.insertPayPoint(map);
	}

	@Override
	public PointDto selectMyPoint(int userNo) {
		return payDao.selectMyPoint(userNo);
	}

	@Override
	public int insertPointRecord(Map<String, Object> map) {
		return payDao.insertPointRecord(map);
	}

	@Override
	public int updateCoupon(Map<String, Object> map) {
		return payDao.updateCoupon(map);
	}

	@Override
	public List<PointDto> selectMyUsagePoint(int userNo, PageInfoDto pi) {
		return payDao.selectMyUsagePoint(userNo, pi);
	}

	@Override
	public int selectPointUsageCount(int userNo) {
		return payDao.selectPointUsageCount(userNo);
	}

	@Override
	public List<CouponDto> selectMyCoupon(int userNo, PageInfoDto pi) {
		return payDao.selectMyCoupon(userNo, pi);
	}

	@Override
	public int selectCouponCount(int userNo) {
		return payDao.selectCouponCount(userNo);
	}

	@Override
	public List<CouponDto> selectMyUsageCoupon(int userNo) {
		return payDao.selectMyUsageCoupon(userNo);
	}

	@Override
	public int selectMyOrderInfoCount(int userNo) {
		return payDao.selectMyOrderInfoCount(userNo);
	}

	@Override
	public List<OrderProductDto> selectMyOrderList(int userNo, PageInfoDto pi) {
		return payDao.selectMyOrderList(userNo, pi);
	}

	@Override
	public List<OrderDto> selectOrderDetail(Map<String, Object> map) {
		return payDao.selectOrderDetail(map);
	}

	@Override
	public int selectDaysCount(Map<String, Object> map) {
		return payDao.selectDaysCount(map);
	}

	@Override
	public List<OrderProductDto> selectDaysList(Map<String, Object> map, PageInfoDto pi) {
		return payDao.selectDaysList(map, pi);
	}

	@Override
	public Map<String, Object> selectOrderStateCount(int userNo) {
		return payDao.selectOrderStateCount(userNo);
	}

	@Override
	public int selectMyReviewPointCount(int userNo) {
		return payDao.selectMyReviewPointCount(userNo);
	}

	@Override
	public List<PointDto> selectMyReviewPointList(int userNo, PageInfoDto pi) {
		return payDao.selectMyReviewPointList(userNo, pi);
	}

	@Override
	public ProductDto selectDirectPayList(String productNo) {
		return payDao.selectDirectPayList(productNo);
	}

	

	



	

	

	
	

}
