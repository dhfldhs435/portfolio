package com.ebookmarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.board.domain.SellerBoard;
import com.ebookmarket.board.mapper.SellerBoardMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class SellerBoardServiceImpl implements SellerBoardService {

	@Autowired
	private SellerBoardMapper mapper;

//게시글 목록 처리
	@Override
	public List<SellerBoard> sellerBoardList(SearchCriteria scri) throws Exception {
		return mapper.sellerBoardList(scri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

	// 게시글 등록 처리
	@Override
	public void register(SellerBoard sellerBoard) throws Exception {
		mapper.create(sellerBoard);

	}

//게시글 상세보기
	@Override
	public SellerBoard read(Integer sb_num) throws Exception {
		return mapper.read(sb_num);
	}

//이미지 미리보기
	@Override
	public String getPicture(Integer sb_num) throws Exception {
		return mapper.getPicture(sb_num);
	}

//게시글 삭제처리
	@Override
	public void remove(Integer sb_num) throws Exception {
		mapper.delete(sb_num);
	}

	@Override
	public void sellerBoardModify(SellerBoard sellerBoard) throws Exception {
		// TODO Auto-generated method stub
		mapper.update(sellerBoard);
		
	}

}
