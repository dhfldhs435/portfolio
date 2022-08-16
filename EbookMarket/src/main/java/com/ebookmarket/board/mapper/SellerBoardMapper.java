package com.ebookmarket.board.mapper;

import java.util.List;

import com.ebookmarket.board.domain.SellerBoard;
import com.ebookmarket.common.domain.SearchCriteria;

public interface SellerBoardMapper {
//게시글 목록 처리
	public List<SellerBoard> sellerBoardList(SearchCriteria scri) throws Exception;

//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 게시글 등록 처리
	public void create(SellerBoard sellerBoard) throws Exception;

//게시글 상세보기	
	public SellerBoard read(Integer sb_num) throws Exception;

//이미지 미리보기
	public String getPicture(Integer sb_num) throws Exception;

//게시글 삭제처리	
	public void delete(Integer sb_num) throws Exception;

//게시글 수정처리
	public void update(SellerBoard sellerBoard) throws Exception;
}
