<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
body {
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	color: #000000;
	font-size: 20px;
	line-height: 2em;
	text-align: center;
}
/* Table */
.member {
	width: 95%;
	text-align: center;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	border-radius: 5px;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	background-color: #fff;
}

}
.member caption {
	font-size: 20px;
	margin-bottom: 30px;
}

.member td {
	text-align: left;
}

.member th {
	position: left;
	width: 30%;
}

.member tr {
	border-bottom: 1px solid #eee;
}

.search {
	position: relative;
	right: -40%;
	bottom: 5px;
}

.actionbutton {
	position: relative;
	left: 48%;
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

textarea {
	width: 99%;
	height: 200px;
}
</style>
</head>
<body>
	<h2>
		<script>
			var error = "<c:out value='${error}' />";
			if (error != "") {
				alert(error);
			}
		</script>
	</h2>
	<h2 style="position: static; right: 50%;">창작물 등록</h2>
	<br>

	<form:form modelAttribute="ebook" action="register"
		enctype="multipart/form-data">
		<table class="member">

			<tr>
				<th>제목</th>
				<td><form:input path="e_title" style="width:99%;" /></td>
				<td><font color="red"><form:errors path="e_title" /></font></td>
			</tr>

			<tr>
				<th>게시물 소개</th>
				<td><form:textarea path="e_post_introduce"></form:textarea></td>
				<td><font color="red"><form:errors
							path="e_post_introduce" /></font></td>
			</tr>

			<tr>
				<th>저자</th>
				<td><form:input path="e_writer" style="width:28%;"/></td>
				<td><font color="red"><form:errors path="e_writer" /></font></td>
			</tr>

			<tr>
				<th>저자소개</th>
				<td><form:textarea path="e_profile"></form:textarea></td>
				<td><font color="red"><form:errors path="e_profile" /></font></td>
			</tr>

			<tr>
				<th>연령제한</th>
				<td><form:input path="e_age_limit" type="tel" style="width:10%;" /></td>
				<td><font color="red"><form:errors path="e_age_limit" /></font></td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td><form:select path="e_category" items="${categoryList}"
						itemValue="value" itemLabel="label" /></td>
				<td><font color="red"><form:errors path="e_category" /></font></td>
			</tr>

			<tr>
				<th>목차</th>
				<td><form:textarea path="e_table_content" maxlength="1000"></form:textarea></td>
				<td><font color="red"><form:errors
							path="e_table_content" /></font></td>
			</tr>

			<tr>
				<th>희망 판매 가격</th>
				<td><form:input path="e_price" style="width:25%;"/></td>
				<td><font color="red"><form:errors path="e_price" /></font></td>
			</tr>


			<tr>
				<th>표지 이미지 첨부파일</th>
				<td><form:input path="e_coverimage" type="file" />
			</tr>

			<tr>
				<th>게시물 첨부파일</th>
				<td><form:input path="e_attachment" type="file" />
			</tr>

			<tr>
				<th>게시물 미리보기이미지</th>
				<td><form:input path="e_thumbnail" type="file" />
			</tr>
		</table>
	</form:form>
	<br>
	<div>
		<button class="myButton" type="button" id="btnRegister">등록</button>
	</div>
	<br>
</body>
<script>
	//등록 폼 전송
	$(document).ready(function() {

		var formObj = $("#ebook");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

	});
</script>
</html>