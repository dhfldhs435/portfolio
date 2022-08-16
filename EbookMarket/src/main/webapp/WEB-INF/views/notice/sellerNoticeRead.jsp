<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	border-radius: 5px;
	overflow: hidden;
}

.member caption {
	font-size: 20px;
	margin-bottom: 30px;
}

.member tr {
	border-bottom: 1px solid #eee;
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
	justify-content: center;
	align-items: center;
	display: flex;
	justify-content: center;
	justify-content: center;
}

ul {
	list-style: none;
	float: left;
	display: block;
	text-align: center;
	list-style: none;
}

ul li {
	float: left;
	display: flex;
	padding: 0.3em 0;
	list-style: none;
	border-bottom: 1px solid rgba(0, 0, 0, 0.08);
}

ul li a {
	float: left;
	padding: auto;
	margin-right: auto;
	width: 50px;
	height: 30px;
	color: #000;
	font: bold 16px tahoma;
}

ul li a:hover, ul li a:focus {
	padding: 0 1rem;
	font-size: 1.2rem;
	color: #333;
	background: transparent;
	border: 0;
	outline: 0;
	cursor: pointer;
}

ul li a:hover, ul li a:focus {
	position: relative;
	padding: 1rem 0;
	display: inline-flex;
	justify-content: center;
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
</style>
</head>
<body>
	<h1 style="position: static; right: 50%;">공지사항 상세보기</h1>
	<br>
	<form:form modelAttribute="sellerNotice">
		<form:hidden path="sn_num" />
		<table class="member">
			<tr>
				<td>공지사항번호</td>
				<td><form:input path="sn_num" readonly="true"
						style="border:none" /></td>
				<td><font color="red"></font></td>

				<td>등록일자</td>
				<td><form:input path="sn_reg_date" readonly="true"
						style="border:none" /></td>
				<td><font color="red"></font></td>
			</tr>
			<tr>
				<td>공지사항제목</td>
				<td colspan="10"><form:input path="sn_title" readonly="true"
						style="border:none" /></td>
				<td><font color="red"></font></td>
			</tr>
			<tr>
				<td>공지사항내용</td>
				<td colspan="10" height=400><form:textarea path="sn_content"
						readonly="true" style="width:100%; height:100%" /></td>
				<td><font color="red"></font></td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td colspan="10"><img
					src="display?sn_num=${sellerNotice.sn_num} " width="100%"
					height="300"></td>
			</tr>


		</table>
		<Br>
		<div>
			<button type="button" id="btnList">목록으로</button>
		</div>
	</form:form>
	<script>
		$(document).ready(function() {
	var formObj = $("#sellerNotice");
	
	$("#btnList").on("click",function(){
		self.location = "sellerNoticeList";
	});
});
</script>

</body>
</html>