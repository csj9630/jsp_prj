<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.co.sist.user.member.LoginDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../fragments/siteProperty.jsp"%>
<%


LoginDTO[] lDTOArr = {new LoginDTO("kim","1234"),new LoginDTO("park","4321"),new LoginDTO("lee","5555"),new LoginDTO("qwer","pass")  };
//1.JSONObject 생성 : 데이터와 부가적인 정보 함유
JSONObject jsonObj = new JSONObject();

//2.데이터에 대한 부가적인 정보 추가
jsonObj.put("putDate",new SimpleDateFormat("yyyy-MM-dd EEEE").format(new Date()));
jsonObj.put("auth","민병조");
jsonObj.put("dataSize",lDTOArr.length);

//3.데이터를 JSONObject에 할당하고, JSONArray에 추가
//3-1.JSONARAY 생성
JSONArray jsonArr = new JSONArray();
JSONObject jsonTemp =null;


//3-2.JSONArray에 추가할 JSONObject 생성
for(LoginDTO lDTO : lDTOArr){
	jsonTemp = new JSONObject();
	jsonTemp.put("id",lDTO.getId());
	jsonTemp.put("pass",lDTO.getPassword());
	
//3-3.JSONObject를 JsonArray에 추가
	jsonArr.add(jsonTemp);
}//for

//데이터 추가
jsonObj.put("data",jsonArr);
		

//출력
out.print(jsonObj.toJSONString());


%>