<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>

	<table class="member">
		<tr>
			<th align="center" width="10" height="10">표지</th>
			<th align="center" width="150">제목</th>
			<th align="center" width="150">저자</th>
			<th align="center" width="150">카테고리</th>
			<th align="center" width="150">가격</th>
			<th align="center" width="150">평점</th>
			<th align="center" width="280">등록일시</th>
		</tr>
		<c:choose>
			<c:when test="${empty ebookList }">
				<tr>
					<td colspan="4">게시물 목록이 비어있습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${ebookList}" var="ebook">
					<tr>
						<td align="center"><img src="cover?e_num=${ebook.e_num}"
							width="100"></td>
						<td align="center"><a
							href="/ebook/read?e_num=${ebook.e_num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&Keyword=${scri.keyword}">
								${ebook.e_title}</a></td>
						<td align="center">${ebook.e_writer}</td>
						<td align="center">${ebook.e_category}</td>
						<td align="center">${ebook.e_price}원</td>
						<td align="center"><c:if test="${ebook.e_rating != 0}">
								<fmt:formatNumber value="${ebook.e_rating / ebook.e_rating_cnt}"
									pattern=".0" />/5</c:if> <c:if test="${ebook.e_rating == 0}">0.0/5</c:if></td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ebook.e_reg_date}" /></td>



					</tr>

				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<div>
		<ul>
			<c:if test="${pageMaker.prev }">
				<li><a
					href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li><a href="/ebook/ebookList${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>


		</ul>
	</div>