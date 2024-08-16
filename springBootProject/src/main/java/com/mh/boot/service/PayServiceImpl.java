package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mh.boot.dao.PayDao;
import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;

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
	public int deleteCartList(List<Map<String, Object>> list) {
		return payDao.deleteCartList(list);
	}

	



	

	

	
	

}
