package com.mh.boot.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.mh.boot.dto.ErrorResponse;

@ControllerAdvice
public class GlovalBindingControllerAdvice {
	
	@ExceptionHandler(FtpConnectionFailedException.class)//에 등록한 예외가 발생하였다면 이를 감지하고 해당 메서드로 가져와 처리(복수 등록 가능)
	@ResponseStatus(HttpStatus.BAD_REQUEST) // 응답상태
	@ResponseBody
	public ErrorResponse handleFtpConnectionFailedException(Exception e) {
		return ErrorResponse.of(e.getMessage(), HttpStatus.BAD_REQUEST.value());
	}
	
}
