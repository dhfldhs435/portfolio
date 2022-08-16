<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

.member tr td:nth-child(7n) {
	color: red;
	font-weight: 500;
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
	text-align: right;
	bottom: 5px;
}

.actionbutton {
	position: relative;
	left: 48%;
}
</style>
</head>
<body>
	<h1 style="position: static; right: 50%;">판매자 회원 공지사항</h1>

	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="sn"
				<c:out value="${scri.searchType eq 'sn' ? 'selected' : ''}"/>>공지번호</option>
			<option value="st"
				<c:out value="${scri.searchType eq 'st' ? 'selected' : ''}"/>>제목</option>
			<option value="sw"
				<c:out value="${scri.searchType eq 'sw' ? 'selected' : ''}"/>>작성자</option>
			<option value="stsw"
				<c:out value="${scri.searchType eq 'stsw' ? 'selected' : ''}"/>>제목+작성자</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword }" />

		<button id="searchBtn" type="button">검색</button>

	</div>
	<br>

	<table class="member">
		<tr>
			<th align="center" width="80"><spring:message code="notice.no" /></th>
			<th align="center" width="320"><spring:message
					code="notice.title" /></th>
			<th align="center" width="150"><spring:message
					code="notice.regdate" /></th>
			<th align="center" width="80"><spring:message
					code="notice.writer" /></th>
		</tr>

		<c:choose>
			<c:when test="${empty noticeListS }">
				<tr>
					<td colspan="4"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${noticeListS}" var="notice">
					<tr>
						<td align="center">${notice.sn_num }</td>
						<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
						<td align="left"><a
							href="sellerRead?sn_num=${notice.sn_num }"> ${notice.sn_title }</a></td>
						<td align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${notice.sn_reg_date }" /></td>
						<td align="center">${notice.sn_writer }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<br>
	<div class="actionbutton">
		<a href="sellerRegister"><button type="button">
				<spring:message code="action.new" />
			</button></a>
	</div>




	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev }">
				<li><a
					href="sellerList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li><a href="sellerList${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="sellerList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "sellerList"
								+ '${pageMaker.makeQuery(1)}' + "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					})
		});
		var result = "${msg}";

		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess' />");
		}
	</script>