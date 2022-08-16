<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<h1 style="position: static; right: 50%;">문의 등록</h1>
	<br>
	<form:form modelAttribute="sellerBoard" action="sellerBoardRegister"
		enctype="multipart/form-data">

		<form:hidden path="s_num" />

		<table class="member">
			<tr>
			</tr>
			<tr>
				<td>작성자</td>
				<td><form:input path="sb_writer" value="${sd_writer}" size="38" />
					<form:errors path="sb_writer" /></td>

			</tr>

			<tr>

				<td>제목</td>

				<td><form:input path="sb_title" size="38"
						style="border:none; width:100%; height:100%" /></td>
				<td><font color="red"><form:errors path="sb_title" /></font></td>
			</tr>



			<tr>

				<td>내용</td>
				<td><form:textarea path="sb_content" cols="40" rows="20"
						style="width:100%; height:100%" resize="none" /></td>
				<td><font color="red"><form:errors path="sb_content" /></font></td>
			</tr>


			<tr>

				<td>첨부파일</td>
				<td><form:input path="sb_attachmentFile" type="file"
						style="left;" /></td>
			</tr>



		</table>
		<br>
		<div>
			<sec:authorize access="isAuthenticated()">
				<button type="button" id="btnRegister">등록하기</button>
			</sec:authorize>
			<button type="button" id="btnList">리스트</button>
		</div>




	</form:form>



	<script>
		$(document).ready(
				function() {
					var formObj = $("#sellerBoard");

					$("#btnRegister").on("click", function() {
						formObj.submit();
					});

					$("#btnList").on(
							"click",
							function() {
								self.location = "/sellerBoard/sellerBoardList?"
										+ "&page=${scri.page}"
										+ "&perPageNum=${scri.perPageNum}"
										+ "&searchType=${scri.searchType}"
										+ "&keyword=${scri.keyword}"
							});
				});
	</script>