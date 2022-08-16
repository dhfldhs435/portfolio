package com.ebookmarket.company.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@RequestMapping(value = "/aboutus", method = RequestMethod.GET)
	public String aboutus(Locale locale, Model model) {


		return "company/aboutus";
	}
	
	@RequestMapping(value = "/handlingpolicy", method = RequestMethod.GET)
	public String handlingpolicy(Locale locale, Model model) {


		return "company/handlingpolicy";
	}
	
	@RequestMapping(value = "/termsservice", method = RequestMethod.GET)
	public String termsservice(Locale locale, Model model) {


		return "company/termsservice";
	}
}
