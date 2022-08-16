<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 회원가입 페이지</title>
<style type="text/css">
.join {
	text-align: left;
	border-collapse: collapse;
	border-spacing: 0px;
	width: 100%;
	height: 100%;
	text-align: left;
	height: 80%;
	height: 90%;
}

.join td {
	border: 1px solid #fff;
	border-radius: 7px;
	background-color: #fff;
	vertical-align: middle;
	outline: none;
	text-indent: 10px;
	font-size: 12px;
	height: 30px;
}

.join th {
	width: 200px;
	border: 1px solid #fff;
	border-radius: 7px;
	background-color: #fff;
	vertical-align: middle;
	text-align: right;
	outline: none;
	text-indent: 10px;
	font-size: 15px;
	height: 30px;
	outline: none;
}

button {
	margin: 5px;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 10px 10px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-indigo {
	background-color: #fff;
	color: #1e6b7b;
}

.w-btn-indigo-outline {
	border: 3px solid aliceblue;
	color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
	color: #1e6b7b;
	background: aliceblue;
}

.w-btn:hover {
	letter-spacing: 2px;
	transform: scale(1.1);
	cursor: pointer;
}

.w-btn-outline:hover {
	letter-spacing: 2px;
	transform: scale(1.1);
	cursor: pointer;
}

.w-btn:active {
	transform: scale(1.1);
}

.w-btn-outline:active {
	transform: scale(1.1);
}

input {
	width: 200px;
	height: 30px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#rn2 {
	width: 20px;
}

#btnAgree {
	width: 20px;
	height: 15px;
}

