package com.mh.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.OrderDto;
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
		
	}
	
	/**
	 * @Param 카카오 결제 INSERT
	 */
	@ResponseBody
	@PostMapping("/ajaxkakaoPayment.do")
	public int ajaxkakaoPayment(@ModelAttribute OrderDto order, HttpSession session
							     , String mail, String Email
							     , String streetAddress, String address
							     , String addressDatail, String otherAddress) {
		
		MemberDto member = ((MemberDto)session.getAttribute("loginUser"));
		order.setMemberNo(member.getUserNo());
		order.setOrderEmail(mail.concat("@" + Email));
		order.setOrderDetail(streetAddress.concat(streetAddress + " " + address + " " + otherAddress + " " + addressDatail));
		
		return payService.ajaxkakaoPayment(order);
		
	}
	

}
