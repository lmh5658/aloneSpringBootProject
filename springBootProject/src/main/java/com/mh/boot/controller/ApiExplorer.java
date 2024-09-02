package com.mh.boot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/weather")
@RestController
public class ApiExplorer {
	
	private String category;
    private JSONObject weather;
    @Value("${kakao-api-key}")
	private String kakoKey;	
    
    
    
   @ResponseBody
   @GetMapping("/apiWeather.do")
   public StringBuilder apiweather() throws IOException, ParseException  {
	   
	   
	// 변수 설정
       String apiURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
       String authKey = kakoKey; // 본인 서비스 키

		// 구하고자 하는 시간과 좌표 대입
       String nx = "56";
       String ny = "124";
       
       // 현재 날짜와 시간 가져오기
       Date date = new Date();
       
       // Calendar 객체를 사용하여 날짜 조작
       Calendar calendar = Calendar.getInstance();
       //calendar.setTime(date);
       //calendar.add(Calendar.HOUR_OF_DAY, -1); // 2시간 30분 빼기
       //calendar.add(Calendar.MINUTE, -30);
       //Date oneHourAgo = calendar.getTime();// 수정된 날짜 가져오기
       SimpleDateFormat sdfHour = new SimpleDateFormat("HHmm");
       String oneHourAgoStr = sdfHour.format(date);
       
       Calendar calendare = Calendar.getInstance();
       calendare.setTime(date);
       calendar.add(Calendar.DAY_OF_MONTH, -1);
       Date minusDate = calendar.getTime();
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
       String today = sdf.format(minusDate);
       
       // 현재 날짜 포맷
      
       // 1시간 전 시간 포맷
       
       log.debug("today : {}", today);
       log.debug("oneHourAgoStr : {}", oneHourAgoStr);
       
       String baseDate = today;
       String baseTime = oneHourAgoStr;

       String dataType = "JSON";

       StringBuilder urlBuilder = new StringBuilder(apiURL); /*URL*/
       urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + authKey); /*Service Key*/
       urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
       urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
       urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(dataType, "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
       urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /*‘21년 6월 28일 발표*/
       urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0500", "UTF-8")); /*06시 발표(정시단위) */
       urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("55", "UTF-8")); /*예보지점의 X 좌표값*/
       urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("124", "UTF-8")); /*예보지점의 Y 좌표값*/
       
       URL url = new URL(urlBuilder.toString());
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Content-type", "application/json");
       System.out.println("Response code: " + conn.getResponseCode());
       BufferedReader rd;
       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
       } else {
           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
       }
       StringBuilder sb = new StringBuilder();
       String line;
       while ((line = rd.readLine()) != null) {
           sb.append(line);
       }
       rd.close();
       conn.disconnect();
       String result = sb.toString();
       System.out.println(result);
      
       
       /*
       	JSONParser jsonParser = new JSONParser();
       
    
		JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
		
		JSONObject response = (JSONObject)jsonObject.get("response");
		JSONObject body = (JSONObject)response.get("body");
		JSONObject items = (JSONObject)body.get("items");
		
		
		JSONArray item = (JSONArray)items.get("item");
		
		// parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용합니다.
		
		// 필요한 데이터만 가져오려고합니다.
		for(int i = 0 ; i < item.size(); i++){
			weather = (JSONObject) item.get(i);
			//String base_Date = (String)weather.get("baseDate");
			//String fcst_Time = (String)weather.get("fcstDate");
			double fcst_Value = ((Long)weather.get("fcstValue")).doubleValue(); //실수로된 값과 정수로된 값이 둘다 있어서 실수로 통일했습니다.
			//String nX = (String)weather.get("nx");
			//String nY = (String)weather.get("ny");
			category = (String)weather.get("category");
			//String base_Time = (String)weather.get("baseTime");
			//String fcscDate = (String)weather.get("fcscDate");
			
			System.out.print("배열의 "+i+"번째 요소");
			System.out.print("   category : "+ category);
			System.out.print("   fcst_Value : "+ fcst_Value);
			System.out.println();
			
	  	}
		*/
     
	   
	   	
       return sb;
       
      
   }
   
}
