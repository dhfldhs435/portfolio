package com.ebookmarket.faqboard.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebookmarket.client.service.EbookService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/faqboard")
public class FaqBoardController {
	
	@Autowired
	private EbookService service;

	@RequestMapping(value = "/memberFaqList", method = RequestMethod.GET)
	public String memberFaqList(Locale locale, Model model, SearchCriteria scri) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "faqboard/memberFaqList";
	}
	
	@RequestMapping(value = "/sellerFaqList", method = RequestMethod.GET)
	public String sellerFaqList(Locale locale, Model model,SearchCriteria scri) throws Exception{

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "faqboard/sellerFaqList";
	}
	
}
