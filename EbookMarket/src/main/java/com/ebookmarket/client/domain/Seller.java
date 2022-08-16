package com.ebookmarket.client.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Seller {

	private int s_num; // 판매자 회원 일련번호

	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	@Pattern(regexp = "^[a-z0-9_-]{4,10}$", message = "아이디는 영문/숫자포함 4~10자만 사용가능합니다")
	private String s_id; // 판매자 회원 아이디

	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,20}", message = "영문,숫자,특수기호가 적어도1개 이상씩 포함된 8~20자의 문자 조합을 입력해주세요.")
	private String s_pw; // 판매자 회원 비밀번호

	@NotBlank(message = "닉네임은 필수 입력 값입니다.")
	@Pattern(regexp = "^[a-zA-z가-힣0-9_-]{2,10}$", message = "닉네임은 영문/숫자포함 2~10자만 사용가능합니다")
	private String s_nickname; // 판매자 회원 닉네임

	@NotBlank(message = "이름은 필수 입력 값입니다.")
	@Pattern(regexp = "^[a-zA-Z가-힣]{2,5}$", message = "이름은 한글/영어 2~5자만 사용가능합니다")
	private String s_name; // 판매자 회원 이름

	@NotBlank(message = "주민번호는 필수 입력 값입니다.")
	@Pattern(regexp = "\\d{2}([0]\\d|[1][0-2])([0][1-9]|[1-2]\\d|[3][0-1])[1-4]", message = "주민번호는 7자리를 입력하셔야 합니다")
	private String s_resident_num; // 판매자 회원 주민번호

	@NotBlank(message = "휴대폰번호는 필수 입력 값입니다.")
	@Pattern(regexp = "^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$", message = "휴대폰번호는 숫자 11자리를 입력해주세요")
	private String s_phone; // 판매자 회원 휴대폰번호

	@NotBlank(message = "주소는 필수 입력 값입니다.")
	@Pattern(regexp = "^[A-Za-z0-9가-힣\s()-]{1,}", message = "주소는 필수 입력 값입니다.")
	private String s_address; // 판매자 회원 주소

	@NotBlank(message = "은행명은 필수 입력 값입니다.")
	@Pattern(regexp = "^[가-힣]+$", message = "유효한 은행명을 입력하셔야합니다.")
	private String s_bank_name; // 판매자 회원 은행명

	@NotBlank(message = "계좌번호는 필수 입력 값입니다.")
	@Pattern(regexp = "^[0-9-]+$", message = "유효한 계좌번호를 입력하셔야합니다.")
	private String s_account_num; // 판매자 회원 계좌번호

	@NotBlank(message = "예금주명은 필수 입력 값입니다.")
	@Pattern(regexp = "^[a-zA-Z가-힣]{1,10}$", message = "예금주명을 정확히 입력해주세요")
	private String s_ah_name; // 판매자 회원 예금주명

	private boolean s_seller_agree; // 판매 약관 동의 여부
	private boolean s_content_agree; // 컨텐츠등록 약관 동의 여부
	private boolean s_privaty_agree; // 개인정보 이용 약관 동의 여부

	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	@Email
	private String s_email; // 판매자 회원 이메일

	private Date s_join_date; // 판매자 회원 가입일자

	private MultipartFile s_profile_img; // 판매자 회원 프로필이미지
	private String s_profile_imgUrl; // 판매자 회원 프로필이미지 파일명

	private MultipartFile s_certificate_data; // 판매자 회원 자격증 증빙자료
	private String s_certificate_dataUrl; // 판매자 회원 자격증 증빙자료 파일명
	private String s_certificate_detail; // 판매자 회원 자격증 세부사항

	private MultipartFile s_career_data; // 판매자 회원 경력 & 수상이력 증빙자료
	private String s_career_dataUrl; // 판매자 회원 경력 & 수상이력 증빙자료 파일명
	private String s_career_detail; // 판매자 회원 경력 & 수상이력

	private String s_grade; // 판매자 회원 등급

	private String s_answer; // 판매자 회원가입시 입력한 정답

	private List<SellerAuth> authList;
}
