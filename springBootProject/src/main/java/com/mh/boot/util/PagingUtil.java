package com.mh.boot.util;

import org.springframework.stereotype.Component;

import com.mh.boot.dto.PageInfoDto;

@Component
public class PagingUtil {
	
	public PageInfoDto getPageInfoDto(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil( (double)listCount/boardLimit );
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfoDto(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}

}
