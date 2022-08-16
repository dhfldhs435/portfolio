package com.ebookmarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.board.domain.SellerNotice;
import com.ebookmarket.board.mapper.SellerNoticeMapper;
import com.ebookmarket.common.domain.SearchCriteria;
@Service
public class SellerNoticeServiceImpl implements SellerNoticeService {

	@Autowired
	private SellerNoticeMapper mapper;
	
	@Override
	public List<SellerNotice> sellerNoticeList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.sellerNoticeList(scri);
	}

	@Override
	public SellerNotice sellerNoticeRead(int sn_num) throws Exception {
		// TODO Auto-generated method stub
		return mapper.sellerNoticeRead(sn_num);
	}

	@Override
	public String getPicture(Integer sn_num) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getPicture(sn_num);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

}
