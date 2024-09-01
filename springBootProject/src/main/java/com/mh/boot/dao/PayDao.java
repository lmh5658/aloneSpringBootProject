package com.mh.boot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mh.boot.dto.CouponDto;
import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.PointDto;
import com.mh.boot.dto.ProductDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PayDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int ajaxkakaoPayment(OrderDto order) {
		return sqlSessionTemplate.insert("payMapper.ajaxkakaoPayment", order);
	}
	
	
	public int orderProductList(List<OrderProductDto> orderProduct) {
		return sqlSessionTemplate.insert("payMapper.orderProductList", orderProduct);
	}
	
	
	public int deleteCartList(Map<String, Object> params) {
		return sqlSessionTemplate.delete("payMapper.deleteCartList", params);
	}
	
	
	public List<ProductDto> selectCartPayList(Map<String, Object> list) {
		return sqlSessionTemplate.selectList("payMapper.selectCartPayList",  list);
	}
	
	public List<ProductDto> selectOrderProducts(Map<String, Object> params) {
		return sqlSessionTemplate.selectList("payMapper.selectOrderProducts",  params);
	}
	
	public OrderDto selectOrderInfo(int orderNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectOrderInfo",  orderNo);
	}
	
	public List<OrderProductDto> selectProductList(int orderNo) {
		return sqlSessionTemplate.selectList("payMapper.selectProductList",  orderNo);
	}

	public int insertPayPoint(Map<String, Object> map) {
		return sqlSessionTemplate.insert("payMapper.insertPayPoint",  map);
	}
	
	public PointDto selectMyPoint(int userNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectMyPoint",  userNo);
	}
	
	
	public int insertPointRecord(Map<String, Object> map) {
		return sqlSessionTemplate.insert("payMapper.insertPointRecord",  map);
	}

	public int updateCoupon(Map<String, Object> map) {
		return sqlSessionTemplate.update("payMapper.updateCoupon",  map);	
	}
	
	public List<PointDto> selectMyUsagePoint(int userNo, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("payMapper.selectMyUsagePoint", userNo, rowBounds);	
	}
	
	public int selectPointUsageCount(int userNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectPointUsageCount", userNo);	
	}
	
	public List<CouponDto> selectMyCoupon(int userNo, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("payMapper.selectMyCoupon", userNo, rowBounds);	
	}

	public int selectCouponCount(int userNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectCouponCount", userNo);	
	}
	
	public List<CouponDto> selectMyUsageCoupon(int userNo) {
		return sqlSessionTemplate.selectList("payMapper.selectMyUsageCoupon", userNo);	
	}
	
	public int selectMyOrderInfoCount(int userNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectMyOrderInfoCount", userNo);	
	}

	public List<OrderProductDto> selectMyOrderList(int userNo, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("payMapper.selectMyOrderList", userNo, rowBounds);			
	}
	
	public List<OrderDto> selectOrderDetail(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("payMapper.selectOrderDetail", map);	
	}

	public int selectDaysCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("payMapper.selectDaysCount", map);	
	}

	public List<OrderProductDto> selectDaysList(Map<String, Object> map, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("payMapper.selectDaysList", map, rowBounds);			
	}
	
	public Map<String, Object> selectOrderStateCount(int userNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectOrderStateCount", userNo);	
	}
	
	public int selectMyReviewPointCount(int userNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectMyReviewPointCount", userNo);	
	}

	public List<PointDto> selectMyReviewPointList(int userNo, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("payMapper.selectMyReviewPointList", userNo, rowBounds);	
	}
	
	public ProductDto selectDirectPayList(String productNo) {
		return sqlSessionTemplate.selectOne("payMapper.selectDirectPayList", productNo);	
	}
	
}
