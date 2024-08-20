package com.mh.boot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.mh.boot.handler.EchoHandler;

import lombok.RequiredArgsConstructor;

@EnableWebSocket
@RequiredArgsConstructor
@Configuration
public class WebSocketConfig implements WebSocketConfigurer {
	
	private final EchoHandler EchoHandler;
	
	//HttpSession 과 WebSocketSession을 연결시켜주는 의존성 주입 + sockjs 사용
	
	@Bean
	HttpSessionHandshakeInterceptor httpSessionHandshakeInterceptor() {
		return new HttpSessionHandshakeInterceptor();
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		/*
		<websocket:handlers>
			<websocket:mapping path="/chat" handler="chatEchoHandler" />
			<websocket:handshake-interceptors>
				<beans:bean class="org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor" />
			</websocket:handshake-interceptors>
			<websocket:sockjs />
		</websocket:handlers>
		*/
		registry.addHandler(EchoHandler, "/common")
				.addInterceptors(httpSessionHandshakeInterceptor())
				.withSockJS();
	}

}
