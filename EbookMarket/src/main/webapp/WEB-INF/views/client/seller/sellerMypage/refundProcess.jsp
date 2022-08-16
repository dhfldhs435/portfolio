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
	<h2>환불 처리</h2>

	<form:form modelAttribute="purchase" action="sellerRefund">
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
				<th>환불 사유</th>
				<td align="center">${purchase.p_reason_refund}</td>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>거절 사유</th>

				<td><form:textarea path="p_reason_refusal"></form:textarea></td>


			</tr>


		</table>


	</form:form>

	<div>
		<button type="button" id="btnRefusal">환불거절</button>
		<button type="button" id="btnApproval">환불승인</button>
	</div>


</body>
<script>
	//등록 폼 전송
	$(document).ready(function() {

		var formObj = $("#purchase");

		$("#btnRefusal").on("click", function() {
			formObj.submit();
		});

	});

	//등록 폼 전송
	$(document)
			.ready(
					function() {

						var formObj = $("#purchase");

						$("#btnApproval")
								.on(
										"click",
										function() {

											var p_reason_refusal = $(
													"#p_reason_refusal").val();
											document
													.getElementById('p_reason_refusal').value = 'refundApproval';
											formObj.submit();
										});

					});
</script>
</html>