<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//POST 한글 인코딩
request.setCharacterEncoding("UTF-8");

// =========== 파일업로드 컴포넌트 사용하여 리퀘스트 받기=============
//***1. 업로드된 파일을 저장할 경로를 설정
//이런 경로는 siteProperty에 넣고 하자.
File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
if (!saveDir.exists()) {
	saveDir.mkdirs();
} //end if

//***2. 최대 크기 설정
int maxSize = 1024 * 1024 * 10; //10MB로 제한

//2-1. 업로드 크기 설정
int uploadSize = 1024 * 1024 * 600; //600MB로 큼직하게 설정.

//***3. FileUpload 객체 ( MultipartRequest ) 생성
//-> 생성하자마자 mr 객체도 생성되어서 업로드됨
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), uploadSize, "UTF-8",
		new DefaultFileRenamePolicy());

//요청 받기
String originalName = mr.getOriginalFileName("upfile");//원본명
String fileSystemName = mr.getFilesystemName("upfile");//변경명

//2-2.업로드 파일의 크기를 얻어서 업로드 가능 크기와 비교한다.
File compareFile = new File(saveDir.getAbsolutePath() + File.separator + fileSystemName);

//파일이 크다면 사용자에게 에러 메시지를 보여주고 파일을 지운다.
//작으면 바로 업로드.
boolean flag = false;
if (flag = (compareFile.length() > maxSize)) {
	compareFile.delete();
} //end if


JSONObject jsonObj = new JSONObject();
jsonObj.put("resultFlag",!flag);
jsonObj.put("uploadName",fileSystemName);

%>
<%=jsonObj.toJSONString() %>