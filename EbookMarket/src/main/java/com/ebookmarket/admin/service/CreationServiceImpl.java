package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.AdminCategory;
import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;
import com.ebookmarket.admin.mapper.CreationMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class CreationServiceImpl implements CreationService {

	@Autowired
	private CreationMapper mapper;

	// 등록된 창작물 목록
	@Override
	public List<CreationList> regList(SearchCriteria scri) throws Exception {
		return mapper.reglist(scri);
	}

	// 삭제된 창작물 목록
	@Override
	public List<CreationList> delList(SearchCriteria scri) throws Exception {
		return mapper.dellist(scri);
	}

	// 창작물 등록대기 목록
	@Override
	public List<CreationList> regAppList(SearchCriteria scri) throws Exception {
		return mapper.regapplist(scri);
	}

	// 창작물 등록정보
	@Override
	public CreationInfo regInfo(Integer e_num) throws Exception {
		return mapper.reginfo(e_num);
	}

	// 창작물 등록승인
	@Override
	public void regApproval(CreationInfo creationInfo) throws Exception {
		mapper.regapproval(creationInfo);
	}

	// 창작물 등록거절
	@Override
	public void regRefuse(CreationInfo creationInfo) throws Exception {
		mapper.regrefuse(creationInfo);
	}

	// 창작물 삭제대기 목록
	@Override
	public List<CreationList> delAppList(SearchCriteria scri) throws Exception {
		return mapper.delapplist(scri);
	}

	// 창작물 삭제정보
	@Override
	public CreationInfo delInfo(Integer e_num) throws Exception {
		return mapper.delinfo(e_num);
	}

	// 창작물 삭제승인
	@Override
	public void delApproval(CreationInfo creationInfo) throws Exception {
		mapper.delapproval(creationInfo);
	}

	// 창작물 삭제거절
	@Override
	public void delRefuse(CreationInfo creationInfo) throws Exception {
		mapper.delrefuse(creationInfo);
	}

	// 카테고리 등록 처리
	@Override
	public void register(AdminCategory category) throws Exception {
		mapper.create(category);
	}

	// 카테고리 목록 페이지
	@Override
	public List<AdminCategory> list() throws Exception {
		return mapper.list();
	}

	// 카테고리 상세 페이지(수정 페이지)
	@Override
	public AdminCategory read(String category_code) throws Exception {
		return mapper.read(category_code);
	}

	// 카테고리 수정 처리
	@Override
	public void modify(AdminCategory category) throws Exception {
		mapper.update(category);
	}

	// 카테고리 삭제 처리
	@Override
	public void remove(String category_code) throws Exception {
		mapper.delete(category_code);
	}

	// 미리보기 이미지 표시
	@Override
	public String getPreview(Integer e_num) throws Exception {
		return mapper.getPreview(e_num);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}
}
