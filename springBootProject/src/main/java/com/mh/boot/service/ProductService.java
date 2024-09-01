package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.dto.ReviewDto;

public interface ProductService {
  
  int selectProductListCount(String categoryType);
  
  List<ProductDto> selectProductList(PageInfoDto pi, Map<String, Object> map);
  
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
  
  //리뷰글 삭제
  int ajaxReviewDel(String reviewNo);

  //리뷰글 조회
  int selectMyReviewCount(int userNo);
  
  List<ReviewDto> selectMyReviewList(int userNo, PageInfoDto pi);
  
  //리뷰글 작성시 포인트 적립
  int insertReviewPoint(Map<String, Object> map);
  
  //필터 검색 갯수
  int selectFilterSearchCount(Map<String, Object> map);
  
  //필터 리스트 조회
  List<ProductDto> selectFilterSearchList(Map<String, Object> map, PageInfoDto pi);
  
  //전체검색
  int selectSearchCount(Map<String, Object> map);
  
  List<ProductDto> selectSearchList(Map<String, Object> map, PageInfoDto pi);
  
  List<ProductDto> selectMainProduct(PageInfoDto pi);
 
  
}
