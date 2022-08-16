package com.ebookmarket.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.mapper.EbookMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class EbookServiceImpl implements EbookService {

	@Autowired
	private EbookMapper mapper;

	@Override
	public void register(Ebook ebook) throws Exception {
		mapper.create(ebook);

	}

	@Override
	public List<Ebook> ebookList(SearchCriteria scri) throws Exception {

		return mapper.ebookList(scri);
	}

	@Override
	public List<Ebook> bestSellerlist(SearchCriteria scri) throws Exception {

		return mapper.bestSellerlist(scri);
	}

	@Override
	public List<Ebook> poetry(SearchCriteria scri) throws Exception {
		return mapper.poetry(scri);
	}

	@Override
	public List<Ebook> essay(SearchCriteria scri) throws Exception {
		return mapper.essay(scri);
	}

	@Override
	public List<Ebook> shotStory(SearchCriteria scri) throws Exception {
		return mapper.shotStory(scri);
	}

	@Override
	public Ebook read(Integer e_num) throws Exception {
		mapper.view_cnt(e_num);
		return mapper.read(e_num);
	}

	@Override
	public void remove(int e_num) throws Exception {

		mapper.delete(e_num);
	}

	@Override
	public String getCover(Integer e_num) throws Exception {

		return mapper.getCover(e_num);
	}

	@Override
	public String getPreview(Integer e_num) throws Exception {

		return mapper.getPreview(e_num);
	}

	@Override
	public List<Ebook> uploadList(SearchCriteria scri) throws Exception {

		return mapper.uploadList(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

}
