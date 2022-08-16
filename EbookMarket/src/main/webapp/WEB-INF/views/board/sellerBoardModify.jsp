<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
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

.member th, .member td {
	padding: 12px;
	text-align: center;
}

.member tr th {
	background-color: #E0E0E0;
	color: #000000;
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
	display: block;
	text-align: left;
	list-style: none;
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

.s_num {
	border: none;
}
</style>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
	<h2>게시물 상세보기</h2>
	<form:form modelAttribute="sellerBoard" enctype="multipart/form-data">
		<form:hidden path="sb_num" />
		<form:hidden path="sb_attachmentFileUrl" />
		<table class="member">
			<tr>
				<td>작성자</td>
				<td>${sellerBoard.sb_writer }</td>
			</tr>



			<tr>
				<td>회원일련번호</td>
				<td><form:input path="s_num" readonly="true" size="1"
						class="s_num" /></td>
				<td><font color="red"><form:errors path="s_num" /></font></td>
			</tr>

			<tr>
				<td>게시물 제목</td>
				<td><form:textarea cols="20" rows="1" style="resize:none;"
						path="sb_title" class="s_num" /></td>
				<td><font color="red"><form:errors path="sb_title" /></font></td>
			</tr>

			<tr>
				<td>게시물 내용</td>
				<td><form:textarea style="resize:none;" cols="100" rows="20"
						path="sb_content" class="s_num" /></td>
				<td><font color="red"><form:errors path="sb_content" /></font></td>
			</tr>
			<tr>
				<c:if test="display?sb_num=${sellerBoard.sb_num} != null">
					<td><img src="display?sb_num=${sellerBoard.sb_num} "
						width="210" height="180"></td>
				</c:if>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td><form:input path="sb_attachmentFile" type="file" /></td>

			</tr>
		</table>
	</form:form>

	<div>
		<sec:authentication property="principal" var="seller" />



		<sec:authorize access="hasRole('ROLE_SELLER')">
			<button type="submit" id="btnModify">수정하기</button>
			<button type="submit" id="btnRemove">삭제하기</button>
		</sec:authorize>

		<button type="submit" id="btnList">목록으로</button>

	</div>
</body>

<script>
	$(document).ready(function() {

		var formObj = $("#sellerBoard");

		$("#btnModify").on("click", function() {
			formObj.submit();
		});

		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/sellerBoard/sellerBoardRemove");
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "/sellerBoard/sellerBoardList"
		});

	});
</script>
</html>