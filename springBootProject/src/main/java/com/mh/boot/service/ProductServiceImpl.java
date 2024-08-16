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
	public int selectProductListCount(String type) {
		return productDao.selectProductListCount(type);
	}
	
	@Override
	public List<ProductDto> selectProductList(PageInfoDto pi, String type) {
		return productDao.selectProductList(pi, type);
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

	


	
	

	

  
  
}
