<%@ page language="java"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<!-- 로그인 되어 있는지 체크해야하는 페이지에서는 이걸 상단에 include. -->
<!--로그인 체크(JSTL, alert 안됨)  -->
 --%>
<c:if test="${sessionScope.userId==null}">
<c:redirect url="${commonURL}/login/loginFrm.jsp"/>
</c:if>