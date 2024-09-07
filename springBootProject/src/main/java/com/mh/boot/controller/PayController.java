package com.mh.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mh.boot.dto.CouponDto;
import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.OrderDto;
import com.mh.boot.dto.OrderProductDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.PointDto;
import com.mh.boot.service.MemberService;
import com.mh.boot.service.PayService;
import com.mh.boot.service.ProductService;
import com.mh.boot.util.PagingUtil;

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
	private final PagingUtil pagingUtil;
	@Value("${portcode}")
	private String portCode;
	
	/**
	 * > 결제 페이지화면
	 * 	 총 결제금액, 장바구니 리스트, 회원 정보 조회 후 pay.jsp 로 포워딩
	 */
	@GetMapping("/pay.page")
	public void payPage(HttpSession session, String totalPrice,  @RequestParam("productNo") List<String> productNoArray, Model model) {

		MemberDto userId = (MemberDto)session.getAttribute("loginUser");
		
		int userNo = ((MemberDto)session.getAttribute("loginUser")).getUserNo();
	    
	    // MyBatis 매퍼에서 사용할 데이터 준비
	    Map<String, Object> params = new HashMap<>();
	    params.put("userNo", userNo);
	    params.put("productNoArray", productNoArray);
		
	    model.addAttribute("portCode", portCode);
		model.addAttribute("cartList", payService.selectCartPayList(params));
		model.addAttribute("memberList", memberService.selectMember(userId));
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("userNo", userNo);
		
	}
	
	
	
	/**
	 * > 결제 페이지화면 => 상품 상세페이지에서 구매하기 눌렀을때 장바구니 거치지않고 바로 결제화면으로
	 */
	@GetMapping("/directPay.page")
	public void payPage(HttpSession session, String totalPrice, String productNo, Model model, String amount) {

		MemberDto userId = (MemberDto)session.getAttribute("loginUser");
		
		int userNo = ((MemberDto)session.getAttribute("loginUser")).getUserNo();
	    
	    
		model.addAttribute("portCode", portCode);
		model.addAttribute("list", payService.selectDirectPayList(productNo));
		model.addAttribute("memberList", memberService.selectMember(userId));
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("amount", amount);
		model.addAttribute("userNo", userNo);
		
	}
	
	
	/**
	 * > 카카오 결제 
	 *   주문테이블 INSERT 성공시 => 주문상품테이블 INSERT => 성공시 => CART 테이블 DELETE
	 *  			    실패시 => 0 전달
	 *  					 
	 */
	@ResponseBody
	@PostMapping("/ajaxkakaoPayment.do")
	public int ajaxkakaoPayment(OrderDto order, HttpSession session
							     , String mail, String email
							     , String streetAddress, String address
							     , String addressDatail, String otherAddress
							     , @SessionAttribute("loginUser") MemberDto member
							     , String type) {
		
		order.setMemberNo(member.getUserNo());
		order.setOrderEmail(mail.concat("@" + email));
		order.setOrderDetail(streetAddress.concat(address + " " + otherAddress + " " + addressDatail));
		order.setPaymentMethod("kakaoPay");
		order.setPaymentStatus("Y");
		
		//결재한 상품 List
		List<OrderProductDto> orderProduct = order.getOrderProduct();
		int size = orderProduct.size();
		
		List<Integer> orderList = new ArrayList<>();
		for(int i=0; i<orderProduct.size(); i++) {
			orderList.add(orderProduct.get(i).getOrderProductNo());			
		}
		
		//장바구니 번호
		Map<String, Object> params = new HashMap<>();
		params.put("userNo", member.getUserNo());
		params.put("orderList", orderList);
		
		int result = payService.ajaxkakaoPayment(order) == 1 ? payService.orderProductList(orderProduct) : 0;
		int orderPk = order.getOrderNo();
		if(type.equals("cart")) {
			payService.deleteCartList(params);						
		}
		
		return orderPk;
		
	}
	
	
	
	/**
	 * > 결제 완료 페이지
	 */
	@GetMapping("/payComplete.page")
	public void payComplete(int orderNo, Model model, @SessionAttribute("loginUser") MemberDto member) {
		
		Map<String, Object> params = new HashMap<>();
		if(member != null) {
			params.put("userNo", member.getUserNo());					
		}
		params.put("orderNo", orderNo);
		
		model.addAttribute("orderPList", payService.selectOrderProducts(params));
		model.addAttribute("orderList", payService.selectOrderInfo(orderNo));
		
	}
	
	/**
	 * > 결제완료시 포인트적립 + 차감 insert + 쿠폰 사용 유무 확인후 udpate
	 */
	@ResponseBody
	@PostMapping("/ajaxPayPointCoupon.do")
	public int ajaxPayPointCoupon(int orderNo, String minusPoint
								, String redeemCoupon
								, @SessionAttribute("loginUser") MemberDto member) {

		List<OrderProductDto> productOrderList = payService.selectProductList(orderNo);
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", member.getUserNo());
		map.put("productOrderList", productOrderList);
		int insertPoint = payService.insertPayPoint(map);
		
		//차감되는 포인트가 있을 경우에만 실행
		int minusPointAmout = 0;
		if(Integer.parseInt(minusPoint) != 0) {
			map.put("minusPoint", minusPoint);
			minusPointAmout = payService.insertPointRecord(map);
		}
		
		//적용된 쿠폰이 회원가입쿠폰일경우 (사용)
		int updateCoupon = 0;
		if(redeemCoupon.equals("CPW001")) {
			map.put("couponSerialNumber", "CPW001");	
			updateCoupon = payService.updateCoupon(map);
		}
		
		
		return insertPoint;
		
	}
	
	/**
	 * > 결제, 마이페이지 쿠폰, 포인트 조회 
	 */
	@ResponseBody
	@GetMapping("/selectMyPoint.do")
	public Map<String, Object> selectMyPoint(@SessionAttribute("loginUser") MemberDto member) {
	
	    PointDto pd = payService.selectMyPoint(member.getUserNo());

	    List<CouponDto> couponList = payService.selectMyUsageCoupon(member.getUserNo());
	    
	    //메인페이지 배송현황(갯수)
	    Map<String, Object> orderMap = payService.selectOrderStateCount(member.getUserNo());

	    Map<String, Object> params = new HashMap<>();
	    params.put("earnPoint", pd.getEarnPoint()); 
	    params.put("PointMinusAmount", pd.getPointMinusAmount()); 
	    params.put("reviewWriterPoint", pd.getReviewWriterPoint()); 
	    params.put("couponList", couponList);
	    params.put("orderMap", orderMap);
	    
	    return params;
	}
	
	/**
	 * > 마이페이지 쿠폰, 포인트 내역 리스트 조회
	 */
	@ResponseBody
	@GetMapping("/selectMyPage.do")
	public Map<String, Object> selectMyPage(@SessionAttribute("loginUser") MemberDto member 
										  , @RequestParam(value="page", defaultValue="1") int currentPage){
		
		int couponListCount = payService.selectCouponCount(member.getUserNo());
		PageInfoDto couponPi = pagingUtil.getPageInfoDto(couponListCount, currentPage, 5, 6);
		PageInfoDto couponUsagePi = pagingUtil.getPageInfoDto(couponListCount, currentPage, 5, 4);
		//쿠폰 내역
		List<CouponDto> couponList = payService.selectMyCoupon(member.getUserNo(), couponPi);
				
	    int pointListCount = payService.selectPointUsageCount(member.getUserNo());
	    PageInfoDto pointPi = pagingUtil.getPageInfoDto(pointListCount, currentPage, 5, 6);
		//포인트 내역
		List<PointDto> pointList = payService.selectMyUsagePoint(member.getUserNo(), pointPi);
		
		//리뷰포인트 내역
		int reviewListCount = payService.selectMyReviewPointCount(member.getUserNo());
		PageInfoDto reviewPi = pagingUtil.getPageInfoDto(reviewListCount, currentPage, 5, 7);
		List<PointDto> pointReviewList = payService.selectMyReviewPointList(member.getUserNo(), reviewPi);
		
		Map<String, Object> params = new HashMap<>();
		params.put("couponList", couponList);
		params.put("couponPi", couponPi);
		params.put("couponUsagePi", couponUsagePi);
		
		params.put("pointList", pointList);
		params.put("pointPi", pointPi);
		
		params.put("pointReviewList", pointReviewList);
		params.put("reviewPi", reviewPi);
		params.put("userName", member.getUserName());
		
		return params;
	}
	
	
	@ResponseBody
	@GetMapping("/selectMyOrderInfo.do")
	public Map<String, Object> selectMyOrderInfo(@SessionAttribute("loginUser") MemberDto member 
										  , @RequestParam(value="page", defaultValue="1") int currentPage){
		
		int listCount = payService.selectMyOrderInfoCount(member.getUserNo());
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 13);
		
		List<OrderProductDto> orderList = payService.selectMyOrderList(member.getUserNo(), pi);
		Map<String, Object> params = new HashMap<>();
		params.put("orderList", orderList);
		params.put("pi", pi);
		
		return params;
	}
	
	@ResponseBody
	@GetMapping("/selectOrderDetail.do")
	public Map<String,Object> selectOrderDetail(String orderNo, String orderProductNo
							    			 , @SessionAttribute("loginUser") MemberDto member ) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("orderNo", orderNo);
		map.put("userNo", member.getUserNo());
		
		List<OrderDto> order = payService.selectOrderDetail(map);
		Map<String, Object> params = new HashMap<>();
		params.put("order", order);
		params.put("orderProductNo", orderProductNo);
		
		
		return params;
	}
	
	
	@ResponseBody
	@GetMapping("/selectDays.do")
	public Map<String, Object> selectDays(@RequestParam(value="type", required=false) String type
										 , @RequestParam(value="startDate", required=false) String startDate
										 , @RequestParam(value="endDate", required=false) String endDate
										 , @SessionAttribute("loginUser") MemberDto member
										 , @RequestParam(value="page", defaultValue="1") int currentPage){
		log.debug("dayData check : >>>>>>>>> {}", type);
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("userNo", member.getUserNo());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		int listCount = payService.selectDaysCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 15);

		List<OrderProductDto> orderList = payService.selectDaysList(map, pi);
		Map<String, Object> params = new HashMap<>();
		params.put("orderList", orderList);
		params.put("pi", pi);
		
		return params;
	}
			
		
	
	
	

}
