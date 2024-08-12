package com.mh.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mh.boot.dto.MemberDto;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.service.ProductService;
import com.mh.boot.util.FileUtil;
import com.mh.boot.util.PagingUtil;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/product")
@RequiredArgsConstructor
@Controller
public class ProductController {
  
  // 평가문제 : 공지사항서비스 구현하기
  
  private final ProductService productService;
  private final PagingUtil pagingUtil;
  private final FileUtil fileUtil;
  
  
  @GetMapping("/list.do")
  public ModelAndView list(@RequestParam(value="page"
                                       , defaultValue="1") int currentPage
                         , ModelAndView mv
                         , String type
                         , HttpSession session) {
    
    int listCount = productService.selectProductListCount(type);
    PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 9);
    List<ProductDto> list = productService.selectProductList(pi, type);
    
    mv.addObject("pi", pi)
      .addObject("list", list)
      .addObject("type", type)
      .setViewName("product/list");
    
    return mv;
  }
  
  @GetMapping("/registForm.page")
  public String registForm() {
    return "notice/registForm";
  }
  
  @GetMapping("/detail.page") 
  public String detail(int no, Model model, RedirectAttributes redirectAttributes) {
      model.addAttribute("list", productService.selectProduct(no));
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
  public int insertCart(int productNo, HttpSession session) {
	  
	  int userNo = ((MemberDto)session.getAttribute("loginUser")).getUserNo();
	  Map<String, Object> map = new HashMap<>();
	  map.put("userNo", userNo);
	  map.put("productNo", productNo);
	  
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
	  map.put("userNo", ((MemberDto)session.getAttribute("loginUser")).getUserNo());
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
  
 
  
  
}
