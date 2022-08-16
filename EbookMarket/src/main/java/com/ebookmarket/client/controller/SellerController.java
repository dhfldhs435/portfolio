package com.ebookmarket.client.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.client.service.EbookService;
import com.ebookmarket.client.service.MemberService;
import com.ebookmarket.client.service.SellerService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	private SellerService sellerService;

	@Autowired
	private MemberService memberService;

	@Value("${upload.path}")
	private String uploadPath;

	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private EbookService service;

	// 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(Model model, SearchCriteria scri) throws Exception {
		model.addAttribute(new Seller());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "seller/register";

	}

	// 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Validated Seller seller, BindingResult result, Model model, RedirectAttributes rttr)
			throws Exception {

		if (result.hasErrors()) {
			FieldError error = result.getFieldError();
			String dmsr = error.getDefaultMessage();

			model.addAttribute("error", dmsr);
			return "seller/register";

		} else {
			// 비밀번호 암호화
			String inputPasswordString = seller.getS_pw();
			seller.setS_pw(passwordEncoder.encode(inputPasswordString));

			MultipartFile s_certificate_data = seller.getS_certificate_data();
			MultipartFile s_career_data = seller.getS_career_data();

			String createdCertificateFileName = uploadFile(s_certificate_data.getOriginalFilename(),
					s_certificate_data.getBytes());
			String createdCareerFileName = uploadFile(s_career_data.getOriginalFilename(), s_career_data.getBytes());

			seller.setS_certificate_dataUrl(createdCertificateFileName);
			seller.setS_career_dataUrl(createdCareerFileName);

			sellerService.register(seller);

			rttr.addFlashAttribute("s_name", seller.getS_name());
			return "redirect:/seller/registerSuccess";

		}
	}

	// 등록 성공 페이지
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public void registerSuccess(Model model) throws Exception {

	}

	// 계정 정보 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String read(@AuthenticationPrincipal CustomUser customUser, Model model, SearchCriteria scri)
			throws Exception {

		String userId = customUser.getUsername();

		Seller seller = sellerService.readByUserId(userId);

		model.addAttribute(seller);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(sellerService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "seller/read";

	}

	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String modifyForm(Integer s_num, Model model, SearchCriteria scri) throws Exception {

		Seller seller = new Seller();
		seller.setS_num(s_num);
		model.addAttribute(seller);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(sellerService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "seller/modify";

	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String modify(Seller seller) throws Exception {

		Seller originalSeller = sellerService.readByUserNum(seller.getS_num());

		if (seller.getS_pw().isEmpty()) {
			seller.setS_pw(originalSeller.getS_pw());
		} else {
			// 비밀번호 암호화
			String inputPasswordString = seller.getS_pw();
			seller.setS_pw(passwordEncoder.encode(inputPasswordString));
		}

		if (seller.getS_nickname().isEmpty()) {
			seller.setS_nickname(originalSeller.getS_nickname());
		}
		if (seller.getS_email().isEmpty()) {
			seller.setS_email(originalSeller.getS_email());
		}
		if (seller.getS_phone().isEmpty()) {
			seller.setS_phone(originalSeller.getS_phone());
		}
		if (seller.getS_address().isEmpty()) {
			seller.setS_address(originalSeller.getS_address());
		}
		if (seller.getS_bank_name().isEmpty()) {
			seller.setS_bank_name(originalSeller.getS_bank_name());
		}
		if (seller.getS_account_num().isEmpty()) {
			seller.setS_account_num(originalSeller.getS_account_num());
		}
		if (seller.getS_ah_name().isEmpty()) {
			seller.setS_ah_name(originalSeller.getS_ah_name());
		}
		if (seller.getS_answer().isEmpty()) {
			seller.setS_answer(originalSeller.getS_answer());
		}
		if (seller.getS_certificate_detail().isEmpty() || seller.getS_certificate_detail() == null) {
			seller.setS_certificate_detail(originalSeller.getS_certificate_detail());
			if (originalSeller.getS_certificate_detail() == null) {
				seller.setS_certificate_detail("");
			}
		}
		if (seller.getS_certificate_dataUrl() == null) {
			seller.setS_certificate_dataUrl(originalSeller.getS_certificate_dataUrl());
			if (originalSeller.getS_certificate_dataUrl() == null) {
				seller.setS_certificate_dataUrl("");
			}
		}
		if (seller.getS_career_detail().isEmpty() || seller.getS_career_detail() == null) {
			seller.setS_career_detail(originalSeller.getS_career_detail());
			if (originalSeller.getS_career_detail() == null) {
				seller.setS_career_detail("");
			}
		}
		if (seller.getS_career_dataUrl() == null) {
			seller.setS_career_dataUrl(originalSeller.getS_career_dataUrl());
			if (originalSeller.getS_career_dataUrl() == null) {
				seller.setS_career_dataUrl("");
			}
		}

		MultipartFile s_certificate_data = seller.getS_certificate_data();

		if (s_certificate_data != null && s_certificate_data.getSize() > 0) {
			String createdFileName = uploadFile(s_certificate_data.getOriginalFilename(),
					s_certificate_data.getBytes());

			seller.setS_certificate_dataUrl(createdFileName);
		}

		MultipartFile s_career_data = seller.getS_career_data();

		if (s_career_data != null && s_career_data.getSize() > 0) {
			String createdFileName = uploadFile(s_career_data.getOriginalFilename(), s_career_data.getBytes());

			seller.setS_career_dataUrl(createdFileName);
		}

		sellerService.modify(seller);

		return "redirect:/";

	}

	// 아이디 중복 검사
	@ResponseBody
	@GetMapping("idCheck")
	public int overlappedID(String id) throws Exception {

		if (id.length() == 0) {
			return 2;

		} else {

			int result = sellerService.overlappedID(id);
			if (result == 0) {
				result = memberService.overlappedID(id);
			}
			return result;
		}
	}

	// 비밀번호 일치 확인
	@ResponseBody
	@GetMapping("pwCheck")
	public int pwCheck(String pw, int s_num) throws Exception {

		if (pw.length() == 0) {
			return 2;

		} else {

			int result;

			Seller seller = sellerService.readByUserNum(s_num);

			if (passwordEncoder.matches(pw, seller.getS_pw())) {

				result = 1;

				return result;

			}

		}
		return 0;
	}

	// 닉네임 중복 검사
	@ResponseBody
	@GetMapping("nicknameCheck")
	public int overlappedNickname(String nickname) throws Exception {

		if (nickname.length() == 0) {
			return 2;

		} else {

			int result = sellerService.overlappedNickname(nickname);
			return result;
		}
	}

	// 이메일 중복 검사
	@ResponseBody
	@GetMapping("emailCheck")
	public int overlappedEmail(String email) throws Exception {

		if (email.length() == 0) {
			return 2;

		} else {

			int result = sellerService.overlappedEmail(email);
			if (result == 0) {
				result = memberService.overlappedEmail(email);
			}
			return result;
		}
	}

	// 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uuid = UUID.randomUUID();

		String createdFileName = uuid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;

	}

	// 판매 약관 페이지
	@RequestMapping(value = "/sellerAgree", method = RequestMethod.GET)
	public void sellerAgree(Model model, SearchCriteria scri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 컨텐츠 이용동의 약관 페이지
	@RequestMapping(value = "/contentAgree", method = RequestMethod.GET)
	public void contentAgree(Model model, SearchCriteria scri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 개인정보 이용동의 약관 페이지
	@RequestMapping(value = "/privatyAgree", method = RequestMethod.GET)
	public void privatyAgree(Model model, SearchCriteria scri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

}
