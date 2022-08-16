package com.ebookmarket.board.mapper;

import java.util.List;

import com.ebookmarket.board.domain.MemberNotice;
import com.ebookmarket.common.domain.SearchCriteria;

public interface MemberNoticeMapper {

	public List<MemberNotice> memberNoticeList(SearchCriteria scri)throws Exception;

	public MemberNotice memberNoticeRead(int mn_num)throws Exception;

	public String getPicture(Integer mn_num)throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;

}
