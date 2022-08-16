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
	<!-- 상단 메시지 -->
	<h1 style="position: static; right: 50%;">판매내역</h1>
	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="p"
				<c:out value="${scri.searchType eq 'p' ? 'selected' : ''}"/>>구매일련번호</option>
			<option value="tp"
				<c:out value="${scri.searchType eq 'tp' ? 'selected' : ''}"/>>제목+번호</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword }" />
		<button id="searchBtn" type="button">검색</button>
	</div>
	<br>
	<table class="member" F>
		<tr>
			<!-- 구매 상품 번호 -->
			<th align="center" width="80">결제번호</th>

			<!-- 구매 상품 제목 -->
			<th align="center" width="150"><spring:message
					code="download.title" /></th>

			<!-- 구매 일시 -->
			<th align="center" width="150"><spring:message
					code="download.buydate" /></th>

			<!-- 판매금액 -->
			<th align="center" width="150">판매금액</th>

			<!-- 판매금액 -->
			<th align="center" width="100">비고</th>



		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">
						<!-- 구매 상품 없을시 메시지 출력 --> <spring:message code="download.empty" />
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="purchase">
					<tr>
						<!-- 구매 일련번호 -->
						<td align="center">${purchase.p_num}</td>

						<!-- 제목 -->
						<td align="center">${purchase.e_title}</td>

						<!-- 구 매 일시 -->
						<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${purchase.p_reg_date}" /></td>

						<!-- 판매금액 -->
						<td align="center">${purchase.e_price}원</td>

						<!-- 비고 -->
						<td align="center"><c:if
								test="${purchase.p_status == 'refundApply'}">
								 환불접수
							</c:if> <c:if test="${purchase.p_status == 's_refuse'}">심의중</c:if> <c:if
								test="${purchase.p_status == 'refundApproval'}">환불완료</c:if></td>



					</tr>

				</c:forEach>
			</c:otherwise>

		</c:choose>
	</table>



	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev }">
				<li><a
					href="sellerSalesList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li><a href="sellerSalesList${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="sellerSalesList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "sellerSalesList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				})
	});
</script>
</html>