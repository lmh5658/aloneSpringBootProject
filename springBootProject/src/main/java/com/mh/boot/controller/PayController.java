package com.mh.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.service.MemberService;
import com.mh.boot.service.PayService;
import com.mh.boot.service.ProductService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/pay")
@RequiredArgsConstructor
@Controller
public class PayController {
	
	private final PayService payService;
	private final ProductService productService;
	private final MemberService memberService;
	
	/**
	 * 
	 * @param 결제 페이지화면
	 * 		  총 결제금액, 장바구니 리스트, 회원 정보 조회 후 pay.jsp 로 포워딩
	 */
	@GetMapping("/pay.page")
	public void payPage(HttpSession session, String totalPrice, Model model) {
		int userNo = ((MemberDto)session.getAttribute("loginUser")).getUserNo();
		MemberDto userId = (MemberDto)session.getAttribute("loginUser");
		
		model.addAttribute("cartList", productService.selectCartList(userNo));
		model.addAttribute("memberList", memberService.selectMember(userId));
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("userNo", userNo);
		
	}
	
	/**
	 * @Param 카카오 결제 
	 *  	  주문테이블 INSERT 성공시 => 주문상품테이블 INSERT => 성공시 (result 값 == orderProduct의 size() 길이값) CART 테이블 DELETE
	 *  					 실패시 => 0 전달
	 *  					 
	 */
	@ResponseBody
	@PostMapping("/ajaxkakaoPayment.do")
	public Map<String, Object> ajaxkakaoPayment(OrderDto order, HttpSession session
							     , String mail, String email
							     , String streetAddress, String address
							     , String addressDatail, String otherAddress) {
		
		MemberDto member = ((MemberDto)session.getAttribute("loginUser"));
		order.setMemberNo(member.getUserNo());
		order.setOrderEmail(mail.concat("@" + email));
		order.setOrderDetail(streetAddress.concat(streetAddress + " " + address + " " + otherAddress + " " + addressDatail));
		order.setPaymentMethod("kakaoPay");
		order.setPaymentStatus("Y");
		
		//결재한 상품 List
		List<OrderProductDto> orderProduct = order.getOrderProduct();
		int size = orderProduct.size();
		
		int userNo = member.getUserNo();
		
		//장바구니 삭제용 Map
		List<Map<String, Object>> orderP = new ArrayList();
		for(int i=0; i<size; i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("userNo", userNo);
			map.put("productNo", orderProduct.get(i).getOrderProductNo());
			orderP.add(map);
		}
	
		Map<String, Object> map = new HashMap<>();
		try {
			int result = payService.ajaxkakaoPayment(order) == 1 ? payService.orderProductList(orderProduct) : 0;
			
			int cartDelete = result != 0 ? payService.deleteCartList(orderP) : 0;
			
			map.put("success", Boolean.TRUE);
			map.put("result", cartDelete);
			
		} catch (Exception e) {
			map.put("success", Boolean.FALSE);
			map.put("error", e.getMessage());
		}
		
		return map;
		
	}
	
	
	
	

}
