package com.ebookmarket.board.service;

import java.util.List;

import com.ebookmarket.board.domain.SellerBoard;
import com.ebookmarket.common.domain.SearchCriteria;

public interface SellerBoardService {
//게시글 목록 페이지
	public List<SellerBoard> sellerBoardList(SearchCriteria scri) throws Exception;

//게시글 줄 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 게시글 등록 처리
	public void register(SellerBoard sellerBoard) throws Exception;

//게시글 상세보기	
	public SellerBoard read(Integer sb_num) throws Exception;

//이미지 미리보기
	public String getPicture(Integer sb_num) throws Exception;

//게시글 삭제처리	
	public void remove(Integer sb_num) throws Exception;

//게시글 수정처리
	public void sellerBoardModify(SellerBoard sellerBoard) throws Exception;

}
