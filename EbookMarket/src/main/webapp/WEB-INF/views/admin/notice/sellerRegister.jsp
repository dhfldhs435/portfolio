<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<head>
<link rel="stylesheet" type="text/css" href="css/table.css" />
<style>
body {
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	color: #000000;
	font-size: 15px;
	line-height: 1.6em;
	background-image: linear-gradient(120deg, #FFFFFF 0%, #FFFFFF 100%);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
/* Table */
.member {
	width: 100%;
	background-color: #fff;
	border-collapse: collapse;
	border-radius: 5px;
	height: auto;
	display: flex;
	align-items: center;
	justify-content: center;
}

.member caption {
	font-size: 20px;
	margin-bottom: 30px;
}

.member tr {
	border-bottom: 1px solid #eee;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
}

.member tr:last-child {
	border: none;
}

.member th, .member td {
	padding: 12px;
	text-align: center;
}

.member tr th {
	background-color: #E0E0E0;
	color: #000000;
}

.member tr th:first-child {
	border-radius: 5px 0 0 0;
}

.member tr th:last-child {
	border-radius: 0 5px 0 0;
}

.pagination {
	height: auto;
	display: flex;
	align-items: center;
	justify-content: center;
}

.search {
	position: relative;
	right: -40%;
	bottom: 5px;
}

.actionbutton {
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	justify-content: center;
	justify-content: center;
}

.reg {
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	justify-content: center;
	justify-content: center;
}

.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<h1>
	<spring:message code="notice.header.seller.register" />
</h1>
<form:form modelAttribute="notice" action="sellerRegister"
	enctype="multipart/form-data">
	<br>
	<table class="member">
		<tr>
			<td><spring:message code="notice.writer" /></td>
			<td align="left">${notice.sn_writer }</td>
			<td><form:hidden path="sn_writer" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td><form:input path="sn_title"
					style="width:700px; height:30px;" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td><form:textarea path="sn_content"
					style="width:700px; height:300px;" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.attachmentfile" /></td>
			<td><input type="file" name="sn_attachment" /></td>
			<td></td>
		</tr>
	</table>
</form:form>
<Br>
<div>
	<button class="myButton" type="submit" id="btnRegister">
		<spring:message code="action.register" />
	</button>
	<button class="myButton" type="button" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#notice");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/admin/notice/sellerList";
		});

	});
</script>