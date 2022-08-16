package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.AdminCategory;
import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;
import com.ebookmarket.common.domain.SearchCriteria;

public interface CreationMapper {
	// 등록된 창작물 목록
	public List<CreationList> reglist(SearchCriteria scri) throws Exception;

	// 삭제된 창작물 목록
	public List<CreationList> dellist(SearchCriteria scri) throws Exception;

	// 창작물 등록대기 목록
	public List<CreationList> regapplist(SearchCriteria scri) throws Exception;

	// 창작물 등록정보
	public CreationInfo reginfo(Integer e_num) throws Exception;

	// 창작물 등록승인
	public void regapproval(CreationInfo creationInfo) throws Exception;

	// 창작물 등록거절
	public void regrefuse(CreationInfo creationInfo) throws Exception;

	// 창작물 삭제대기 목록
	public List<CreationList> delapplist(SearchCriteria scri) throws Exception;

	// 창작물 삭제정보
	public CreationInfo delinfo(Integer e_num) throws Exception;

	// 창작물 삭제승인
	public void delapproval(CreationInfo creationInfo) throws Exception;

	// 창작물 삭제거절
	public void delrefuse(CreationInfo creationInfo) throws Exception;

	// 카테고리 등록 처리
	public void create(AdminCategory category) throws Exception;

	// 카테고리 목록 페이지
	public List<AdminCategory> list() throws Exception;

	// 카테고리 상세 페이지(수정 페이지)
	public AdminCategory read(String category_code) throws Exception;

	// 카테고리 수정 처리
	public void update(AdminCategory category) throws Exception;

	// 카테고리 삭제 처리
	public void delete(String category_code) throws Exception;

	// 미리보기 이미지 표시
	public String getPreview(Integer e_num) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;
}
