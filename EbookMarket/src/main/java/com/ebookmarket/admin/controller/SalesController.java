package com.ebookmarket.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebookmarket.admin.domain.SalesStatus;
import com.ebookmarket.admin.service.SalesService;
import com.ebookmarket.common.domain.CodeLabelValue;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.Pagination;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/admin/sales")
public class SalesController {

	@Autowired
	private SalesService service;

	// 매출 현황 페이지
	@RequestMapping(value = "/salesStatus", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void salesStatus(SearchCriteria scri, Model model) throws Exception {
		List<SalesStatus> salesStatus = service.salesStatus(scri);
		model.addAttribute("salesStatus", salesStatus);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

	}

	// 거래 내역 페이지
	@RequestMapping(value = "/transactionHistory", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void transactionHistory(SearchCriteria scri, Model model) throws Exception {
		
		List<SalesStatus> transactionHistory = service.transactionHistory(scri);
		model.addAttribute("transactionHistory", transactionHistory);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

}
