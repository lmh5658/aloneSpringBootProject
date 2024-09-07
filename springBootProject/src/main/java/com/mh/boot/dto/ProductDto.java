package com.mh.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class ProductDto {
  
  private int productNo;
  private String categoryType;
  private String proName;
  private int productPrice;
  private String proStatus;
  private int proAmount;
  private String productSaleStatus;
  private int productSalePrice;
  private String productThumbnailPath;
  private String productDatailPath;
  private int orderCheck;
  private int reviewCheck;
  private int count;
  private int orderProductAmount;
  private String filterWeight;
  private String filtersize;
  private String filterfunctional;
  private String filtersalaryTarget;
  
 
  
  private int rowNumber; //랭킹 숫자 rowNum
  private String userNo;
  private double avgRating;
}
