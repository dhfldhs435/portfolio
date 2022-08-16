package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesStatus {

	private Integer e_num; // 창작물 일련번호
	private Date e_reg_date; // 창작물 등록일시
	private String e_category; // 창작물 카테고리
	private String e_title; // 창작물 제목
	private String s_nickname; // 판매자회원 닉네임
	private Integer e_price; // 창작물 가격
	private Integer e_sell_cnt; // 창작물 판매 수량
	private Integer e_refund_cnt; // 창작물 환불횟수
	private Integer e_total; // 창작물 매출 합계

	private Integer p_num; // 구매 일련번호
	private Date p_reg_date; // 구매 날짜
	private Date p_refund_com_date;	// 환불 완료 날짜
	private String m_id; // 일반회원 아이디
	private String p_type; // 결제 종류
	private String p_status; // 구매 상태

}
