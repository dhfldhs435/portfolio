<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 회원가입 페이지</title>
<style type="text/css">
th {
	width: 10%;
}

Button {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

Button:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

Button:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
	<h2>
		<script>
			var error = "<c:out value='${error}' />";
			var url = "<c:out value='${url}' />";
			if (error != "") {
				alert(error);
				location.href = url;
			}
		</script>
	</h2>

	<form:form modelAttribute="ebook" action="buy">
		<input type="hidden" value="${ebook.e_num}">
		<table style="width: 90%">
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="center">${ebook.e_title}</td>

			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>게시물 소개</th>
				<td align="center">${ebook.e_post_introduce}</td>

			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>저자</th>
				<td align="center">${ebook.e_writer}</td>


			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>저자소개</th>
				<td align="center">${ebook.e_profile}</td>


			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>연령제한</th>
				<td align="center">${ebook.e_age_limit}세이용가</td>

			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td align="center">${ebook.e_category}</td>


			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>목차</th>
				<td align="center">${ebook.e_table_content}</td>


			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>희망 판매 가격</th>
				<td align="center">${ebook.e_price}원</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<th>게시물 첨부파일</th>
				<td align="center">${ebook.e_attachment_type}</td>
			</tr>
			<tr>
				<th>평점</th>
				<td align="center"><fmt:formatNumber
						value="${ebook.e_rating / ebook.e_rating_cnt}" pattern=".0" />/5</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<sec:authorize access="!hasRole('ROLE_SELLER')">

				<tr>
					<td></td>
					<td><button style="width: 15%; height: 20%;" type="button"
							onclick="location.href='buy?e_num=${ebook.e_num}'">구매</button></td>
				</tr>

			</sec:authorize>
		</table>
		<br>


		<br>
		<br>
		<table>
			<tr>
				<th colspan="2">게시물 미리보기이미지</th>
			</tr>
			<tr>
				<td align="center" colspan="2"><img
					src="preview?e_num=${ebook.e_num}" style="width: 80%"></td>
			</tr>


		</table>
	</form:form>



</body>

</html>