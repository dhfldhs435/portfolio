package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.Notice;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.SearchCriteria;

public interface NoticeMapper {
	// 판매자회원 공지사항 등록 처리
	public void sellercreate(Notice notice) throws Exception;

	// 판매자회원 공지시항 목록 페이지
	public List<Notice> sellerlist( SearchCriteria scri) throws Exception;

	// 판매자회원 공지사항 상세 페이지
	public Notice sellerread(Integer sn_num) throws Exception;

	// 판매자회원 공지사항 수청 처리
	public void sellerupdate(Notice notice) throws Exception;

	// 판매자회원 공지사항 삭제 처리
	public void sellerdelete(Integer sn_num) throws Exception;

	// 일반회원 공지사항 등록 처리
	public void membercreate(Notice notice) throws Exception;

	// 일반회원 공지시항 목록 페이지
	public List<Notice> memberlist(SearchCriteria scri) throws Exception;

	// 일반회원 공지사항 상세 페이지
	public Notice memberread(Integer mn_num) throws Exception;

	// 일반회원 공지사항 수청 처리
	public void memberupdate(Notice notice) throws Exception;

	// 일반회원 공지사항 삭제 처리
	public void memberdelete(Integer mn_num) throws Exception;

	// 판매자회원 공지사항 전체 건수를 반환한다.
	public int sellercount(PageRequest pageRequest) throws Exception;

	// 일반회원 공지사항 전체 건수를 반환한다.
	public int membercount(PageRequest pageRequest) throws Exception;

	public int sellerListCount(SearchCriteria scri)throws Exception;

	public int memberListCount(SearchCriteria scri)throws Exception;
}
