package com.mh.boot.service;

import com.mh.boot.dto.OrderDto;

public interface PayService {

	int ajaxkakaoPayment(OrderDto order);
	
}
