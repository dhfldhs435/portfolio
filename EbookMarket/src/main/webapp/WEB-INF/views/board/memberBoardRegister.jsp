<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<h1 style="position: static; right: 50%;">
		<spring:message code="mb.register" />
	</h1>
	<Br>
	<form:form modelAttribute="memberBoard" action="memberBoardRegister"
		enctype="multipart/form-data">
		<form:hidden path="m_num" />
		<table class="member">

			<tr>
				<td>작성자</td>
				<td><form:input path="mb_writer"
						style="width:80%; height:100%;" value="${md_writer}" size="38" />
					<form:errors path="mb_writer" /></td>

			</tr>

			<tr>
				<td><spring:message code="mb.title" /></td>
				<td><form:input path="mb_title" size="62"
						style="width:80%; height:100%;" /></td>
				<td><font color="red"><form:errors path="mb_title" /></font></td>
			</tr>



			<tr>

				<td><spring:message code="mb.content" /></td>
				<td><form:textarea path="mb_content" cols="20" rows="20"
						resize="none" style="width:80%; height:100%;" /></td>
				<td><font color="red"><form:errors path="mb_content" /></font></td>
			</tr>


			<tr>

				<td><spring:message code="mb.AttachmentFile" /></td>
				<td><form:input path="mb_attachmentFile" type="file" /></td>
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
					var formObj = $("#memberBoard");

					$("#btnRegister").on("click", function() {
						formObj.submit();
					});

					$("#btnList").on(
							"click",
							function() {
								self.location = "/memberBoard/memberBoardList?"
										+ "&page=${scri.page}"
										+ "&perPageNum=${scri.perPageNum}"
										+ "&searchType=${scri.searchType}"
										+ "&keyword=${scri.keyword}"
							});
				});
	</script>