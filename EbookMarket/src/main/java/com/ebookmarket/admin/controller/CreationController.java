package com.ebookmarket.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.AdminCategory;
import com.ebookmarket.admin.domain.CreationInfo;
import com.ebookmarket.admin.domain.CreationList;
import com.ebookmarket.admin.service.CreationService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/admin/creation")
public class CreationController {

	@Autowired
	private CreationService service;

	@Value("${upload.path}")
	private String uploadPath;

	// 등록된 창작물 목록 페이지
	@RequestMapping(value = "/regList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void regList(Model model, SearchCriteria scri) throws Exception {

		List<CreationList> regList = service.regList(scri);
		model.addAttribute("regList", regList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

	}

	// 삭제된 창작물 목록 페이지
	@RequestMapping(value = "/delList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void delList(Model model, SearchCriteria scri) throws Exception {
		List<CreationList> delList = service.delList(scri);
		model.addAttribute("delList", delList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

	}

	// 창작물 등록대기 페이지
	@RequestMapping(value = "/regAppList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public void regAppList(Model model, SearchCriteria scri) throws Exception {

		List<CreationList> regAppList = service.regAppList(scri);
		model.addAttribute("regAppList", regAppList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 창작물 등록 정보
	@RequestMapping(value = "/regInfo", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String regInfo(Integer e_num, Model model) throws Exception {
		CreationInfo creation = service.regInfo(e_num);

		model.addAttribute("creation", creation);

		return "admin/creation/regInfo";
	}

	// 창작물 등록 승인처리
	@RequestMapping(value = "/regApproval", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String regApproval(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.regApproval(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/creation/regList";
	}

	// 창작물 등록 거절처리
	@RequestMapping(value = "/regRefuse", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String regRefuse(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.regRefuse(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/creation/regList";
	}

	// 창작물 삭제대기 페이지
	@RequestMapping(value = "/delAppList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public void delAppList(Model model, SearchCriteria scri) throws Exception {
		List<CreationList> delAppList = service.delAppList(scri);
		model.addAttribute("delAppList", delAppList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 창작물 삭제 정보
	@RequestMapping(value = "/delInfo", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String delInfo(Integer e_num, Model model) throws Exception {
		CreationInfo creation = service.delInfo(e_num);

		model.addAttribute("creation", creation);

		return "admin/creation/delInfo";
	}

	// 창작물 삭제 승인처리
	@RequestMapping(value = "/delApproval", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String delApproval(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.delApproval(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/creation/delList";
	}

	// 창작물 삭제 거절처리
	@RequestMapping(value = "/delRefuse", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public String delRefuse(CreationInfo creationInfo, RedirectAttributes rttr) throws Exception {
		service.delRefuse(creationInfo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/creation/delList";
	}

	// 카테고리 등록 페이지
	@RequestMapping(value = "/categoryRegister", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public void registerForm(Model model) throws Exception {
		AdminCategory adminCategory = new AdminCategory();
		model.addAttribute(adminCategory);
		model.addAttribute("list", service.list());
	}

	// 카테고리 등록 처리
	@RequestMapping(value = "/categoryRegister", method = RequestMethod.POST)
	public String register(AdminCategory category, RedirectAttributes rttr) throws Exception {
		service.register(category);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/creation/categoryRegister";
	}

	// 카테고리 목록 페이지
	@RequestMapping(value = "/categoryList", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}

	// 카테고리 상세 페이지
	@RequestMapping(value = "/categoryRead", method = RequestMethod.GET)
	public void read(String category_code, Model model) throws Exception {
		model.addAttribute(service.read(category_code));
	}

	// 카테고리 수정 페이지
	@RequestMapping(value = "/categoryModify", method = RequestMethod.GET)
	public void modifyForm(String category_code, Model model) throws Exception {
		model.addAttribute(service.read(category_code));
	}

	// 카테고리 수정 처리
	@RequestMapping(value = "/categoryModify", method = RequestMethod.POST)
	public String modify(AdminCategory category, RedirectAttributes rttr) throws Exception {
		service.modify(category);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/creation/categoryRegister";
	}

	// 카테고리 삭제 처리
	@RequestMapping(value = "/categoryRemove", method = RequestMethod.POST)
	public String remove(String category_code, RedirectAttributes rttr) throws Exception {
		service.remove(category_code);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/creation/categoryRegister";
	}

	// 미리보기 이미지 표시
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer e_num) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = service.getPreview(e_num);

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

	// 첨부파일 다운로드
	@ResponseBody
	@RequestMapping("/download")
	@PreAuthorize("hasRole('ROLE_SUPERADMIN')")
	public ResponseEntity<byte[]> download(Integer e_num, Authentication authentication) throws Exception {
		CreationInfo creation = service.regInfo(e_num);

		String fullName = creation.getE_attachment_url();

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fullName);

			String fileName = fullName.substring(fullName.indexOf("_") + 1);

			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition",
					"attachment;filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

}