#data {
	width: auto;
}
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	//카카오 주소 API
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("address").value = roadAddr
									+ data.jibunAddress + extraRoadAddr;

						} else {
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("address").value = roadAddr
									+ data.jibunAddress + '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
</head>
<body>

	<p align="left" style="font-size: xx-large;">회원가입</p>




	<form:form modelAttribute="seller" action="register"
		enctype="multipart/form-data">
		<table class="join" align="center">

			<tr>
				<th><h3 align="left">필수입력 사항</h3></th>
				<td></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><form:input path="s_id" />
					<button type="button" id="overlappedID" class="w-btn w-btn-indigo">중복검사</button>
					<span id="id_olmessage"> </span> <font color="red"><form:errors
							path="s_id" /></font></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw1" class="pw1" /><span
					id="alert-lengthDanger"
					style="display: none; color: #d92742; font-weight: bold;">8자이상
						입력해주세요.</span></td>
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td><form:input path="s_pw" type="password" id="pw2"
						class="pw2" /> <span id="alert-success" style="display: none;">비밀번호가
						일치합니다.</span> <span id="alert-danger"
					style="display: none; color: #d92742; font-weight: bold;">비밀번호가
						일치하지 않습니다.</span> <font color="red"><form:errors path="s_pw" /></font></td>
			</tr>

			<tr>
				<th>닉네임</th>
				<td><form:input path="s_nickname" />
					<button type="button" id="overlappedNickname"
						class="w-btn w-btn-indigo">중복검사</button> <span id="nick_olmessage"></span>
					<font color="red"><form:errors path="s_nickname" /></font></td>
			</tr>

			<tr>
				<th>이름</th>
				<td><form:input path="s_name" /> <font color="red"><form:errors
							path="s_name" /></font></td>
			</tr>

			<tr>
				<th>주민번호</th>
				<td><input type="text" maxlength="6" id="rn1">&nbsp;-&nbsp;<input
					type="password" maxlength="1" id="rn2"> <font size="1px">●●●●●●</font>
					<form:input path="s_resident_num" type="hidden" /> <font
					color="red"><form:errors path="s_resident_num" /></font></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><form:input path="s_email" type="email" />
					<button type="button" id="overlappedEmail"
						class="w-btn w-btn-indigo">중복검사</button> <span
					id="email_olmessage"> </span> <font color="red"><form:errors
							path="s_email" /></font></td>
			</tr>

			<tr>
				<th>핸드폰번호</th>
				<td><form:input path="s_phone" type="tel" />("-"없이 입력해주세요.) <font
					color="red"><form:errors path="s_phone" /></font></td>
			</tr>


			<tr>
				<th>주소</th>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<button type="button" onclick="sample4_execDaumPostcode()"
						class="w-btn w-btn-indigo">우편번호 찾기</button></td>

			</tr>

			<tr>
				<th></th>
				<td><form:input path="s_address" id="address" size="50px" /> <font
					color="red"><form:errors path="s_address" /></font></td>
			</tr>
			<tr>
				<th></th>
				<td><span id="guide" style="color: #999; display: none"></span></td>
			</tr>

			<tr>
				<th>은행명</th>
				<td><form:input path="s_bank_name" /> <font color="red"><form:errors
							path="s_bank_name" /></font></td>
			</tr>

			<tr>
				<th>계좌번호</th>
				<td><form:input path="s_account_num" /> <font color="red"><form:errors
							path="s_account_num" /></font></td>
			</tr>

			<tr>
				<th>예금주명</th>
				<td><form:input path="s_ah_name" /> <font color="red"><form:errors
							path="s_ah_name" /></font></td>

			</tr>
			<tr>
				<th>질문</th>
				<td><form:input path="s_answer" /> <font color="red"><form:errors
							path="s_answer" /></font></td>

			</tr>



			<tr>
				<th><h3 align="left">선택입력 사항</h3></th>
				<td></td>
			</tr>

			<tr>
				<th>자격증 세부사항</th>
				<td colspan="2"><form:textarea path="s_certificate_detail"></form:textarea>
					<font color="red"><form:errors path="s_certificate_detail" /></font></td>
			</tr>

			<tr>
				<th>자격증 첨부파일</th>
				<td><form:input path="s_certificate_data" type="file" id="data" />
			</tr>


			<tr>
				<th>경력, 수상이력 세부사항</th>
				<td colspan="2"><form:textarea path="s_career_detail"></form:textarea>
					<font color="red"><form:errors path="s_career_detail" /></font></td>
			</tr>
			<tr>
				<th>경력, 수상이력 첨부파일</th>
				<td><form:input path="s_career_data" type="file" id="data" /></td>
			</tr>


			<!-- 판매약관 동의 -->
			<tr>
				<td colspan="2"><jsp:include page="sellerAgree.jsp" /> <input
					type="radio" id="s_seller_agree" class="btnAgree" /> <font
					size="5px"> <spring:message code="action.agree" /></font></td>
				<!-- 컨텐츠등록 약관 동의 -->
			<tr>
				<td colspan="2"><jsp:include page="contentAgree.jsp" /> <input
					type="radio" id="s_content_agree" class="btnAgree"><font
					size="5px"> <spring:message code="action.agree" /></font></td>
			</tr>
			<!-- 개인정보 이용 약관 동의 -->
			<tr>
				<td colspan="2"><jsp:include page="privatyAgree.jsp" /> <input
					type="radio" id="s_privaty_agree" class="btnAgree"> <font
					size="5px"> <spring:message code="action.agree" /></font></td>
			</tr>

		</table>
	</form:form>

	<h2>
		<font color="red">${error}</font>
	</h2>

	<div>
		<button type="button" id="btnRegister" class="w-btn w-btn-indigo">회원가입</button>
	</div>

	<br>
	<br>

</body>
<script>
	$("#overlappedID").click(function() {
		const id = $("#s_id").val();

		$.ajax({
			type : "get",
			async : false,
			url : "http://localhost:8080/seller/idCheck",
			data : {
				id : id
			},
			success : function(data) {

				if (data == 2) {

					$("#id_olmessage").text("아이디를 입력해주세요.");

				} else if (data == 1) {

					$("#id_olmessage").text("이미 사용중인 ID 입니다.");
					document.getElementById('s_id').value = '';

				} else {

					$("#id_olmessage").text("사용 가능한 ID 입니다.");
				}

			}

		})

	});

	$("#overlappedNickname").click(function() {
		const nickname = $("#s_nickname").val();

		$.ajax({
			type : "get",
			async : false,
			url : "http://localhost:8080/seller/nicknameCheck",
			data : {
				nickname : nickname
			},
			success : function(data) {

				if (data == 2) {

					$("#nick_olmessage").text("닉네임을 입력해주세요.");

				} else if (data == 1) {

					$("#nick_olmessage").text("이미 사용중인 닉네임 입니다.");
					document.getElementById('s_nickname').value = '';

				} else {

					$("#nick_olmessage").text("사용 가능한 닉네임 입니다.");
				}

			}

		})

	});

	$("#overlappedEmail").click(function() {
		const email = $("#s_email").val();

		$.ajax({
			type : "get",
			async : false,
			url : "http://localhost:8080/seller/emailCheck",
			data : {
				email : email
			},
			success : function(data) {

				if (data == 2) {

					$("#email_olmessage").text("이메일을 입력해주세요.");

				} else if (data == 1) {

					$("#email_olmessage").text("이미 사용중인 이메일 입니다.");
					document.getElementById('s_email').value = '';

				} else {

					$("#email_olmessage").text("사용 가능한 이메일 입니다.");
				}

			}

		})

	});

	//비밀번호 8자 미만으로 입력시 공백처리
	$('.pw1').focusout(function() {
		var pwd1 = $("#pw1").val();

		if (pwd1.length < 8) {
			$("#alert-lengthDanger").css('display', 'inline-block');
			document.getElementById('pw1').value = '';

		} else {

			$("#alert-lengthDanger").css('display', 'none');
		}

	});

	//비밀번호 일치 확인
	$('.pw2').focusout(function() {
		var pwd1 = $("#pw1").val();
		var pwd2 = $("#pw2").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
				document.getElementById('pw2').value = '';
			}
		}
	});

	//등록 폼 전송
	$(document).ready(function() {

		var formObj = $("#seller");

		$("#btnRegister").on("click", function() {
			var rn1 = $("#rn1").val();
			var rn2 = $("#rn2").val();
			document.getElementById('s_resident_num').value = rn1 + rn2;
			formObj.submit();

			if (document.getElementById('s_seller_agree').checked == false) {
				alert("판매 약관 동의을하셔야합니다");
				return false;

			}
			if (document.getElementById('s_content_agree').checked == false) {
				alert("컨텐츠 이용약관 동의을하셔야합니다");
				return false;
			}
			if (document.getElementById('s_privaty_agree').checked == false) {
				alert("개인정보 이용약관 동의을하셔야합니다");
				return false;
			} else {
				return true;
			}
		});

	});
</script>


<script>
	$(function() {
		$('#searchBtn2').click(
				function() {
					self.location = "/ebook/ebookList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("#header option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keyword2').val());
				});
	});
</script>
</html>