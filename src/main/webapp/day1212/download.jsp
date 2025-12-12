<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="application/octet-stream"
	pageEncoding="UTF-8"%>
<%
//링크 타고 들어오면 파일을 다운로드하게 하기.

//POST 한글 인코딩
request.setCharacterEncoding("UTF-8");
String fileName = request.getParameter("fileName");
String downFileName = fileName;


//한글은 URL 형식으로 encoding 해야한다.
//fileName="캬르릉.txt"; //== %EC%BA%AC%EB%A5%B4%EB%A6%89
if(downFileName != null){
	downFileName = URLEncoder.encode(downFileName,"UTF-8");	
}
//응답 헤더를 변경 : download.jsp 에서  사용자가 선택한 파일명이 응답되도록 변경함.
response.setHeader("Content-Disposition", "attachment;fileName="+downFileName);

//다운로드할 파일의 정보를 얻기 위해 File 객체 생성
//인코딩 되지 않은 파일명이어야 한다.
File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/"+fileName);

//다운로드할 파일에 읽기 스트림을 연결
FileInputStream fis = new FileInputStream(file);

//연결된 파일을 접속자에게 보내기 위해서, 접속자와 연결된 출력 스트림을 얻는다.
OutputStream os = response.getOutputStream();

//읽어 들인 파일을 저장할 배열을 생성, 파일에서 읽어들여서 출력스트림으로 출력.
byte[] readData= new byte[512];
int readSize=0;
while((readSize=fis.read(readData)) != -1){//파일의 끝 (EOF)까지 읽어들임
	os.write(readData,0, readSize); //읽어들인 데이터를 출력 스트림에 기록.
}//while
//출력스트림 초기화
out.clear();

//응답헤더를 HTML을 출력할 수 있게 초기화
out=pageContext.pushBody();

%>
