<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료 페이지</title>
</head>
<body>
	<table>
		<tr>
			<td><spring:message code="buy.purchaseComplete" /></td>
		</tr>
		<tr>
			<td><a href="/purchase/memberDownloadList">구매 목록으로 가기</a></td>
		</tr>
	</table>
</body>
</html>