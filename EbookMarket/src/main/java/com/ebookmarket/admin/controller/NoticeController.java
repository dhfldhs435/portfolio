package com.ebookmarket.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.admin.domain.Notice;
import com.ebookmarket.admin.service.NoticeService;
import com.ebookmarket.common.domain.CodeLabelValue;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.Pagination;
import com.ebookmarket.common.domain.SearchCriteria;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Value("${upload.path}")
	private String uploadPath;

	// 판매자회원 공지사항 등록 페이지
	@RequestMapping(value = "/sellerRegister", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerRegisterForm(Model model, Principal principal) throws Exception {
		Notice notice = new Notice();

		notice.setSn_writer(principal.getName());

		model.addAttribute("notice", notice);

	}

	// 판매자회원 공지사항 등록 처리
	@RequestMapping(value = "/sellerRegister", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String sellerRegister(Notice notice, RedirectAttributes rttr) throws Exception {

		MultipartFile attachmentFile = notice.getSn_attachment();
		if (attachmentFile != null) {
			String createdNoticeAttachmentFileName = uploadFile(attachmentFile.getOriginalFilename(),
					attachmentFile.getBytes());

			notice.setSn_attachment_url(createdNoticeAttachmentFileName);
		}

		noticeService.sellerRegister(notice);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/notice/sellerList";
	}

	// 판매자회원 공지사항 목록 페이지
	@RequestMapping(value = "/sellerList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerList(SearchCriteria scri, Model model) throws Exception {
 
		
		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("noticeListS", noticeService.sellerlist(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.sellerListCount(scri));

		model.addAttribute("pageMaker", pageMaker);



	}

	// 일반회원 공지사항 목록 페이지
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberList(SearchCriteria scri, Model model) throws Exception {

		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("noticeListM", noticeService.memberlist(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(noticeService.memberListCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	// 판매자회원 공지사항 상세 페이지
	@RequestMapping(value = "/sellerRead", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String sellerRead(Integer sn_num, Model model)
			throws Exception {
		Notice notice = noticeService.sellerRead(sn_num);

		model.addAttribute("notice", notice);

		return "admin/notice/sellerRead";
	}

	// 판매자회원 공지사항 수정 페이지
	@RequestMapping(value = "/sellerModify", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void sellerModifyForm(Integer sn_num, @ModelAttribute("pgrq") PageRequest pageRequest, Model model)
			throws Exception {
		model.addAttribute("notice", noticeService.sellerRead(sn_num));
	}

	// 판매자회원 공지사항 수정 처리
	@RequestMapping(value = "/sellerModify", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String sellerModify(Notice notice, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {

		MultipartFile attachmentFile = notice.getSn_attachment();
		if (attachmentFile != null) {
			String createdNoticeAttachmentFileName = uploadFile(attachmentFile.getOriginalFilename(),
					attachmentFile.getBytes());

			notice.setSn_attachment_url(createdNoticeAttachmentFileName);
		}

		noticeService.sellerModify(notice);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		// rttr.addAttribute("searchType", pageRequest.getSearchType());
		// rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/notice/sellerList";
	}

	// 판매자회원 공지사항 삭제 처리
	@RequestMapping(value = "/sellerRemove", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String sellerRemove(Integer sn_num,  RedirectAttributes rttr) throws Exception {

		noticeService.sellerRemove(sn_num);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.

		// 검색 유형과 검색어를 뷰에 전달한다.
		// rttr.addAttribute("searchType", pageRequest.getSearchType());
		// rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/notice/sellerList";
	}

	// 일반회원 공지사항 등록 페이지
	@RequestMapping(value = "/memberRegister", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberRegisterForm(Notice notice, Model model, Principal principal) throws Exception {

		notice.setMn_writer(principal.getName());

		model.addAttribute("notice", notice);

	}

	// 일반회원 공지사항 등록 처리
	@RequestMapping(value = "/memberRegister", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String memberRegister(Notice notice, RedirectAttributes rttr) throws Exception {

		MultipartFile attachmentFile = notice.getMn_attachment();
		if (attachmentFile != null) {
			String createdNoticeAttachmentFileName = uploadFile(attachmentFile.getOriginalFilename(),
					attachmentFile.getBytes());

			notice.setMn_attachment_url(createdNoticeAttachmentFileName);
		}

		noticeService.memberRegister(notice);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/notice/memberList";
	}

	// 일반회원 공지사항 상세 페이지
	@RequestMapping(value = "/memberRead", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String memberRead(Integer mn_num, Model model)
			throws Exception {
		Notice notice = noticeService.memberRead(mn_num);

		model.addAttribute("notice", notice);

		return "admin/notice/memberRead";
	}

	// 일반회원 공지사항 수정 페이지
	@RequestMapping(value = "/memberModify", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public void memberModifyForm(Integer mn_num, @ModelAttribute("pgrq") PageRequest pageRequest, Model model)
			throws Exception {
		model.addAttribute("notice", noticeService.memberRead(mn_num));
	}

	// 일반회원 공지사항 수정 처리
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String memberModify(Notice notice, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {

		MultipartFile attachmentFile = notice.getMn_attachment();
		if (attachmentFile != null) {
			String createdNoticeAttachmentFileName = uploadFile(attachmentFile.getOriginalFilename(),
					attachmentFile.getBytes());

			notice.setMn_attachment_url(createdNoticeAttachmentFileName);
		}

		noticeService.memberModify(notice);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		// rttr.addAttribute("searchType", pageRequest.getSearchType());
		// rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/notice/memberList";
	}

	// 일반회원 공지사항 삭제 처리
	@RequestMapping(value = "/memberRemove", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String remove(Integer mn_num,  RedirectAttributes rttr) throws Exception {

		noticeService.memberRemove(mn_num);


		// 검색 유형과 검색어를 뷰에 전달한다.
		// rttr.addAttribute("searchType", pageRequest.getSearchType());
		// rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/notice/memberList";
	}

	// 상품 이미지 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();

		String createdFileName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;
	}

	// 판매자회원 공지사항 첨부파일 다운로드
	@ResponseBody
	@RequestMapping("/sellerdownload")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<byte[]> sellerdownload(Integer sn_num, Authentication authentication) throws Exception {
		Notice notice = noticeService.sellerRead(sn_num);

		String fullName = notice.getSn_attachment_url();

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

	// 일반회원 공지사항 첨부파일 다운로드
	@ResponseBody
	@RequestMapping("/memberdownload")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<byte[]> memberdownload(Integer mn_num, Authentication authentication) throws Exception {
		Notice notice = noticeService.memberRead(mn_num);

		String fullName = notice.getMn_attachment_url();

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
