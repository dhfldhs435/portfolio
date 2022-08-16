<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<h1 style="position: static; right: 50%;">창작물 등록 내역</h1>

	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="w"
				<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>저자</option>
			<option value="en"
				<c:out value="${scri.searchType eq 'en' ? 'selected' : ''}"/>>책번호</option>
			<option value="tw"
				<c:out value="${scri.searchType eq 'tw' ? 'selected' : ''}"/>>제목+저자</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword }" />
		<button id="searchBtn" type="button">검색</button>
	</div>
	<br>
	<table class="member">
		<tr>
			<th align="center" width="80">표지</th>
			<th align="center" width="80">제목</th>
			<th align="center" width="120">저자</th>
			<th align="center" width="150">등록일시</th>
			<th align="center" width="80">승인상태</th>
			<th align="center" width="80">삭제신청</th>
		</tr>
		<c:choose>
			<c:when test="${empty ebookList }">
				<tr>
					<td>게시물 목록이 비어있습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${ebookList}" var="ebook">
					<tr>
						<td align="center"><img src="cover?e_num=${ebook.e_num}"
							width="100"></td>
						<td align="center"><a
							href="read?e_num=${ebook.e_num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&Keyword=${scri.keyword}">
								${ebook.e_title}</a></td>
						<td align="left">${ebook.e_writer}</td>
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${ebook.e_reg_date}" /></td>
						<td align="left"><c:if
								test="${ebook.e_status == 'regapproval'}">
								등록승인</c:if> <c:if test="${ebook.e_status == 'regrefuse'}">
								등록거절</c:if> <c:if
								test="${ebook.e_status == 'regapply' || ebook.e_status ==  'delapply'}">
								심의중</c:if></td>
						<td><c:if test="${ebook.e_status != 'delapply'}">
								<a href="/ebook/remove?e_num=${ebook.e_num}">삭제신청</a>
							</c:if> <c:if test="${ebook.e_status == 'delapply'}">
								심의중</c:if></td>



					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>




	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev }">
				<li><a
					href="uploadList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li><a href="uploadList${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="uploadList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "uploadList" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
