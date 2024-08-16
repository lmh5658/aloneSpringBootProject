package com.mh.boot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mh.boot.dto.PageInfoDto;
import com.mh.boot.dto.ProductDto;
import com.mh.boot.dto.ReviewDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ProductDao {
  
  private final SqlSessionTemplate sqlSessionTemplate;
  
  public int selectProductListCount(String type) {
    return sqlSessionTemplate.selectOne("productMapper.selectProductListCount", type);
  }

  public List<ProductDto> selectProductList(PageInfoDto pi, String type) {
    RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
    return sqlSessionTemplate.selectList("productMapper.selectProductList", type, rowBounds);
  }
  
  public ProductDto selectProduct(Map<String, Object> map){
	 return sqlSessionTemplate.selectOne("productMapper.selectProduct", map);
  }
  
  public int selectCart(Map<String, Object> map) {
	  return sqlSessionTemplate.selectOne("productMapper.selectCart", map);
  }
  
  public int updateCart(Map<String, Object> map) {
	  return sqlSessionTemplate.update("productMapper.updateCart", map);
  }
  
  public  int insertCart(Map<String, Object> map) {
	  return sqlSessionTemplate.insert("productMapper.insertCart", map);
  }
  
  public List<ProductDto> selectCartList(int userNo){
	  return sqlSessionTemplate.selectList("productMapper.selectCartList", userNo);
  }
  
  public int deleteCart(Map<String, Object> map) {
	  return sqlSessionTemplate.delete("productMapper.deleteCart", map);
  }
  
  public int selectCartCheck(int userNo) {
	  return sqlSessionTemplate.delete("productMapper.selectCart", userNo);
  }
  
  public  int cartCountUpdate(Map<String, Object> map) {
	  return sqlSessionTemplate.update("productMapper.cartCountUpdate", map);
  }
  
  public int writeReview(ReviewDto review) {
	  return sqlSessionTemplate.insert("productMapper.writeReview", review);
  }
  
  public List<ReviewDto> reviewSelect(int ProductNo, PageInfoDto pi){
	  RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
	  return sqlSessionTemplate.selectList("productMapper.reviewSelect", ProductNo, rowBounds);

  }
  
  
  public int reviewListCount(int productNo) {
	  return sqlSessionTemplate.selectOne("productMapper.reviewListCount", productNo);
  }
  
  
  
  
  
}
