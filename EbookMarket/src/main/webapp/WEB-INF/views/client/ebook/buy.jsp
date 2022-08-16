<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 구매 페이지</title>
</head>

<style>
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
<body>

	<table align="center">
		<Br>
		<tr>
			<!-- 구매 페이지 -->
			<td><h1>
					<spring:message code="buy.buypage" />
				</h1></td>
		</tr>
		<tr>
			<!-- 표지 이미지 -->
			<td><img src="cover?e_num=${ebook.e_num}"
				style="width: 100%; height: 250%;"></td>
		</tr>

		<tr>
			<!-- 제목 -->
			<td><Br> <spring:message code="buy.title" />:
				${ebook.e_title}</td>
			<!-- 저자 -->
		<tr>
			<td><spring:message code="buy.writer" />: ${ebook.e_writer}</td>
		</tr>
		<tr>
			<!-- 가격 -->
			<td><spring:message code="buy.price" />: ${ebook.e_price}원</td>
		</tr>
		<br>
	</table>
	<Br>
	<Br>
	<form:form modelAttribute="ebook" action="buy">
		<fieldset>
			<!-- 이용약관 동의 -->
			<legend>
				<spring:message code="buy.termsandconditions" />
			</legend>

			<!-- 서비스 이용약관 -->
			<h2 align="left">
				<spring:message code="buy.serviceagree" />
				<jsp:include page="serviceAgree.jsp"></jsp:include>
			</h2>
			<h4>
				<input type="checkbox" name="checkTmp" id="checkbox1" value="Y" />
				<spring:message code="action.agree" />
			</h4>


			<!-- 만14세이상 이용약관 -->
			<h2 align="left">
				<spring:message code="buy.fourteenagree" />
				<jsp:include page="fourteenAgree.jsp"></jsp:include>
			</h2>
			<h4>
				<input type="checkbox" name="checkTmp" id="checkbox2" value="Y" />
				<spring:message code="action.agree" />
			</h4>

			<!-- 개인정보 보호약관 -->
			<h2 align="left">
				<spring:message code="buy.privatyagree" />
				<jsp:include page="privatyAgree.jsp"></jsp:include></h2>
			<h4>
				<input type="checkbox" name="checkTmp" id="checkbox3" value="Y" />
				<spring:message code="action.agree" />
			</h4>


			<!-- 기타 등등 -->
			<h2 align="left">
				<spring:message code="buy.agree" />
				<jsp:include page="agree.jsp"></jsp:include></h2>
			<h4>
				<input type="checkbox" name="checkTmp" id="checkbox4" value="Y" " />
				<spring:message code="action.agree" />
			</h4>
			<br>
			<h3>
				<input type="checkbox" id="checkAll"> 전체 선택
			</h3>
		</fieldset>
	</form:form>
	<Br>
	<div>
		<h1>
			<spring:message code="buy.totalprice" />
			${ebook.e_price}원
		</h1>
	</div>

	<%-- <table>
		<tr>
		<!-- 구매하기 버튼 -->
		<td><a href="buySuccess?e_num=${ebook.e_num}" >구매</a></td>
		</tr>
		</table> --%>



	<div>
		<!-- 구매하기 버튼 -->
		<%-- <button type="submit" id="btnBuy"><spring:message code="buy.buy" /></button>
		 --%>
		<br>
		<button type="button" id="next" disabled
			onclick="location.href='buyForm?e_num=${ebook.e_num}'">구매</button>
		<!-- 돌아가기 버튼 -->
		<button type="submit" id="btnReset">
			<spring:message code="buy.reset" />
		</button>
	</div>
	<br>
	<!-- 구매 스크립트 -->
	<script>
		$(document).ready(function() {

			var formObj = $("#ebook");

			//게시물 구매하기
			$("#btnBuy").on("click", function() {
				/* self.location="/ebook/buySuccess?e_num=${ebook.e_num}"; */
				formObj.submit();

			});
			$("#btnReset").on("click", function() {
				location.href = "/";
			});
		});
	</script>
	<script>
		// 전체 선택에 따른 하위 체크박스(checkTmp)의 활성/비활성화 여부 
		$('#checkAll').change(function() {
			var checked = $(this).prop('checked');
			$('input[name="checkTmp"]').prop('checked', checked);
		});

		$('input[name="checkTmp"]')
				.change(
						function() {
							var tmpLength = $('input[name="checkTmp"]').length;
							var checkedLength = $('input[name="checkTmp"]:checked').length;
							var selectAll = (tmpLength == checkedLength);
							$('#checkAll').prop('checked', selectAll);
							selectAll ? $('#next').removeAttr('disabled') : $(
									'#next').attr('disabled', 'disabled');
						});
		// 전체선택 checkbox의 상태에 따라 id = next 값을 가진 버튼의 비활성화를 적용/해제
		$('#checkAll').change(
				function() {
					// #checkAll 의 값이 true 인 경우 $('#next').removeAttr('disabled')
					// #checkAll 의 값이 false 인 경우 $('#next').attr('disabled','disabled'); 이 적용됨.
					$(this).prop('checked') ? $('#next').removeAttr('disabled')
							: $('#next').attr('disabled', 'disabled');
				});
	</script>

	<!-- 이용약관 view 스크립트  -->
	<script>
		$(document).ready(function() {

			//서비스 이용 약관 보기
			$("#btnServiceAgree").on("click", function() {
				window.open("serviceAgree", "서비스 이용 약관");
				button();
			});

			//만14세이상 이용 약관 보기
			$("#btnFourteenAgree").on("click", function() {
				window.open("fourteenAgree", "만14세이상 이용 약관");
				button();
			});

			//개인정보 보호 약관 보기
			$("#btnPrivatyAgree").on("click", function() {
				window.open("privatyAgree", "개인정보 보호 약관");
				button();
			});

			//기타 등등 약관 보기
			$("#btnAgree").on("click", function() {
				window.open("agree", "기타 등등 약관");
				button();
			});

		});
	</script>

</body>
</html>