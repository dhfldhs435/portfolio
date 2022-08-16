<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공 페이지</title>
</head>
<body>
	<div>
		<!-- 로그인 축하 메시지 출력 -->
		<h2><spring:message code="common.joinSuccess" arguments="${m_name}" /></h2>
		
		<!-- 로그인 페이지로 이동 -->
		<a href="/auth/login"><spring:message code="action.login" /></a>
	</div>
</body>
</html>