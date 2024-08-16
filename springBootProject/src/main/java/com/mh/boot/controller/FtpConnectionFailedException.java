package com.mh.boot.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;

import lombok.extern.slf4j.Slf4j;


public class FtpConnectionFailedException extends RuntimeException {
	
    public FtpConnectionFailedException(String message) {
        super(message);
    }
    
}
