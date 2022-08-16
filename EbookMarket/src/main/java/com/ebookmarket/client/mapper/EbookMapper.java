package com.ebookmarket.client.mapper;

import java.util.List;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.common.domain.SearchCriteria;

public interface EbookMapper {

	public void create(Ebook ebook) throws Exception;

	public List<Ebook> ebookList(SearchCriteria scri) throws Exception;

	public List<Ebook> bestSellerlist(SearchCriteria scri) throws Exception;

	public List<Ebook> poetry(SearchCriteria scri) throws Exception;

	public List<Ebook> essay(SearchCriteria scri) throws Exception;

	public List<Ebook> shotStory(SearchCriteria scri) throws Exception;

	public Ebook read(Integer e_num) throws Exception;

	public void view_cnt(Integer e_num) throws Exception;

	public void delete(int e_num) throws Exception;

	public String getCover(Integer e_num) throws Exception;

	public String getPreview(Integer e_num) throws Exception;

	public List<Ebook> uploadList(SearchCriteria scri) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

}
