<%@page import="day1215.CreateDeptXML"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.emp.DeptDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.emp.EmployeeDAO"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//********************XML을 쓸 때는 contentType을 꼭 바꿔주자********************
EmployeeDAO eDAO = EmployeeDAO.getInstance();

try {
	List<DeptDTO> list = eDAO.selectAllDept();
	CreateDeptXML cdXML = new CreateDeptXML();
	cdXML.createXML(list, out);
	//System.out.println(list);
} catch (SQLException e) {
	e.printStackTrace();
}
%>
