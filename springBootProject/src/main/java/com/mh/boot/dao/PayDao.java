package com.mh.boot.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mh.boot.dto.OrderDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class PayDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int ajaxkakaoPayment(OrderDto order) {
		return sqlSessionTemplate.insert("payMapper.ajaxkakaoPayment", order);
	}
}
