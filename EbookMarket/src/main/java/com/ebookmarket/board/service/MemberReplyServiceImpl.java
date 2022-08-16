package com.ebookmarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebookmarket.board.domain.MemberReply;
import com.ebookmarket.board.mapper.MemberReplyMapper;

@Service
@Transactional
public class MemberReplyServiceImpl implements MemberReplyService {

	@Autowired
	private MemberReplyMapper mrMapper;

	// 글목록 구현
	@Override
	public List<MemberReply> replyList(Integer mb_num) throws Exception {
		List<MemberReply> myList = null;
		myList = mrMapper.replyList(mb_num);
		return myList;
	}

	// 글입력 구현
	@Override
	public int replyInsert(MemberReply memberReply) throws Exception {
		int result = 0;
		try {
			result = mrMapper.replyInsert(memberReply);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int pwdConfirm(MemberReply memberReply) throws Exception {
		int result = 0;
		result = mrMapper.pwdConfirm(memberReply);
		return result;
	}

	// 글수정 구현
	@Override
	public int replyUpdate(MemberReply memberReply) throws Exception {
		int result = 0;
		try {
			result = mrMapper.replyUpdate(memberReply);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 글삭제 구현
	@Override
	public int replyDelete(int mr_num) throws Exception {
		int result = 0;
		try {
			result = mrMapper.replyDelete(mr_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
