package com.ebookmarket.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ebookmarket.client.mapper.CategoryMapper;

import com.ebookmarket.common.domain.CodeLabelValue;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper mapper;

	@Override
	public List<CodeLabelValue> getCategory() throws Exception {
		return mapper.getCategory();
	}

	@Override
	public String getLabel(String e_category) throws Exception {

		return mapper.getLabel(e_category);
	}

}
