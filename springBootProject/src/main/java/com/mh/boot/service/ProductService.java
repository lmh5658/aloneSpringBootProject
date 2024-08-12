package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;

public interface ProductService {
  
  int selectProductListCount(String type);
  
  List<ProductDto> selectProductList(PageInfoDto pi, String type);
  
  ProductDto selectProduct(int no);
  
  int selectCart(Map<String, Object> map);
  
  int updateCart(Map<String, Object> map);
  
  int insertCart(Map<String, Object> map);
  
  List<ProductDto> selectCartList(int userNo);
  
  int deleteCart(Map<String, Object> map);
  
  int selectCartCheck(int userNo);
  
  int cartCountUpdate(Map<String, Object> map);
}
