package com.mh.boot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;

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
	
	
	public int deleteCartList(List<Map<String, Object>> list) {
		return sqlSessionTemplate.delete("payMapper.deleteCartList", list);
	}
}
