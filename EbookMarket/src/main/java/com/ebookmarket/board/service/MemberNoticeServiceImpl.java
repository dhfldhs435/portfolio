package com.ebookmarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.board.domain.MemberNotice;
import com.ebookmarket.board.mapper.MemberNoticeMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class MemberNoticeServiceImpl implements MemberNoticeService {

	@Autowired
	private MemberNoticeMapper mapper;
	
	@Override
	public List<MemberNotice> memberNoticeList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberNoticeList(scri);
	}

	@Override
	public MemberNotice memberNoticeRead(int mn_num) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberNoticeRead(mn_num);
	}

	@Override
	public String getPicture(Integer mn_num) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getPicture(mn_num);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

}
