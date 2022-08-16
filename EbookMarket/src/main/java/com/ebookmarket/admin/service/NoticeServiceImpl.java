package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.Notice;
import com.ebookmarket.admin.mapper.NoticeMapper;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	// 판매자회원 공지사항 등록 처리
	@Override
	public void sellerRegister(Notice notice) throws Exception {
		mapper.sellercreate(notice);
	}

	// 판매자회원 공지사항 목록 페이지
	@Override
	public List<Notice> sellerlist( SearchCriteria scri) throws Exception {
		return mapper.sellerlist(scri);
	}

	// 판매자회원 공지사항 상세 페이지
	@Override
	public Notice sellerRead(Integer sn_num) throws Exception {
		return mapper.sellerread(sn_num);
	}

	// 판매자회원 공지사항 수정 처리
	@Override
	public void sellerModify(Notice notice) throws Exception {
		mapper.sellerupdate(notice);
	}

	// 판매자회원 공지사항 삭제 처리
	@Override
	public void sellerRemove(Integer sn_num) throws Exception {
		mapper.sellerdelete(sn_num);
	}

	// 일반회원 공지사항 등록 처리
	@Override
	public void memberRegister(Notice notice) throws Exception {
		mapper.membercreate(notice);
	}

	// 일반회원 공지사항 목록 페이지
	@Override
	public List<Notice> memberlist(SearchCriteria scri) throws Exception {
		return mapper.memberlist(scri);
	}

	// 일반회원 공지사항 상세 페이지
	@Override
	public Notice memberRead(Integer mn_num) throws Exception {
		return mapper.memberread(mn_num);
	}

	// 일반회원 공지사항 수정 처리
	@Override
	public void memberModify(Notice notice) throws Exception {
		mapper.memberupdate(notice);
	}

	// 일반회원 공지사항 삭제 처리
	@Override
	public void memberRemove(Integer mn_num) throws Exception {
		mapper.memberdelete(mn_num);
	}

	// 판매자회원 공지사항 전체 건수를 반환한다.
	@Override
	public int sellerCount(PageRequest pageRequest) throws Exception {
		return mapper.sellercount(pageRequest);
	}

	// 일반회원 공지사항 전체 건수를 반환한다.
	@Override
	public int memberCount(PageRequest pageRequest) throws Exception {
		return mapper.membercount(pageRequest);
	}

	@Override
	public int sellerListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.sellerListCount(scri);
	}

	@Override
	public int memberListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberListCount(scri);
	}

}
