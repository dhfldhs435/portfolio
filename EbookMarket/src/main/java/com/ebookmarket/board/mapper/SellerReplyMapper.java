package com.ebookmarket.board.mapper;

import java.util.List;

import com.ebookmarket.board.domain.SellerReply;

public interface SellerReplyMapper {
	public List<SellerReply> replyList(Integer sb_num) throws Exception;

	public int replyInsert(SellerReply sellerReply) throws Exception;

	public int pwdConfirm(SellerReply sellerReply) throws Exception;

	public int replyUpdate(SellerReply sellerReply) throws Exception;

	public int replyDelete(int sr_num) throws Exception;

}
