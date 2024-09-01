package com.mh.boot.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mh.boot.dao.ProductDao;
import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.dto.ReviewDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

	private final ProductDao productDao;
	
	@Override
	public int selectProductListCount(String categoryType) {
		return productDao.selectProductListCount(categoryType);
	}
	
	@Override
	public List<ProductDto> selectProductList(PageInfoDto pi, Map<String, Object> map) {
		return productDao.selectProductList(pi, map);
	}

	@Override
	public ProductDto selectProduct(Map<String, Object> map) {
		return productDao.selectProduct(map);
	}

	@Override
	public int selectCart(Map<String, Object> map) {
		return productDao.selectCart(map);
	}

	@Override
	public int updateCart(Map<String, Object> map) {
		return productDao.updateCart(map);
	}

	@Override
	public int insertCart(Map<String, Object> map) {
		return productDao.insertCart(map);
	}

	@Override
	public List<ProductDto> selectCartList(int userNo) {
		return productDao.selectCartList(userNo);
	}

	@Override
	public int deleteCart(Map<String, Object> map) {
		return productDao.deleteCart(map);
	}

	@Override
	public int selectCartCheck(int userNo) {
		return productDao.selectCartCheck(userNo);
	}

	@Override
	public int cartCountUpdate(Map<String, Object> map) {
		return productDao.cartCountUpdate(map);
	}

	@Override
	public int writeReview(ReviewDto review) {
		return productDao.writeReview(review);
	}

	@Override
	public List<ReviewDto> reviewSelect(int productNo, PageInfoDto pi) {
		return productDao.reviewSelect(productNo, pi);
	}

	@Override
	public int reviewListCount(int productNo) {
		return productDao.reviewListCount(productNo);
	}

	@Override
	public int ajaxReviewDel(String reviewNo) {
		return productDao.ajaxReviewDel(reviewNo);
	}

	@Override
	public int selectMyReviewCount(int userNo) {
		return productDao.selectMyReviewCount(userNo);
	}

	@Override
	public List<ReviewDto> selectMyReviewList(int userNo, PageInfoDto pi) {
		return productDao.selectMyReviewList(userNo, pi);
	}

	@Override
	public int insertReviewPoint(Map<String, Object> map) {
		return productDao.insertReviewPoint(map);
	}

	@Override
	public int selectFilterSearchCount(Map<String, Object> map) {
		return productDao.selectFilterSearchCount(map);
	}

	@Override
	public List<ProductDto> selectFilterSearchList(Map<String, Object> map, PageInfoDto pi) {
		return productDao.selectFilterSearchList(map, pi);
	}

	@Override
	public int selectSearchCount(Map<String, Object> map) {
		return productDao.selectSearchCount(map);
	}

	@Override
	public List<ProductDto> selectSearchList(Map<String, Object> map, PageInfoDto pi) {
		return productDao.selectSearchList(map, pi);
	}

	@Override
	public List<ProductDto> selectMainProduct(PageInfoDto pi) {
		return productDao.selectMainProduct(pi);
	}

	


	
	

	

  
  
}
