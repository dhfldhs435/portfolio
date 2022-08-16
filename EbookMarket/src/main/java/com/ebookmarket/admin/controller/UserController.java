package com.ebookmarket.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.User;
import com.ebookmarket.admin.service.UserService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private UserService service;

	// 판매자회원 목록 페이지
	@RequestMapping(value = "/sellerList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerList(Model model,SearchCriteria scri) throws Exception {
		List<User> sellerList = service.sellerList(scri);
		model.addAttribute("sellerList", sellerList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 일반회원 목록 페이지
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberList(Model model,SearchCriteria scri) throws Exception {
		List<User> memberList = service.memberList(scri);
		model.addAttribute("memberList", memberList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.mlistCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 탈퇴한 판매자회원 목록 페이지
	@RequestMapping(value = "/sellerResignList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerResignList(Model model,SearchCriteria scri) throws Exception {
		List<User> sellerResignList = service.sellerResignList(scri);
		model.addAttribute("sellerResignList", sellerResignList);
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.srlistCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 탈퇴한 일반회원 목록 페이지
	@RequestMapping(value = "/memberResignList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberResignList(Model model,SearchCriteria scri) throws Exception {
		List<User> memberResignList = service.memberResignList(scri);
		model.addAttribute("memberResignList", memberResignList);
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.mrlistCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 판매자회원 등급 설정
	@RequestMapping(value = "/setGrade", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String setGrade(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		String grade = request.getParameter("s_grade");
		String num = request.getParameter("s_num");
		
		int s_num = Integer.parseInt(num);
		
		User user = new User();
		user.setS_grade(grade);
		user.setS_num(s_num);		
		
		service.setGrade(user);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/user/sellerList";
	}

}
