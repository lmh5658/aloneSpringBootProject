package com.mh.boot.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender javaMailSender;
    private static final String senderEmail = "slansml1201@gmail.com";
    private static int number;

	// 랜덤으로 숫자 생성
    public static void createNumber() {
        number = (int)(Math.random() * (90000)) + 100000; //(int) Math.random() * (최댓값-최소값+1) + 최소값
    }

    public MimeMessage CreateMail(String mail, String distinction) {
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            message.setFrom(senderEmail);
            message.addRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("안녕하세요 Pet Connect# 입니다.");
            String body = "";            
            body += "<h4>" + "안녕하세요 Pet Connect# 입니다." + "</h4>";
            body += "<h4>" + "요청하신 인증 번호입니다." + "</h4>";
            body += "<h3>" + number + "</h3>";
            body += "<h4>" + "감사합니다." + "</h4>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        MimeMessage messagePwd = javaMailSender.createMimeMessage();
        try {
        	messagePwd.setFrom(senderEmail);
        	messagePwd.addRecipients(MimeMessage.RecipientType.TO, mail);
        	messagePwd.setSubject("안녕하세요 Pet Connect# 입니다. 임시비밀번호 안내 이메일입니다.");
            String body = "";            
            body += "<h4>" + "안녕하세요 Pet Connect# 입니다." + "</h4>";
            body += "<h4>" + "요청하신 임시 비밀번호 입니다." + "</h4>";
            body += "<h4>" + "임시비밀번호로 로그인하신 후 반드시 비밀번호 변경을 해주세요." + "</h4>";
            body += "<h3>" + number + "</h3>";
            body += "<h4>" + "감사합니다." + "</h4>";
            messagePwd.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return (distinction.equals("id") || distinction.equals("sign")) ? message : messagePwd;
    }

    public int sendMail(String mail, String distinction) {
    	
		MimeMessage message = CreateMail(mail, distinction);
		javaMailSender.send(message);

        return number;
    }
}
