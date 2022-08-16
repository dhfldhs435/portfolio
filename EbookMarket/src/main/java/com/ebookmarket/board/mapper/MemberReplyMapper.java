package com.ebookmarket.board.mapper;

import java.util.List;

import com.ebookmarket.board.domain.MemberReply;

public interface MemberReplyMapper {
	public List<MemberReply> replyList(Integer mb_num) throws Exception;

	public int replyInsert(MemberReply memberReply) throws Exception;

	public int pwdConfirm(MemberReply memberReply) throws Exception;

	public int replyUpdate(MemberReply memberReply) throws Exception;

	public int replyDelete(int mr_num) throws Exception;

}
