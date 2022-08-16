<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>
	<spring:message code="creation.header.registerInfo" />
</h2>

<form:form modelAttribute="creation" action="delApproval">
	<form:hidden path="e_num" />
	<table border="1" align="center">
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.name" /></td>
			<td align="center" width="200">${creation.s_name }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.title" /></td>
			<td align="center" width="200">${creation.e_title }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.category" /></td>
			<td align="center" width="200">${creation.e_category }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.price" /></td>
			<td align="center" width="200">${creation.e_price }</td>
		</tr>
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.regdate" /></td>
			<td align="center" width="200"><fmt:formatDate
					pattern="yyyy-MM-dd HH:mm" value="${creation.e_reg_date }" /></td>
		</tr>
		<tr>
			<td align="center" width="150" height="60"><spring:message
					code="creation.attachment" /></td>
			<td align="center" width="200"><a
				href="/admin/creation/download\?e_num=${creation.e_num }">DOWNLOAD</a></td>
		</tr>
	</table>
</form:form>
<br />
<div>
	<button type="submit" id="btnApproval"
		style="background-color: green; padding: 12px; font-size: 16px; border: none;">
		<spring:message code="action.delapproval" />
	</button>
	<button type="submit" id="btnRefuse"
		style="background-color: green; padding: 12px; font-size: 16px; border: none;">
		<spring:message code="action.delrefuse" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#creation");

		$("#btnApproval").on("click", function() {
			formObj.submit();
		});
		$("#btnRefuse").on("click", function() {
			var e_num = $("#e_num");
			var e_numVal = e_num.val();
			self.location = "/admin/creation/delRefuse?e_num=" + e_numVal;
		});
	});
</script>