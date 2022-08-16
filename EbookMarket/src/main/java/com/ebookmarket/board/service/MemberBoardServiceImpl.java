package com.ebookmarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.board.domain.MemberBoard;
import com.ebookmarket.board.mapper.MemberBoardMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class MemberBoardServiceImpl implements MemberBoardService {

	@Autowired
	private MemberBoardMapper mapper;

//게시글 목록 처리
	@Override
	public List<MemberBoard> memberBoardList(SearchCriteria scri) throws Exception {
		return mapper.memberBoardList(scri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

	// 게시글 등록 처리
	@Override
	public void register(MemberBoard memberBoard) throws Exception {
		mapper.create(memberBoard);

	}

//게시글 상세보기
	@Override
	public MemberBoard read(Integer mb_num) throws Exception {
		return mapper.read(mb_num);
	}

//이미지 미리보기
	@Override
	public String getPicture(Integer mb_num) throws Exception {
		return mapper.getPicture(mb_num);
	}

//게시글 삭제처리
	@Override
	public void remove(Integer mb_num) throws Exception {
		mapper.delete(mb_num);
	}

	@Override
	public void memberBoardModify(MemberBoard memberBoard) throws Exception {
		// TODO Auto-generated method stub
		mapper.update(memberBoard);
		
	}

}
