package com.mh.boot.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mh.boot.interceptor.LoginCheckInterceptor;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	private final LoginCheckInterceptor loginCheckInterceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// <resources mapping="/resources/**" location="/resources/" />
		registry.addResourceHandler("/resources/**")
				.addResourceLocations("classpath:/static/");
		// <resources mapping="/upload/**" location="file:///upload/" />
		
		//개발환경
		/*
		registry.addResourceHandler("/upload/**")
				.addResourceLocations("file:///upload/");
		*/
		//배포환경
		
		registry.addResourceHandler("/home/ubuntu/upload/**")
		.addResourceLocations("file:///home/ubuntu/upload/");
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		/*
		<interceptors>
			<interceptor>
				<mapping path="/member/myinfo.page"/>
				<mapping path="/board/registForm.page"/>
				<beans:bean class="com.br.spring.interceptor.LoginCheckInterceptor" 
										id="loginCheckInterceptor" />
			</interceptor>
		</interceptors>
		*/
		registry.addInterceptor(loginCheckInterceptor)
				.addPathPatterns("/member/myPage.page")
				.addPathPatterns("/community/modifyForm.page");
		
	}
	
	@Autowired
	private JavaMailSender javaMailSender;

}
