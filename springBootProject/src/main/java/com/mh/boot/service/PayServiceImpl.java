package com.mh.boot.service;

import org.springframework.stereotype.Service;

import com.mh.boot.dao.PayDao;
import com.mh.boot.dto.OrderDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor	
@Service
public class PayServiceImpl implements PayService {
	
	private final PayDao payDao;

	@Override
	public int ajaxkakaoPayment(OrderDto order) {
		return payDao.ajaxkakaoPayment(order);
	}
	

}
