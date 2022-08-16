<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 환불신청 페이지</title>
</head>
<body>
	<!-- 상단 메시지 -->
	<h2>환불 신청</h2>

	<form:form modelAttribute="purchase" action="refund">
		<form:input path="p_num" type="hidden" />



		<table>

			<tr>
				<th>제목</th>
				<td align="center">${ebook.e_title}</td>

			</tr>
			<tr>
				<th>가격</th>
				<td align="center">${ebook.e_price}원</td>

			</tr>

			<tr>
				<th>구매일시</th>
				<td align="center">${purchase.p_reg_date}</td>

			</tr>


			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>환불 사유</th>

				<td><form:textarea path="p_reason_refund"></form:textarea></td>


			</tr>


		</table>


	</form:form>
	<c:if
		test="${purchase.p_status == 'purchaseSuccess' && purchase.elapsedDays < 7}">
		<div>
			<button type="button" id="btnRegister">신청</button>
		</div>
	</c:if>
	<c:if
		test="${purchase.p_status != 'purchaseSuccess' || purchase.elapsedDays > 7}">
		<div>다운로드를 받으셨거나 구매 후 7일 경과시 환불신청이 불가합니다.</div>
	</c:if>


</body>
<script>
	//등록 폼 전송
	$(document).ready(function() {

		var formObj = $("#purchase");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

	});
</script>
</html>