package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.dto.ReviewDto;

public interface ProductService {
  
  int selectProductListCount(String type);
  
  List<ProductDto> selectProductList(PageInfoDto pi, String type);
  
  ProductDto selectProduct(Map<String, Object> map);
  
  int selectCart(Map<String, Object> map);
  
  int updateCart(Map<String, Object> map);
  
  int insertCart(Map<String, Object> map);
  
  List<ProductDto> selectCartList(int userNo);
  
  int deleteCart(Map<String, Object> list);
  
  int selectCartCheck(int userNo);
  
  int cartCountUpdate(Map<String, Object> map);
  
  int writeReview(ReviewDto review);
  
  List<ReviewDto> reviewSelect(int productNo, PageInfoDto pi);
  
  int reviewListCount(int productNo);

}
