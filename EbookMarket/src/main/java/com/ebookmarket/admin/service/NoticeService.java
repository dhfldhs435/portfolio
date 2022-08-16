package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.Notice;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.SearchCriteria;

public interface NoticeService {
	// 판매자회원 공지사항 등록 처리
	public void sellerRegister(Notice notice) throws Exception;

	// 판매자회원 공지사항 목록 페이지
	public List<Notice> sellerlist(SearchCriteria scri) throws Exception;

	// 판매자회원 공지사항 상세 페이지
	public Notice sellerRead(Integer sn_num) throws Exception;

	// 판매자회원 공지사항 수정 처리
	public void sellerModify(Notice notice) throws Exception;

	// 판매자회원 공지사항 삭제 처리
	public void sellerRemove(Integer sn_num) throws Exception;

	// 일반회원 공지사항 등록 처리
	public void memberRegister(Notice notice) throws Exception;

	// 일반회원 공지사항 목록 페이지
	public List<Notice> memberlist( SearchCriteria scri) throws Exception;

	// 일반회원 공지사항 상세 페이지
	public Notice memberRead(Integer mn_num) throws Exception;

	// 일반회원 공지사항 수정 처리
	public void memberModify(Notice notice) throws Exception;

	// 일반회원 공지사항 삭제 처리
	public void memberRemove(Integer mn_num) throws Exception;

	// 판매자회원 공지사항 전체 건수를 반환한다.
	public int sellerCount(PageRequest pageRequest) throws Exception;

	// 일반회원 공지사항 전체 건수를 반환한다.
	public int memberCount(PageRequest pageRequest) throws Exception;

	public int sellerListCount(SearchCriteria scri)throws Exception;

	public int memberListCount(SearchCriteria scri)throws Exception;
}
