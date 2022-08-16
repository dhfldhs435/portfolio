package com.ebookmarket.client.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MemberAuth implements Serializable {
	private static final long serialVersionUID = 4948993673467321353L;
	
	private int m_num;  //일반회원 일련번호
	private String auth;//권한
}
