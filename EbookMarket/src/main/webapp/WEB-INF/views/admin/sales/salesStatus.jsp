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
</style>
</head>
<body>
	<h1 style="position: static; right: 50%;">
		<spring:message code="sales.header.salesstatus" />
	</h1>

	<div class="search">
		<select name="searchType" id="ID">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="e"
				<c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>책일련번호</option>
			<option value="te"
				<c:out value="${scri.searchType eq 'te' ? 'selected' : ''}"/>>제목+번호</option>
		</select> </select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword }" />

		<button id="searchBtn" type="button">검색</button>

	</div>
	<br>


	<table class=member>
		<tr>
			<th align="center" width="90"><spring:message
					code="creation.eno" /></th>
			<th align="center" width="180"><spring:message
					code="creation.regdate" /></th>
			<th align="center" width="100"><spring:message
					code="creation.category" /></th>
			<th align="center" width="360"><spring:message
					code="creation.title" /></th>
			<th align="center" width="120"><spring:message
					code="creation.nickname" /></th>
			<th align="center" width="120"><spring:message
					code="creation.price" /></th>
			<th align="center" width="100"><spring:message
					code="creation.sellcnt" /></th>
			<th align="center" width="100"><spring:message
					code="creation.refundcnt" /></th>
			<th align="center" width="120"><spring:message
					code="creation.total" /></th>
		</tr>
		<c:choose>
			<c:when test="${empty salesStatus }">
				<tr>
					<td colspan="9"><spring:message code="common.listEmpty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${salesStatus}" var="salesstatus">
					<tr>
						<td align="center">${salesstatus.e_num }</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${salesstatus.e_reg_date }" /></td>
						<td align="center">${salesstatus.e_category }</td>
						<td align="center">${salesstatus.e_title }</td>
						<td align="center">${salesstatus.s_nickname }</td>
						<td align="center">${salesstatus.e_price }</td>
						<td align="center">${salesstatus.e_sell_cnt }</td>
						<td align="center">${salesstatus.e_refund_cnt }</td>
						<td align="center">${salesstatus.e_total }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>


	<br>
	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev }">
				<li><a
					href="salesStatus${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li><a href="salesStatus${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="salesStatus${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>


		</ul>
	</div>
	<br />

	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "salesStatus"
								+ '${pageMaker.makeQuery(1)}' + "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					})
		});
	</script>