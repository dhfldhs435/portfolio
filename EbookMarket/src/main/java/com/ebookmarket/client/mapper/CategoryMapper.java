package com.ebookmarket.client.mapper;

import java.util.List;

import com.ebookmarket.common.domain.CodeLabelValue;

public interface CategoryMapper {

	public List<CodeLabelValue> getCategory() throws Exception;

	public String getLabel(String e_category) throws Exception;

}
