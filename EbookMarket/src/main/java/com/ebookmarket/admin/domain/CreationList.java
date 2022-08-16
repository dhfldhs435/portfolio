package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreationList {
	private Integer s_num; // 판매자회원 일련번호
	private String s_id; // 판매자회원 아이디
	private String s_nickname; // 판매자회원 닉네임
	private String s_phone; // 판매자회원 휴대폰번호
	private Integer e_num; // 창작물 일련번호
	private String e_category; // 창작물 카테고리
	private String e_title; // 창작물 제목
	private String e_thumbnail_url; // 창작물 미리보기 경로
	private Date e_reg_date; // 창작물 등록일시
	private Date e_del_date; // 창작물 삭제일시
}
