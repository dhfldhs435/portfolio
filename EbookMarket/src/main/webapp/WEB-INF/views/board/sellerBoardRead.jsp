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

.member tr {
	border-bottom: 1px solid #eee;
}

.member caption {
	font-size: 20px;
	margin-bottom: 30px;
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
</style>
</head>
<body>
	<h1 style="position: static; right: 50%;">게시물 상세보기</h1>
	<form:form modelAttribute="sellerBoard" enctype="multipart/form-data">
		<form:hidden path="s_num" />
		<form:hidden path="sb_attachmentFileUrl" />





		<table class="member">
			<tr>
				<td colspan="2">작성자</td>
				<td>${sellerBoard.sb_writer }</td>
				<td colspan="2">작성일</td>
				<td>${sellerBoard.sb_reg_Date}</td>
			</tr>

			<tr>
				<td>게시물일련번호</td>
				<td colspan="2"><form:input path="sb_num" readonly="true"
						size="1" style="border:0 solid black" id="sb_num" /></td>
				<td><font color="red"><form:errors path="sb_num" /></font></td>
			</tr>

			<tr>
				<td>게시물 제목</td>
				<td colspan="10"><form:textarea cols="20" rows="1"
						style="width:120%; border:none" path="sb_title" readonly="true" /></td>
				<td><font color="red"><form:errors path="sb_title" /></font></td>
			</tr>

			<tr>
				<td>게시물 내용</td>
				<td colspan="10"><form:textarea style="border:1 solid black"
						path="sb_content" readonly="true" cols="200" rows="20" /></td>
				<td><font color="red"><form:errors path="sb_content" /></font></td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<c:if test="display?sb_num=${sellerBoard.sb_num } != null">
					<td><img src="display?sb_num=${sellerBoard.sb_num} "
						width="210" height="180"></td>
				</c:if>
			</tr>
		</table>
	</form:form>



	<br>
	<div>
		<sec:authorize access="hasRole('ROLE_SELLER')">
			<button type="submit" id="btnEdit">편집하기</button>
		</sec:authorize>


		<button type="submit" id="btnList">목록으로</button>

	</div>



	<%-- ====== 상세 정보 보여주기 종료 ====== --%>
	<jsp:include page="sellerReply.jsp"></jsp:include>

</body>

<script>
	$(document)
			.ready(
					function() {

						var formObj = $("#sellerBoard");

						$("#btnList")
								.on(
										"click",
										function() {
											self.location = "/sellerBoard/sellerBoardList?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										});

					});

	$("#btnEdit")
			.on(
					"click",
					function() {
						var sb_num = $("#sb_num");
						var sb_numVal = sb_num.val();

						self.location = "/sellerBoard/sellerBoardModify?sb_num=${sellerBoard.sb_num}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
					});
</script>
</html>