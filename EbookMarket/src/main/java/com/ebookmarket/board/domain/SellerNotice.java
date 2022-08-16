package com.ebookmarket.board.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerNotice {
	private int sn_num;
	private String sn_title;
	private String sn_content;
	private String sn_writer;
	private Date sn_reg_date;
	private String sn_attachment_name;
	private MultipartFile sn_attachment_url;
}
