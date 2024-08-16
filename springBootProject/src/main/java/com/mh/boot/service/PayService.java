package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;

public interface PayService {

	int ajaxkakaoPayment(OrderDto order);
	
	int orderProductList(List<OrderProductDto> orderProduct);
	
	int deleteCartList(List<Map<String, Object>> list);
	
}
