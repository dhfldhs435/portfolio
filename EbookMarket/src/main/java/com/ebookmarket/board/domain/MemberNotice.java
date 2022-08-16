package com.ebookmarket.board.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberNotice {

	private int mn_num;
	private String mn_title;
	private String mn_writer;
	private String mn_content;
	private Date mn_reg_date;
	private String mn_attachment_name;
	private MultipartFile mn_attachment_url;
}
