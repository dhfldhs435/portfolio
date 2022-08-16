package com.ebookmarket.board.service;

import java.util.List;

import com.ebookmarket.board.domain.MemberBoard;
import com.ebookmarket.common.domain.SearchCriteria;

public interface MemberBoardService {
//게시글 목록 페이지
	public List<MemberBoard> memberBoardList(SearchCriteria scri) throws Exception;

//게시글 줄 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 게시글 등록 처리
	public void register(MemberBoard memberBoard) throws Exception;

//게시글 상세보기	
	public MemberBoard read(Integer mb_num) throws Exception;

//이미지 미리보기
	public String getPicture(Integer mb_num) throws Exception;

//게시글 삭제처리	
	public void remove(Integer mb_num) throws Exception;

	public void memberBoardModify(MemberBoard memberBoard)throws Exception;

}
