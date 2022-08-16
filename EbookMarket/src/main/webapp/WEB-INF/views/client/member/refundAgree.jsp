<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board_write.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('submit1').onclick = function() {
			alert('click');
		};
	};
</script>
</head>

<body>
	<div class="con_txt">
		<div class="contents_sub">
			<!--게시판-->
			<div class="board_write">
				<div
					style="padding-top: 7px; padding-bottom: 5px; font-weight: bold; padding-left: 7px; font-family: Gulim, Tahoma, verdana;">※
					e-Book market 환불 정책에 관한 안내</div>
				<div style="padding-left: 10px;">
					<textarea name="content" class="board_editor_area"
						readonly="readonly"
						style="width: 88%; height: 200px; font-size: 20px; letter-spacing: -0.1em; border: 1px solid #c5c5c5; background-color: #fff; padding-left: 14px; padding-top: 7px; font-family: 고딕">
[제 1장 환불]

(1) 환불 상세

1. 구매자가 판매자의 합의 이후 e-book Market 회사에 환불요청을 할 수 있습니다.
2. 회사는 활불요청 승락 이후 환불 가능합니다.

※ 결제 후 7일 이내에 다운이 없는 경우 전액 환불됩니다.
※ 그 외에는 다운 여부와 상관없이 환불이 불가합니다.


(2) 유의사항

◾️ e-book Market이 회원이 관계 법령 또는 이용약관 등을 위반한 경우 이용약관 및 정책에 따라 환불을 거부할 수 있습니다.


(3) 기타

◾️ 서비스 품질 및 시스템에 관한 허위 사실을 근거로 환불을 요청한 경우, 손해배상청구 및 민사처벌의 대상이 될 수 있습니다.

◾️ e-book Market은 전자상거래 등에서의 소비자 보호에 관한 법률 및 기타 관계 법령을 참고하며, 또한 본 내용에 포함하지 않는 내용은 e-book Market 이용약관에 의거하여 기준을 판단합니다.
									</textarea>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단 디자인 -->

</body>
</html>