package com.mh.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.dto.ReviewDto;
import com.mh.boot.service.ProductService;
import com.mh.boot.util.FileUtil;
import com.mh.boot.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/product")
@RequiredArgsConstructor
@Controller
@Slf4j
public class ProductController {
  
  private final ProductService productService;
  private final PagingUtil pagingUtil;
  private final FileUtil fileUtil;
  
  
  /**
   * > 전체 상품 리스트 조회
   */
  @GetMapping("/list.do")
  public String allProductList() {
	  return "product/list";
  }
  /**
   * > 전체 상품 검색 리스트 따로 조회
   */
  @GetMapping("/allProductSearch.do")
  public void allProductSearch(@RequestParam(value="page", defaultValue="1") int currentPage
							  , HttpSession session, Model model, String search) {
	  
	  Map<String, Object> params = new HashMap<>();
	  params.put("search", search);
	  int listCount = productService.selectSearchCount(params);
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 12);
	  
	  List<ProductDto> list = productService.selectSearchList(params, pi);
	  
	  model.addAttribute("list", list);
	  model.addAttribute("pi", pi);
	  model.addAttribute("search", search);
	
  }
  
  /**
   * > Ajax 전체 상품 리스트 조회
   */
  @ResponseBody
  @GetMapping("/ajaxProductList.do")
  public Map<String, Object> ajaxProductList(@RequestParam(value="page", defaultValue="1") int currentPage
                         		   		, HttpSession session) {
	  
    String categoryType = "";
    int listCount = productService.selectProductListCount(categoryType);
    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 12);
    Map<String, Object> map = new HashMap<>();
    map.put("categoryType", categoryType);
    List<ProductDto> list = productService.selectProductList(pi, map);
    
    Map<String, Object> response = new HashMap<>();
    response.put("list", list);
    response.put("pi", pi);
    
    return response;
  }
  
  /**
   * > 고양이 상품 리스트 조회
   */
  @GetMapping("/catProductList.do")
  public String catProductList() {
	return "product/catProductList";
  }
  
  /**
   * > Ajax 고양이 상품 리스트 조회
   */
  @ResponseBody
  @GetMapping("/ajaxCatProductList.do")
  public Map<String, Object> ajaxCatProductList(@RequestParam(value="page", defaultValue="1") int currentPage
                         		  , HttpSession session) {
	  
	String categoryType = "C";
    int listCount = productService.selectProductListCount(categoryType);
    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 12);
    Map<String, Object> map = new HashMap<>();
    map.put("categoryType", categoryType);
    List<ProductDto> list = productService.selectProductList(pi, map);
    
    Map<String, Object> response = new HashMap<>();
    response.put("list", list);
    response.put("pi", pi);
    
    return response;
  }
  
  
  /**
   * > 강아지 상품 리스트 조회
   */
  @GetMapping("/dogProductList.do")
  public String dogProductList() {
	  return "product/dogProductList";
  }
  
  /**
   * > Ajax 강아지 상품 리스트 조회
   */
  @ResponseBody
  @GetMapping("/ajaxDogProductList.do")
  public Map<String, Object> dogProductList(@RequestParam(value="page", defaultValue="1") int currentPage
                         		   		, HttpSession session) {
    
	String categoryType = "D";
    int listCount = productService.selectProductListCount(categoryType);
    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 12);
    Map<String, Object> map = new HashMap<>();
    map.put("categoryType", categoryType);
    List<ProductDto> list = productService.selectProductList(pi, map);
    
    Map<String, Object> response = new HashMap<>();
    response.put("list", list);
    response.put("pi", pi);
    
    return response;
  }
  
  /**
   * > ajax 필터 검색용
   */
  @ResponseBody
  @GetMapping("/selectFilterSearch.do")
  public Map<String, Object> selectFilterSearch(@RequestParam(value="weight[]", required=false) List<String> weight
		  					   , @RequestParam(value="size[]", required=false) List<String> size
		  					   , @RequestParam(value="functional[]", required=false) List<String> functional
		  					   , @RequestParam(value="price[]", required=false) List<String> price 
	  						   , @RequestParam(value="rating[]", required=false) List<String> rating
	  						   , @RequestParam(value="salaryTarget[]", required=false) List<String> salaryTarget
	  						   , @RequestParam(required=false) String type
	  						   , @RequestParam(value="page", defaultValue="1") int currentPage) {
	  
	  Map<String, Object> paramMap = new HashMap<>();
	  paramMap.put("weight", weight);
	  paramMap.put("size", size);
	  paramMap.put("functional", functional);
	  paramMap.put("rating", rating);
	  paramMap.put("type", type);
	  paramMap.put("salaryTarget", salaryTarget);
	 
	  paramMap.put("nocheck", "nocheck");
	  
	  if (price != null && !price.isEmpty()) {
		  
		    List<Map<String, Object>> priceList = new ArrayList<>();
		    for (String item : price) {
		        String[] parts = item.split("~");
		        Map<String, Object> map = new HashMap<>();
		        
		        if (parts.length == 2) {
		            // 두 개의 값이 있는 경우, 범위로 처리
		            map.put("firstPrice", parts[0].trim());
		            map.put("lastPrice", parts[1].trim());
		        } else {
		            // 하나의 값만 있는 경우, 최소값으로 처리
		            map.put("firstPrice", parts[0].trim());
		        }
		        
		        priceList.add(map);
		    }
		    paramMap.put("priceList", priceList);
		    
	  }
	  
	  int listCount = productService.selectFilterSearchCount(paramMap);
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 12);
	  
	  List<ProductDto> list = productService.selectFilterSearchList(paramMap, pi);
	  
	  Map<String, Object> response = new HashMap<>();
	  response.put("list", list);
	  response.put("pi", pi);
	  
	  log.debug("list : {}>>>>>>>" , list);
	  
	  return response;
  }
  
  @ResponseBody
  @GetMapping("/ajaxProductSearch.do")
  public Map<String, Object> ajaxProductSearch(@RequestParam(value="page", defaultValue="1") int currentPage, String search
		  									, @RequestParam(required=false) String type){
	  
	  Map<String, Object> params = new HashMap<>();
	  params.put("search", search);
	  params.put("type", type);
	  int listCount = productService.selectSearchCount(params);
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 12);
	  
	  List<ProductDto> list = productService.selectSearchList(params, pi);
	  
	  Map<String, Object> response = new HashMap<>();
	  response.put("list", list);
	  response.put("pi", pi);
	  response.put("type", type);
	  response.put("search", search);
	  
	  return response;
	  
  }
  

  
  
  
  
  
  
  @GetMapping("/registForm.page")
  public String registForm() {
    return "notice/registForm";
  }
  
  @GetMapping("/detail.page") 
  public String detail(@RequestParam(value="page", defaultValue="1") int currentPage, int productNo, Model model, RedirectAttributes redirectAttributes
		  			  , HttpSession session) {
	  
	  int listCount = productService.reviewListCount(productNo);
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 5);
	  
	  List<ReviewDto> list = new ArrayList<>();
	  
	  Map<String, Object> map = new HashMap<>();
	  map.put("productNo", productNo);
	  if(session.getAttribute("loginUser") != null && !session.getAttribute("loginUser").equals("")) {
		  map.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());		  
	  }
	  
      model.addAttribute("list", productService.selectProduct(map));
      model.addAttribute("reviewList", productService.reviewSelect(productNo, pi));
      
      return "product/pDetail";
  }
  
  
  /**
   * 
   * @param 장바구니 페이지
   * @return
   */
  @GetMapping("/cart.page") 
  public String cartPage(HttpSession session, Model model) {
	  
	  int userNo =  ((MemberDto)session.getAttribute("loginUser")).getUserNo();
	  
	  model.addAttribute("cartList", productService.selectCartList(userNo));
	  
	  return "product/cart";
  }

  /**
   * 
   * @param 장바구니 체크(SELECT)후 INSERT 0R UPDATE
   * @return 체크 => 0이상이면 UDPATE 기존 수량 + 1
   * 			 => 그게아니면 INSERT 
   */
  @ResponseBody
  @GetMapping("/insertCart.do")
  public int insertCart(int productNo, @RequestParam(required=false, defaultValue="1") int count, HttpSession session) {
	  
	  int userNo = ((MemberDto)session.getAttribute("loginUser")).getUserNo();
	  Map<String, Object> map = new HashMap<>();
	  map.put("userNo", userNo);
	  map.put("productNo", productNo);
	  map.put("count", count);
	  
	  int result = productService.selectCart(map);
	  
	  if(result > 0) {
		  int updateCart = productService.updateCart(map);
	  }else {
		  int insertCart = productService.insertCart(map);
	  }
	  
	  return productService.selectCartCheck(userNo);
  }
  
  /**
   * 
   * @param 장바구니 상품 삭제
   * @return DELETE
   */
  @ResponseBody
  @GetMapping("/deleteCart.do")
  public int deleteCart(int productNo, HttpSession session) {
	  

	    Map<String, Object> map = new HashMap<>();
	    map.put("userNo", ((MemberDto) session.getAttribute("loginUser")).getUserNo());
	    map.put("productNo", productNo);

	    return productService.deleteCart(map);
  }
  
  @ResponseBody
  @GetMapping("/cartCountUpdate.do")
  public int cartCountUpdate(int productNo, String division, HttpSession session) {
	  
	  Map<String, Object> map = new HashMap<>();
	  map.put("productNo", productNo);
	  map.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());
	  map.put("division", division);
	  
	  return productService.cartCountUpdate(map);
  }
  
  
  /**
   * 
   * @param ajax 리뷰 작성
   * @return
   */
  @ResponseBody
  @PostMapping("/writeReview.do")
  public ResponseEntity<?> writeReview(@RequestParam(value="page", defaultValue="1") int currentPage, @ModelAttribute ReviewDto review, HttpSession session
		  							 , int productNo, @RequestParam(required=false) String type) {
	  
	  int listCount = productService.reviewListCount(productNo);
	  
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 5);
	  
	  Map<String, Object> map = new HashMap<>();
	  List<ReviewDto> list = new ArrayList<>();
	  
	 
	  
	  try {
		  
		  if (session.getAttribute("loginUser") != null && review != null) {
			  review.setMemberNo(((MemberDto)session.getAttribute("loginUser")).getUserNo());
			  review.setNickName(((MemberDto)session.getAttribute("loginUser")).getNickName());
		      productService.writeReview(review);
		   }
		  
		  //리뷰적립
		  if(type != null && !type.isEmpty()) {
			 Map<String, Object> params = new HashMap<>();
			 params.put("productNo", productNo);
			 params.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());
			productService.insertReviewPoint(params); 
		  }
		  
		  list =  productService.reviewSelect(productNo, pi);
		  map.put("list", list);
		  map.put("pi", pi);
		  if((MemberDto)session.getAttribute("loginUser") != null) {
			  map.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());		  
		  }
		  
	  } catch (Exception e) {
		  throw new FtpConnectionFailedException("리뷰 오류 : " + e.getMessage());
	  }
	  
	  return ResponseEntity.ok(map);
	  
  }
  
  /**
   * > ajax 리뷰 게시판 조회
   */
  @ResponseBody
  @GetMapping("/reviewList.do")
  public ResponseEntity<?> reviewList(@RequestParam(value="page", defaultValue="1") int currentPage, HttpSession session, int productNo) {
	  
	  int listCount = productService.reviewListCount(productNo);
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 5);
	  
	  Map<String, Object> map = new HashMap<>();
	  map.put("list", productService.reviewSelect(productNo, pi));
	  map.put("pi", pi);
	  if((MemberDto)session.getAttribute("loginUser") != null) {
		  map.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());		  
	  }
	  
	  return ResponseEntity.ok(map);
	  
  }
  
  
  /**
   * > ajax 상품 상세페이지(관련상품 리스트 조회)
   */
  @ResponseBody
  @GetMapping("/ajaxOtherProductList.do")
  public ResponseEntity<?> ajaxOtherProductList(@RequestParam(value="page", defaultValue="1") int currentPage
  											  , int productNo, String categoryType){
	  
	  //int listCount = productService.selectProductListCount(categoryType);
	  PageInfoDto pi = pagingUtil.getPageInfoDto(15, currentPage, 2, 5);
	  
	  Map<String, Object> map = new HashMap<>();
	  map.put("categoryType", categoryType);
	  map.put("productNo", productNo);
	  
	  List<ProductDto> otherList = productService.selectProductList(pi, map);
	  
	  Map<String, Object> response = new HashMap<>();
	  response.put("otherList", otherList);
	  response.put("pi", pi);
	  
	  return ResponseEntity.ok(response);
	  
  }
  
  
  /**
   * >리뷰글 삭제 ajax
   */
  @ResponseBody
  @GetMapping("/ajaxReviewDel.do")
  public ResponseEntity<?> ajaxReviewDel(String reviewNo, @RequestParam(value="page", defaultValue="1") int currentPage, HttpSession session, int productNo) {
	  
	  int result = productService.ajaxReviewDel(reviewNo);
	  Map<String, Object> map = new HashMap<>();
	  if(result > 0) {
		  int listCount = productService.reviewListCount(productNo);
		  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 5);
		  
		  
		  map.put("list", productService.reviewSelect(productNo, pi));
		  map.put("pi", pi);
		  if((MemberDto)session.getAttribute("loginUser") != null) {
			  map.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());		  
		  }
		  return ResponseEntity.ok(map);
	  }else {
		  return ResponseEntity.ok(result);
		  
	  }	  
  }
  
  
  @ResponseBody
  @GetMapping("/selectMyReview.do")
  public ResponseEntity<?> selectMyReview(@RequestParam(value="page", defaultValue="1") int currentPage
		  								, @SessionAttribute("loginUser") MemberDto member) {
	 
	  int listCount = productService.selectMyReviewCount(member.getUserNo());
	  PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 4, 8);
	  
	  
	  Map<String, Object> response = new HashMap<>();
	  response.put("reviewList", productService.selectMyReviewList(member.getUserNo(), pi));
	  response.put("pi", pi);
	  
	  return ResponseEntity.ok(response);
	  
  }
  
  
  
  @ResponseBody
  @GetMapping("/selectMainProduct.do")
  public ResponseEntity<?> selectMainProduct(@RequestParam(value="page", defaultValue="1") int currentPage){
	  
	  
	  PageInfoDto pi = pagingUtil.getPageInfoDto(10, currentPage, 2, 5);
	  List<ProductDto> list = productService.selectMainProduct(pi);
	  
	  Map<String, Object> response = new HashMap<>();
	  response.put("list", list);
	  response.put("pi", pi);
	  
	  return ResponseEntity.ok(response);
  }
  
  
}
