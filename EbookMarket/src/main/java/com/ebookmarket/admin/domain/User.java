package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {

	private Integer m_num; // 일반회원 일련번호
	private Date m_join_date; // 일반회원 가입일자
	private String m_id; // 일반회원 아이디
	private String m_name; // 일반회원 이름
	private String m_age; // 일반회원 나이
	private String m_mail; // 일반회원 이메일
	private String totalPayment; // 총 결제 금액
	private Integer purchase_cnt; // 총 구매 수량

	private Integer s_num; // 판매자회원 일련번호
	private Date s_join_date; // 판매자회원 가입일자
	private String s_id; // 판매자회원 아이디
	private String s_nickname; // 판매자회원 닉네임
	private String s_name; // 판매자회원 이름
	private String s_age; // 판매자회원 나이
	private String s_email; // 판매자회원 이메일
	private String s_phone; // 판매자회원 휴대폰번호
	private Integer creation_reg_cnt; // 창작물 등록 수
	private Integer e_sell_cnt; // 총 판매 수량
	private String s_grade; // 판매자회원 등급

	private Date s_quit_date; // 판매자회원 탈퇴일자
	private String s_quit_reason; // 파매자회원 탈퇴사유

	private Date m_quit_date; // 일반회원 탈퇴일자
	private String m_quit_reason; // 일반회원 탈퇴사유
}
