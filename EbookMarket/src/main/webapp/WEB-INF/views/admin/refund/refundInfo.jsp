<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="refund.header.refundinfo" />
</h2>

<form:form modelAttribute="refund">
	<form:hidden path="p_num" />
	<form:hidden path="e_num" />
	<table border="1" align="center">
		<tr>
			<td align="center" width="150" height="20"><spring:message
					code="seller.nickname" /></td>
			<td align="left" style="padding: 10px" width="200">${refund.s_nickname }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="20"><spring:message
					code="creation.title" /></td>
			<td align="left" style="padding: 10px" width="200">${refund.e_title }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="20"><spring:message
					code="creation.category" /></td>
			<td align="left" style="padding: 10px" width="200">${refund.e_category }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.introduce" /></td>
			<td align="left" style="padding: 10px" width="800">${refund.e_post_introduce }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="20"><spring:message
					code="creation.price" /></td>
			<td align="left" style="padding: 10px" width="200">${refund.e_price }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="20"><spring:message
					code="refund.creationregdate" /></td>
			<td align="left" style="padding: 10px" width="200"><fmt:formatDate
					pattern="yyyy-MM-dd HH:mm" value="${refund.e_reg_date }" /></td>
		</tr>
		<tr>
			<td align="center" width="150" height="20"><spring:message
					code="refund.reason" /></td>
			<td align="left" style="padding: 10px" width="200">${refund.p_reason_refund }</td>
		</tr>
		<tr>
			<td align="center" width="250" height="20"><spring:message
					code="refund.refusalreason" /></td>
			<td align="left" style="padding: 10px" width="200">${refund.p_reason_refusal }</td>
		</tr>
	</table>
</form:form>
<br />
<div>
	<button type="submit" id="btnApproval"
		style="background-color: green; padding: 12px; font-size: 16px; border: none;">
		<spring:message code="action.refundapproval" />
	</button>
	<button type="submit" id="btnRefuse"
		style="background-color: green; padding: 12px; font-size: 16px; border: none;">
		<spring:message code="action.refundrefuse" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#refund");

		$("#btnApproval").on("click", function() {
			var p_num = $("#p_num");
			var e_num = $("#e_num");
			var p_numVal = p_num.val();
			var e_numVal = e_num.val();
			self.location = "/admin/refund/approval?p_num=" + p_numVal + "&e_num=" + e_numVal;
		});
		$("#btnRefuse").on("click", function() {
			var p_num = $("#p_num");
			var p_numVal = p_num.val();
			self.location = "/admin/refund/refuse?p_num=" + p_numVal;
		});
	});
</script>