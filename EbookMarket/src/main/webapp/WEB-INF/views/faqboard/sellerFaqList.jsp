<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.accordion {
background-color: #eee;
color: #444;
cursor: pointer;
width: 100%;
height:60px;
text-align:center;
border: none;
outline:  none;
transition: 0.4s;
}
.active, .accordion:hover {
background-color: #ccc;
}

.panel {
padding:  0 18px;
background-color: white;
display: none;
overflow: hidden;
}
</style>
</head>
<body>

	<h2>자주 묻는 질문</h2>

	<button class="accordion">개인 아이디 회원가입 방법</button>
	<div class="panel">
		개인 아이디 회원가입 방법 <p>1. EbookMarket으로 접속한 뒤 화면 좌측의 로그인 버튼을 누릅니다.</p> 
		<p>2. 아이디·비밀번호 입력란 아래의 회원가입을 누릅니다.</p>​ 
			<p>▶ 일반 회원 가입 ​ 회원가입 시 아래 내용을 참고하세요.</p>​ ​ 
			<p>1. 아이디 입력 방법 영문/숫자포함 8~20자만 사용가능합니다.</p>​  ​ 
			<p>2. 비밀번호 입력 방법 비밀번호는 영문/숫자포함 8~20자만 사용가능합니다.</p>​  
			<p>3. 주민번호 입력 방법 주민번호는 앞 6자리 + 뒷 맨앞1자리 기입입니다.</p>​ 
	</div>

	<button class="accordion">계정 도용 경로 안내</button>
	<div class="panel">
		<p>도용이 발생하는 경로 안내 계정 도용은 다양한 경로에서 발생할 수 있습니다.</p>​  ​ 
		<p>1. 보안이 허술한 사이트 보안 관리가 허술한 사이트에서는 개인정보가 유출될 위험이 높습니다. ​ 동일한 아이디와 비밀번호를 여러 사이트에서 사용하고
			있다면 해당 사이트에서 유출된 정보로 인해 다른 사이트의 개인정보까지 도용될 수 있습니다. ​ 사이트별로 다른 비밀번호를
			사용하면 이런 위험을 줄일 수 있습니다. ​ ▶ 사이트별로 다른 나만의 비밀번호 만드는 방법 </p>​ 
			<p>2. 악성코드 ​ 안전하지 않은 사이트를 방문하거나 악성코드를 유포하는 메일 첨부파일을 확인하는 등의 행위로 악성코드에 감염될 수 있습니다. ​
			도용자는 이를 이용해 아이디와 비밀번호를 탈취하고 변경합니다. ​ 이를 막기 위해서는 반드시 백신을 설치하고 실시간 감시
			기능을 실행 바랍니다. </p>​
			<p> 3. 공공장소 Wi-Fi(와이파이) ​ 공공장소의 무료 Wi-Fi는 보안이 취약해 고객님의
			계정정보가 탈취될 위험이 있습니다. ​ 가급적 출처를 알 수 없는 Wi-Fi는 사용하지 않는 것을 권합니다. ​ ※ 카페
			등의 공공장소에서 제공하는 공용 와이파이의 경우 정확한 와이파이 네트워크의 이름(SSID)을 확인하고 접속하시면 보다
			안전하게 인터넷을 이용할 수 있습니다.</p>
	</div>

	<button class="accordion">이용제한 사유 및 해제 요청</button>
	<div class="panel">
		<p>EbookMarket은 이용자들의 권리를 보호하고 건강한 인터넷 환경을 마련하고자 이용약관,
			이용정책 및 운영원칙을 정해두고 이에 어긋나는 활동은 제한하고 있습니다. ​ 이용제한 사유는 안내 메일 또는 로그인 후
			이용제한 안내 화면에서 직접 확인이 가능합니다. ​ ​ID, 커뮤니티 등 유형에 따라 제한 사유 및 해제 방법이 다릅니다.</p>
			<p>​1. ID가 글쓰기, 로그인 제한 등의 조치를 받은 경우 ID가 제한된 유형에 맞게 접수해 주세요. ​ ​​​▶ 로그인
			제한 사유 및 해제 요청 ▶ 글쓰기 제한 사유 및 해제 요청 ▶ 영구 이용제한 사유 및 해제 요청 ▶ 도용으로 인한 이용제한
			사유 및 해제 요청 </p>
			<p>2. 커뮤니티(블로그·카페)가 접근제한 등의 조치를 받은 경우 커뮤니티(블로그·카페) 제한 해제 요청
			시 문제 되는 게시물·내용을 삭제해 주세요.​ ​ ​​▶ 블로그 이용제한 해제 요청 ▶ 카페 이용제한 해제 요청</p> ​ 
			<p>3. 그 외 서비스 및 게시글이 삭제된 경우 블로그·카페를 제외한 그 외 서비스에 작성된 게시글이 삭제되거나 제한된 경우 문의해
			주세요.​ ​ ​​▶ 그 외 서비스 이용제한 해제 요청 ​ 네이버는 이용자 권리 보호와 건강한 인터넷 환경을 마련하고자
			이용약관, 이용정책 및 운영원칙을 정해두고 이에 어긋나는 활동은 제한합니다. ​ ​대표적으로 부적절한 홍보·청소년
			유해물·불법상품 판매 등 여러 유형이 있습니다. ​ ​이용제한될 수 있는 유해 게시물의 대표적인 유형은 아래 도움말을 통해
			상세하게 확인 바랍니다. ​ ​​▶ 이용제한 게시물 유형</p>
	</div>

	<button class="accordion">동명이인 노출 순서 기준 안내</button>
	<div class="panel">
		<p>이름이 같은 인물의 검색 결과 노출 순서는 사용자 검색과 클릭 수를 종합해서 자동으로 정해지며 유동적으로 움직입니다. ​ 
			기본적으로 1일 단위로 업데이트하며 전날까지의 사용자 검색과 클릭 수를 종합하여 매일 오전에 반영합니다.</p>
			<p>만약 특정 인물에 대한 사용자의 검색 수요가 큰 폭으로 급증하는 경우 이를 시스템이 감지하여 생성된 뉴스 기사량 등 최근 화제성을 반영하여 하루에 2회 이상 순서가 움직일 수 있습니다. ​ 그리고 네이버는 다양한
			인물정보를 적극적으로 확보해 140만 명이 넘는 인물정보를 제공하는데요, ​ 제공하는 인물정보 수가 커진 만큼 이름이 같은 인물도 42만 명 이상으로 증가했습니다.</p> ​ 
			<p>이에 동명이인 노출 기준을 일부 보완했습니다. ​ 가장 먼저 인물정보가
			지식베이스 구조로 전환되어 동명이인 간의 노출 순서를 정하는 기준 중 하나인 클릭수 합산 방식이 보완되었습니다. ​ ▶
			콘텐츠와 AI 기술의 결합: 네이버 지식베이스 ​ 검색 결과 첫 화면에서 클릭한 수와 하위 탭을 포함한 지식베이스 영역
			전체의 클릭 수도 자동으로 합산됩니다.</p>
	</div>

	<button class="accordion">검색어가 잘려서 검색되는 경우</button>
	<div class="panel">
		<p>검색어가 잘려서 검색되는 경우 입력한 검색어가 너무 길면 검색어의 일정 부분 이상을 잘라내어 검색 결과를
			제공합니다. ​ 정확한 검색을 위해서는 한글 약 50자 이내, 영문은 약 100자 이내로 입력하세요. ​</p>
	</div>

	<button class="accordion">프로필 설정</button>
	<div class="panel">
		<p>1. 프로필 EbookMarket MY 영역에 반영되는 사진 및 별명을 설정할 수 있는 프로필입니다. ​ 2.
			개별 프로필 특정 서비스 영역에서만 반영되는 프로필입니다. ​ 블로그, 포스트, 지식iN, 포토갤러리 등이 있으며, 서비스명
			선택 후 프로필을 수정하거나 EbookMarket 기본 프로필을 가져올 수 있습니다.</p>
	</div>

	<button class="accordion">구입내역 삭제버튼</button>
	<div class="panel">
		<p>구입내역 목록 오른쪽 위 삭제 버튼을 클릭하여, 삭제하고자 하는 내역을 선택 후 직접 삭제할 수 있습니다. ​

			편집 기능은 시리즈온 모바일웹 또는 PC 웹에서만 이용할 수 있으며, 웹에서 내역 삭제 시 시리즈온 앱에도 동시에
			반영됩니다.</p>
	</div>

	<button class="accordion">환불처리</button>
	<div class="panel">
		<p>이미 이용 완료된 예약 건이라면 결제 금액은 판매자로 정산되기 때문에 이를 EbookMarket이 임의 환불할 수
			없습니다. ​ EbookMarket는 통신판매의 당사자가 아니며, 상품의 정보, 거래 조건, 이용 및 환불 등과 관련한
			의무와 책임은 각 회원에게 있습니다. ​ 따라서 환불 문의 사항은 예약 상품의 판매 업체로 연락하여 협의 바랍니다.</p>
	</div>

	<button class="accordion">회원탈퇴</button>
	<div class="panel">
		<p>EbookMarket 예약에 연동(가입) 한 아이디를 해제해야 한다면 해지할수 없습니다. ​ EbookMarket
			탈퇴 관련 상세 문의는 EbookMarket 고객센터(☎ 010-4643-1292)로 연락 바랍니다.</p>
	</div>

</body>
<script>
	var acc = document.getElementsByClassName("accordion");//아코디언클래스리스트를가져온다.
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
		this.classList.toggle("active");

		var panel = this.nextElementSibling;

		if (panel.style.display === "block") {
			panel.style.display = "none";
			} else {
			panel.style.display = "block";
		}
	});
	}
</script>
</html>