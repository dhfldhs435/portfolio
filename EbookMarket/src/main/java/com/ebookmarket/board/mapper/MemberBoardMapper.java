package com.ebookmarket.board.mapper;

import java.util.List;

import com.ebookmarket.board.domain.MemberBoard;
import com.ebookmarket.common.domain.Criteria;
import com.ebookmarket.common.domain.SearchCriteria;

public interface MemberBoardMapper {
//게시글 목록 처리
	public List<MemberBoard> memberBoardList(SearchCriteria scri) throws Exception;

//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 게시글 등록 처리
	public void create(MemberBoard memberBoard) throws Exception;

//게시글 상세보기	
	public MemberBoard read(Integer mb_num) throws Exception;

//이미지 미리보기
	public String getPicture(Integer mb_num) throws Exception;

//게시글 삭제처리	
	public void delete(Integer mb_num) throws Exception;

	public void update(MemberBoard memberBoard)throws Exception;
}
