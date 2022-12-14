<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	justify-content: center;
	align-items: center;
	display: flex;
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
	<h1 style="position: static; right: 50%;">
		<spring:message code="mb.list" />
	</h1>

	<sec:authorize access="hasRole('ROLE_MEMBER')">

	</sec:authorize>

	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>??????</option>
			<option value="c"
				<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>??????</option>
			<option value="mn"
				<c:out value="${scri.searchType eq 'mn' ? 'selected' : ''}"/>>????????????</option>
			<option value="tc"
				<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>??????+??????</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword }" />
		<button id="searchBtn" type="button">??????</button>
	</div>
	<br>



	<table class="member">
		<tr>
			<th align="center" width="80"><spring:message code="mb.num" /></th>
			<th align="center" width="120">?????????</th>
			<th align="center" width="350"><spring:message code="mb.title" /></th>
			<%-- <th align="center" width="200"><spring:message code="mb.content" /></th> --%>
			<th align="center" width="100"><spring:message
					code="mb.processing" /></th>
			<th align="center" width="180"><spring:message code="mb.regDate" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty memberBoardList}">
				<tr>
					<td colspan="5"><spring:message code="mb.empty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${memberBoardList}" var="memberBoard">
					<tr>
						<td align="center">${memberBoard.mb_num}</td>
						<td align="center">${memberBoard.mb_writer }</td>

						<td align="center"><a
							href='/memberBoard/memberBoardRead?mb_num=${memberBoard.mb_num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&Keyword=${scri.keyword}'>${memberBoard.mb_title }</a></td>

						<%-- <td align="center">${memberBoard.mb_content}</td> --%>
						<td align="center">${memberBoard.mb_processing }</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${memberBoard.mb_reg_Date }" /></td>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<div class="actionbutton">
			<button type="button"
				onclick="location.href='/memberBoard/memberBoardRegister'	">
				<spring:message code="mb.new" />
			</button>
		</div>
	</sec:authorize>


	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev }">
				<li><a
					href="memberBoardList${pageMaker.makeSearch(pageMaker.startPage - 1)}"><spring:message
							code="common.back" /></a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li><a href="memberBoardList${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="memberBoardList${pageMaker.makeSearch(pageMaker.endPage + 1)}">??????</a></li>
			</c:if>


		</ul>
	</div>






	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "memberBoardList"
								+ '${pageMaker.makeQuery(1)}' + "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					});
		});
		var result = "${msg}";

		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess'/>");
		}
	</script>