<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 수정 페이지</title>
<style type="text/css">
th {
	text-align: left;
}

td {
	text-align: left;
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

	<h1>계정 관리</h1>

	<form:form modelAttribute="seller" action="modify"
		enctype="multipart/form-data">

		<table>
			<tr>

				<td><form:input path="s_num" type="hidden" /></td>

			</tr>

			<tr>
				<th>필수입력 사항</th>
			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" id="pw" class="pw" /><span
					id="pw_olmessage"> </span></td>
			</tr>

			<tr>
				<td>변경할 비밀번호</td>
				<td><input type="password" id="pw1" class="pw1" /><span
					id="alert-lengthDanger"
					style="display: none; color: #d92742; font-weight: bold;">8자이상
						입력해주세요.</span></td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td><form:input path="s_pw" type="password" id="pw2"
						class="pw2" /> <span id="alert-success" style="display: none;">비밀번호가
						일치합니다.</span> <span id="alert-danger"
					style="display: none; color: #d92742; font-weight: bold;">비밀번호가
						일치하지 않습니다.</span></td>
				<td><font color="red"><form:errors path="s_pw" /></font></td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td><form:input path="s_nickname" /><input type="button"
					id="overlappedNickname" value="중복검사"><span
					id="nick_olmessage"></span></td>
				<td><font color="red"><form:errors path="s_nickname" /></font></td>
			</tr>


			<tr>
				<td>이메일</td>
				<td><form:input path="s_email" type="email" /><input
					type="button" id="overlappedEmail" value="중복검사"><span
					id="email_olmessage"> </span></td>
				<td><font color="red"><form:errors path="s_email" /></font></td>
			</tr>

			<tr>
				<td>핸드폰번호</td>
				<td><form:input path="s_phone" type="tel" />("-"없이 입력해주세요.)</td>
				<td><font color="red"><form:errors path="s_phone" /></font></td>
			</tr>


			<tr>
				<td>주소</td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호"><input
					type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>

			</tr>

			<tr>
				<td></td>
				<td><form:input path="s_address" id="address" size="50px" /></td>
				<td><font color="red"><form:errors path="s_address" /></font></td>
			</tr>
			<tr>
				<td></td>
				<td><span id="guide" style="color: #999; display: none"></span></td>
			</tr>

			<tr>
				<td>은행명</td>
				<td><form:input path="s_bank_name" /></td>
				<td><font color="red"><form:errors path="s_bank_name" /></font></td>
			</tr>

			<tr>
				<td>계좌번호</td>
				<td><form:input path="s_account_num" /></td>
				<td><font color="red"><form:errors path="s_account_num" /></font></td>
			</tr>

			<tr>
				<td>예금주명</td>
				<td><form:input path="s_ah_name" /></td>
				<td><font color="red"><form:errors path="s_ah_name" /></font></td>

			</tr>
			<tr>
				<td>질문</td>
				<td><form:input path="s_answer" /></td>
				<td><font color="red"><form:errors path="s_answer" /></font></td>

			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>

			<tr>
				<th>선택입력 사항</th>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td>자격증 세부사항</td>
				<td><form:textarea path="s_certificate_detail"></form:textarea></td>
				<td><font color="red"><form:errors
							path="s_certificate_detail" /></font></td>
			</tr>
			<tr>
				<td>자격증 첨부파일</td>
				<td><form:input path="s_certificate_data" type="file" />
			</tr>

			<tr>
				<td>경력, 수상이력 세부사항</td>
				<td><form:textarea path="s_career_detail"></form:textarea></td>
				<td><font color="red"><form:errors
							path="s_career_detail" /></font></td>
			</tr>
			<tr>
				<td>경력, 수상이력 첨부파일</td>
				<td><form:input path="s_career_data" type="file" />
			</tr>

		</table>
	</form:form>

	<div>
		<button type="button" id="btnModify">수정</button>
	</div>

</body>
<script>
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

	//기존비밀번호 확인
	$('.pw').focusout(function() {
		var pw = $("#pw").val();
		var s_num = $("#s_num").val();

		$.ajax({
			type : "get",
			async : false,
			url : "http://localhost:8080/seller/pwCheck",
			data : {
				pw : pw,
				s_num : s_num
			},
			success : function(data) {

				if (data == 2) {

					$("#pw_olmessage").text("기존 비밀번호를 입력해주세요.");

				} else if (data == 0) {

					$("#pw_olmessage").text("비밀번호가 일치하지 않습니다.");
					document.getElementById('pw').value = '';

				} else {

					$("#pw_olmessage").text("비밀번호가 확인되었습니다.");
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

	$(document).ready(function() {

		var formObj = $("#seller");

		$("#btnModify").on("click", function() {

			formObj.submit();
		});

	});
</script>
</html>