package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreationInfo {

	private String e_num;		// 창작물 일련번호
	private String s_name;		// 판매자회원 이름
	private String e_title;		// 창작물 제목
	private String e_category;	// 창작물 카테고리
	private Integer e_price;	// 창작물 가격
	private Date e_reg_date;	// 창작물 등록일시
	private String e_attachment_url;	// 창작물 첨부파일 경로

}
