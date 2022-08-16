package com.ebookmarket.client.service;

import java.util.List;

import com.ebookmarket.common.domain.CodeLabelValue;

public interface CategoryService {

	public List<CodeLabelValue> getCategory() throws Exception;

	public String getLabel(String e_category) throws Exception;

}
