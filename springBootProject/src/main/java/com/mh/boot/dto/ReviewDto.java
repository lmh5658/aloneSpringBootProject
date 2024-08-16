package com.mh.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class ReviewDto {
	
	private int reviewNo;
	private int productNo;
	private int memberNo;
	private int rating;
	private String reviewContent;
	private String reviewPostDt;
	private String reviewAttachPath;
	private String nickName;
	
	private int avgRating5;
	private int avgRating4;
	private int avgRating3;
	private int avgRating2;
	private int avgRating1;
	private int avgRatingTotal;
	
	private int totalReviewCount;
	

}
