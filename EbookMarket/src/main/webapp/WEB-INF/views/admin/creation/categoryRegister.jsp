<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
}

.member tr:last-child {
	border: none;
}

.member tr:nth-child(odd) {
	background-color: #F0F0F0;
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
	<spring:message code="category.header.list" />
	<!-- 카테고리 목록 메세지 -->
</h1>

<!-- ***카테고리 목록*** -->
<div class="member">
	<!-- 처리 성공 시 메세지 창 구현 -->
	<script>
		var result = "${msg}";
		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess' />");
		}
	</script>

	<!-- 카테고리 목록 내용 구현 -->
	<table class="member">
		<tr>
			<th align="center" width="160"><spring:message
					code="category.categoryCode" /></th>
			<th align="center" width="120"><spring:message
					code="category.categoryName" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="3"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="category">
					<tr>
						<td align="center">${category.category_code}</td>
						<td align="center">${category.category_name}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<br>
<div class="reg">
	<form:form modelAttribute="adminCategory" action="categoryRegister">
		<div id="divToggle">
			<table>
				<tr>
					<td><spring:message code="category.categoryCode" /></td>
					<td><form:input path="category_code" /></td>
					<td><font color="red"><form:errors path="category_code" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="category.categoryName" /></td>
					<td><form:input path="category_name" /></td>
					<td><font color="red"><form:errors path="category_name" /></font></td>
				</tr>
			</table>
		</div>

	</form:form>
	<!-- (<div id=divToggle>)값 내용 보이게 하는 이벤트 버튼(속성1) -->
	<button class="myButton" type="submit" id="btnRegister" value="0">
		<spring:message code="category.header.register" />
	</button>
	<!-- (<div id=divToggle>)값 내용 전달하는 이벤트 버튼(속성2) -->
	<button class="myButton" type="submit" id="btnRegister2" value="0"
		class="actionbutton">
		<spring:message code="action.register" />
	</button>
</div>
<br>

<!-- 카테고리 수정 select박스 클릭시 호출되는 select 이벤트 -->
<div class="actionbutton">
	<!-- select박스를 클릭시 수정창으로 이동 / url창 링크 정보 -->
	<spring:message code="category.revise" />&nbsp;
	<!-- 카테고리 수정 메세지 -->
	<c:if test="${!empty list}">
		<select onchange="if(this.value) location.href=(this.value);">
			<option value="">수정 목록</option>
			<c:forEach items="${list}" var="category">
				<option
					value="/admin/creation/categoryModify?category_code=${category.category_code}">
					${category.category_name}
			</c:forEach>
		</select>
	</c:if>

	<script>
		$(document).ready(function() {
			if ($("#btnRegister").val() == 0) {
				$("#btnRegister").val(1);
				$("#btnRegister2").css("display", "none");
			} else {
				$("#btnRegister").val(0);
			}

			var show = $("#divToggle").val();
			if (show == 1) {
				// Button 숨기기
				$("#divToggle").hide();
			} else {
				// Button 보이기
				$("#divToggle").show();
				$("#btnRegister2").css("display", "none");
			}
			$("#divToggle").toggle();
			$("#btnRegister").on("click", function() {
				$("#btnRegister").val(0);
				$("#divToggle").show();
				$("#btnRegister").hide();
				$("#btnRegister2").css("display", "block");
			});
		});
	</script>

	<!-- 등록 버튼(속성2) 클릭시 db값 전송 버튼 -->
	<script>
		$(document).ready(function() {
			$("#btnRegister2").on("click", function() {
				var formObj = $("#adminCategory");
				formObj.submit(); // 내용 전송
			});
		});
	</script>
</div>