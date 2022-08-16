package com.ebookmarket.client.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.service.CategoryService;
import com.ebookmarket.client.service.EbookService;
import com.ebookmarket.client.service.MemberService;
import com.ebookmarket.client.service.PurchaseService;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.service.SellerService;
import com.ebookmarket.common.domain.CodeLabelValue;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;
import com.ebookmarket.client.security.domain.CustomUser;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/ebook")
public class EbookController {

	@Autowired
	private EbookService ebookService;

	@Autowired
	private SellerService sellerService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private PurchaseService purChaseService;

	@Autowired
	private MemberService memberService;

	@Value("${upload.path}")
	private String uploadPath;

	// 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Model model, SearchCriteria scri) throws Exception {

		Ebook ebook = new Ebook();
		model.addAttribute(ebook);

		// 카테고리 전달
		List<CodeLabelValue> categoryList = categoryService.getCategory();

		log.info(categoryList.toString());

		model.addAttribute("categoryList", categoryList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

	}

	// 등록 처리

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Validated Ebook ebook, RedirectAttributes rttr,
			@AuthenticationPrincipal CustomUser customUser, Model model, BindingResult result) throws Exception {

		if (result.hasErrors()) {
			FieldError error = result.getFieldError();
			String dmsr = error.getDefaultMessage();

			model.addAttribute("error", error.toString());
			return "ebook/register";
		}

		List<CodeLabelValue> categoryList = categoryService.getCategory();
		model.addAttribute("categoryList", categoryList);

		String userId = customUser.getUsername();

		Seller seller = sellerService.readByUserId(userId);

		int s_num = seller.getS_num();

		ebook.setS_num(s_num);

		log.info(ebook.toString());

		MultipartFile e_coverimage = ebook.getE_coverimage();
		MultipartFile e_attachment = ebook.getE_attachment();
		MultipartFile e_thumbnail = ebook.getE_thumbnail();

		String createdCoverimageFileName = uploadFile(e_coverimage.getOriginalFilename(), e_coverimage.getBytes());
		String createdAttachmentFileName = uploadFile(e_attachment.getOriginalFilename(), e_attachment.getBytes());
		String createdThumbnailFileName = uploadFile(e_thumbnail.getOriginalFilename(), e_thumbnail.getBytes());

		ebook.setE_coverimage_url(createdCoverimageFileName);
		ebook.setE_attachment_url(createdAttachmentFileName);
		ebook.setE_thumbnail_url(createdThumbnailFileName);

		if (e_attachment != null) {
			String originalFileName = e_attachment.getOriginalFilename();
			ebook.setE_attachment_type(originalFileName);
		}

		ebookService.register(ebook);

		rttr.addFlashAttribute("e_title", ebook.getE_title());
		return "redirect:/ebook/registerSuccess";

	}

	// 등록 성공 페이지
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public void registerSuccess(Model model) throws Exception {

	}

	// 게시물 목록 페이지
	@RequestMapping(value = "/ebookList", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("ebookList", ebookService.ebookList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "ebook/ebookList";
	}

	// 인기순위 페이지
	@RequestMapping(value = "/bestSellerlist", method = RequestMethod.GET)
	public String bestSellerlist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("ebookList", ebookService.bestSellerlist(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "ebook/ebookList";
	}

	// 시 카테고리 정렬
	@RequestMapping(value = "/poetry", method = RequestMethod.GET)
	public String poetry(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		// 시 카테고리 ebook리스트전달
		List<Ebook> ebookList = ebookService.poetry(scri);

		model.addAttribute("ebookList", ebookList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "ebook/ebookList";
	}

	// 에세이 카테고리 정렬
	@RequestMapping(value = "/essay", method = RequestMethod.GET)
	public String essay(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		// 시 카테고리 ebook리스트전달
		List<Ebook> ebookList = ebookService.essay(scri);

		model.addAttribute("ebookList", ebookList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "ebook/ebookList";
	}

	// 단편 소설 카테고리 정렬
	@RequestMapping(value = "/shotStory", method = RequestMethod.GET)
	public String shotStory(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		// 시 카테고리 ebook리스트전달
		List<Ebook> ebookList = ebookService.shotStory(scri);

		model.addAttribute("ebookList", ebookList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "ebook/ebookList";
	}

	// 등록 내역 페이지
	@RequestMapping(value = "/uploadList", method = RequestMethod.GET)
	public void uploadList(Model model, @AuthenticationPrincipal CustomUser customUser, SearchCriteria scri)
			throws Exception {

		String userId = customUser.getUsername();

		Seller seller = sellerService.readByUserId(userId);

		int s_num = seller.getS_num();

		scri.setS_num(s_num);

		List<Ebook> ebookList = ebookService.uploadList(scri);

		model.addAttribute("ebookList", ebookList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ebookService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 상품 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(Integer e_num, Model model, String error) throws Exception {

		Ebook ebook = ebookService.read(e_num);

		String category = categoryService.getLabel(ebook.getE_category());

		ebook.setE_category(category);

		model.addAttribute(ebook);

		return "ebook/read";

	}

	// 삭제 신청 처리
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	// @PreAuthorize("hasRole('ROLE_ADMIN')")
	public String removeForm(Integer e_num, Model model) throws Exception {

		ebookService.remove(e_num);

		return "redirect:/ebook/uploadList";
	}

	// 게시물 구매 페이지

	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	/* @PreAuthorize("hasRole('ROLE_MEMBER')") */
	public String buy(Integer e_num, Model model, Authentication authentication) throws Exception {

		if (authentication == null) {
			model.addAttribute("error", "로그인이 필요합니다");
			model.addAttribute("url", "/auth/login");
			return "ebook/read";
		}

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		Ebook ebook = ebookService.read(e_num);
		model.addAttribute(ebook);

		return "ebook/buy";
	}

	// 게시물 구매 처리
	@RequestMapping(value = "/buyForm", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String buyForm(Integer e_num, RedirectAttributes rttr, Authentication authentication, Model model)
			throws Exception {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		Member member = customUser.getMember();

		Ebook ebook = ebookService.read(e_num);

		purChaseService.register(member, ebook);
		/*
		 * log.info("5"); String message =
		 * messageSource.getMessage("buy.purchaseComplete ", null, Locale.KOREAN);
		 * rttr.addFlashAttribute("msg", message);
		 */

		return "redirect:/ebook/buySuccess";

	}

	// 구매 완료 페이지
	@RequestMapping(value = "/buySuccess", method = RequestMethod.GET)
	public String buySuccess(Model model) throws Exception {

		return "ebook/buySuccess";
	}

	// 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uuid = UUID.randomUUID();

		String createdFileName = uuid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;

	}

	// 표지 이미지 표시
	@ResponseBody
	@RequestMapping("/cover")
	public ResponseEntity<byte[]> displayFile(Integer e_num) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = ebookService.getCover(e_num);

		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {

			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			in.close();
		}

		return entity;

	}

	// 파일 확장자로 이미지 형식 확인
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}

	// 미리보기 이미지 표시
	@ResponseBody
	@RequestMapping("/preview")
	public ResponseEntity<byte[]> pictureFile(Integer e_num) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = ebookService.getPreview(e_num);

		try {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {

			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		} finally {
			in.close();
		}

		return entity;

	}

	// 서비스 이용 약관 페이지
	@RequestMapping(value = "/serviceAgree", method = RequestMethod.GET)
	public void serviceAgree(Model model) throws Exception {

	}

	// 만14세 이상 이용 약관 페이지
	@RequestMapping(value = "/fourteenAgree", method = RequestMethod.GET)
	public void fourteenAgree(Model model) throws Exception {

	}

	// 개인정보 보호 약관 페이지
	@RequestMapping(value = "/privatyAgree", method = RequestMethod.GET)
	public void privatyAgree(Model model) throws Exception {

	}

	// 기타 등등 약관 페이지
	@RequestMapping(value = "/agree", method = RequestMethod.GET)
	public void Agree(Model model) throws Exception {

	}

	// 메인페이지로 돌아가기
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String reset(Model model) throws Exception {

		return "/";
	}

}
