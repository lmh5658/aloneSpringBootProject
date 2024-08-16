package com.mh.boot.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ErrorResponse {
	private String message;
	private int stauts;
	
	public static ErrorResponse of(String message, int status) {
		return ErrorResponse.builder()
				.message(message)
				.stauts(status)
				.build();
	}

}
