package com.ebookmarket.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.Refund;
import com.ebookmarket.admin.service.RefundService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/admin/refund")
public class RefundController {

	@Autowired
	private RefundService service;

	// 환불 요청 목록 페이지
	@RequestMapping(value = "/requestList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void requestList(Model model,SearchCriteria scri) throws Exception {
		List<Refund> requestList = service.requestList(scri);

		model.addAttribute("reqeustList", requestList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 환불 요청 정보
	@RequestMapping(value = "/refundInfo", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String refundInfo(Integer p_num, Model model) throws Exception {
		Refund refund = service.refundInfo(p_num);

		model.addAttribute("refund", refund);

		return "admin/refund/refundInfo";
	}

	// 환불 처리 승인
	@RequestMapping(value = "/approval", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String approval(Refund refund, RedirectAttributes rttr) throws Exception {
		int e_num = refund.getE_num();
		service.addCnt(e_num);

		service.approval(refund);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/refund/requestList";
	}

	// 환불 처리 거절
	@RequestMapping(value = "/refuse", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String refuse(Refund refund, RedirectAttributes rttr) throws Exception {
		service.refuse(refund);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/refund/requestList";
	}

}
