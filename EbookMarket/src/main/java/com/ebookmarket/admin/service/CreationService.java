package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.AdminCategory;
import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;
import com.ebookmarket.common.domain.SearchCriteria;

public interface CreationService {
	// 등록된 창작물 목록
	public List<CreationList> regList(SearchCriteria scri) throws Exception;

	// 삭제된 창작물 목록
	public List<CreationList> delList(SearchCriteria scri) throws Exception;

	// 창작물 등록대기 목록
	public List<CreationList> regAppList(SearchCriteria scri) throws Exception;

	// 창작물 등록정보
	public CreationInfo regInfo(Integer e_num) throws Exception;

	// 창작물 등록승인
	public void regApproval(CreationInfo creationInfo) throws Exception;

	// 창작물 등록거절
	public void regRefuse(CreationInfo creationInfo) throws Exception;

	// 창작물 삭제대기 목록
	public List<CreationList> delAppList(SearchCriteria scri) throws Exception;

	// 창작물 삭제정보
	public CreationInfo delInfo(Integer e_num) throws Exception;

	// 창작물 삭제승인
	public void delApproval(CreationInfo creationInfo) throws Exception;

	// 창작물 삭제거절
	public void delRefuse(CreationInfo creationInfo) throws Exception;

	// 카테고리 등록 처리
	public void register(AdminCategory category) throws Exception;

	// 카테고리 목록 페이지
	public List<AdminCategory> list() throws Exception;

	// 카테고리 상세 페이지
	public AdminCategory read(String category_code) throws Exception;

	// 카테고리 수정 처리
	public void modify(AdminCategory category) throws Exception;

	// 카테고리 삭제 처리
	public void remove(String category_code) throws Exception;

	// 미리보기 이미지 표시
	public String getPreview(Integer e_num) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;
}
