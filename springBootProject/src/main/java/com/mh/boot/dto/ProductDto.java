package com.mh.boot.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ProductDto {
  
  private int productNo;
  private String categoryType;
  private String proName;
  private String productPrice;
  private String proStatus;
  private int proAmount;
  private String pSaleStatus;
  private String pSalePrice;
  private String productThumbnailPath;
  private String pDatailPath;
  private int orderCheck;
  private int reviewCheck;
  private int count;
  
}
