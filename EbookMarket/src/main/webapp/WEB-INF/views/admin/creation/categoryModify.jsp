<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

.member th, .member td {
	padding: 12px;
	text-align: center;
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
	<spring:message code="category.header.modify" />
	<!-- 카테고리 수정 메세지 -->
</h1>

<div>
	<!-- 카테고리 그룹코드, 카테고리명 폼양식 -->
	<form:form modelAttribute="adminCategory" action="categoryModify">
		<table class="member">
			<tr>
				<td><spring:message code="category.categoryCode" /></td>
				<td><form:input path="category_code" readonly="true" /></td>
				<td><font color="red"><form:errors path="category_code" />
				</font></td>
			</tr>

			<tr>
				<td><spring:message code="category.categoryName" /></td>
				<td><form:input path="category_name" /></td>
				<td><font color="red"><form:errors path="category_name" /></font></td>
			</tr>
		</table>
		<Br>
	</form:form>
	<div class="member">
		<button class="myButton type=" submit" id="btnModify">
			<spring:message code="action.modify" />
		</button>
		<button class="myButton type=" submit" id="btnRemove">
			<spring:message code="action.remove" />
		</button>
		<button class="myButton type=" submit" id="btnList">
			<spring:message code="action.list" />
		</button>
	</div>
	<script>
		$(document).ready(
				function() {
					var formObj = $("#adminCategory");
					$("#btnModify").on(
							"click",
							function() {
								if (confirm("카테고리 이름을 '" + category_name.value
										+ "' 로 변경하시겠습니까?") == true) { //확인

									formObj.submit(); // 수정된 내용 DB전송

								} else { //취소

									return false;
								}
							});
					$("#btnRemove").on(
							"click",
							function() {
								formObj.attr("action",
										"/admin/creation/categoryRemove");

								if (confirm("카테고리를 삭제하시겠습니까?") == true) { //확인

									formObj.submit(); // 삭제(remove로) 전송

								} else { //취소

									return false;

								}
							});
					$("#btnList").on("click", function() {
						self.location = "categoryRegister";
					});
				});
	</script>
</div>