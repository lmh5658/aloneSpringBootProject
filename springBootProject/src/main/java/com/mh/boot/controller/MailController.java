package com.mh.boot.controller;

import java.util.HashMap;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mh.boot.service.MailService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/mail")
@Controller
@RequiredArgsConstructor
@Slf4j
public class MailController {
	
	private final MailService mailService;
    private int number; // 이메일 인증 숫자를 저장하는 변수

	// 인증 이메일 전송
    @ResponseBody
	@PostMapping("/mailSend.do")
    public HashMap<String, Object> mailSend(@RequestParam String mail, @RequestParam(required=false) String type
    									  , @RequestParam(required=false) String distinction) {
    	log.debug("mail : {}", mail);
        HashMap<String, Object> map = new HashMap<>();

        try {
            number = mailService.sendMail(mail, distinction);
            String num = String.valueOf(number);

            map.put("success", Boolean.TRUE);
            map.put("number", num);
        } catch (Exception e) {
            map.put("success", Boolean.FALSE);
            map.put("error", e.getMessage());
        }

        return map;
    }

	// 인증번호 일치여부 확인
	@ResponseBody
    @GetMapping("/mailCheck.do")
    public ResponseEntity<?> mailCheck(@RequestParam String userNumber) {

        boolean isMatch = userNumber.equals(String.valueOf(number));
        	
        return ResponseEntity.ok(isMatch);
    }

}
