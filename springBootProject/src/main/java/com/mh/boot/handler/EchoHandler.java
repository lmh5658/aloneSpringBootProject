package com.mh.boot.handler;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mh.boot.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class EchoHandler extends TextWebSocketHandler{
	
	//로그인중인 개별 유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	
	//클라이언트가 서버로 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		String senderId = ((MemberDto)session.getAttributes().get("loginUser")).getUserId(); //접속한 유저의 http세션을 조회하여 id를 얻는 함수
		if(senderId != null) { //로그인한 값이 있는 경우에만
			log.debug(senderId + "연결됨");
			users.put(senderId, session); //로그인용 개별 유저 저장
		}
	}
	

	//클라이언트가 Data 전송시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		log.debug("연결 성공");
		String senderId = ((MemberDto)session.getAttributes().get("loginUser")).getUserId();
		//특정 유저에게 보내기
		String msg = message.getPayload(); //웹소켓으로 전송한 데이터값
		if(msg != null) {
			String[] strs = msg.split(",");
			log.debug("msg>>>>>> {}", msg);
			if(msg != null) {
				//String type = strs[0];
				String target = strs[2]; //<== id 저장
				//String title = strs[1];
				//String content = strs[2];
				//String messageBox = strs[3];
				//String contentSplit = (content.length() > 50) ? content.substring(0, 50) + "..." : content;
				//실시간 접속시
				WebSocketSession targetSession = users.get(target); // 메세지 받을 세션 조회
				
				if(targetSession != null) {
					//ex : []신청이 들어왔습니다.
					TextMessage tmpMsg = new TextMessage(msg);
					targetSession.sendMessage(tmpMsg);
				}
				
				
			}
			
		}
		
	}
	
	//연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		String senderId = ((MemberDto)session.getAttributes().get("loginUser")).getUserId();
		if(senderId != null) { //로그인 값이 있는 경우에만
			log.debug(senderId + " 연결 종료됨");
			users.remove(senderId);
			users.remove(session);
			
		}
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.debug(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	
	// 로그 메시지
	private void log(String logmsg) {
	}
	
	// 웹소켓에 id 가져오기
    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		String memberId =((MemberDto)session.getAttributes().get("loginUser")).getUserId();
		return memberId == null? null: memberId;
	}
	

}
