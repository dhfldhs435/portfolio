package com.ebookmarket.board.controller;

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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.board.domain.MemberBoard;
import com.ebookmarket.board.domain.SellerBoard;
import com.ebookmarket.board.service.SellerBoardService;
import com.ebookmarket.client.domain.Seller;

import com.ebookmarket.client.mapper.SellerMapper;

import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.common.domain.Criteria;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/sellerBoard")
public class SellerBoardController {

	@Autowired
	private SellerMapper sellerMapper;

	@Autowired
	private SellerBoardService service;

	@Value("${upload.path}")
	private String uploadPath;

	// 문의게시판 목록 페이지
	@RequestMapping(value = "/sellerBoardList", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_SELLER', 'ROLE_SUPERADMIN')")
	public String sellerBoardList(Model model, Authentication authentication,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("sellerBoardList", service.sellerBoardList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "sellerBoard/sellerBoardList";

	}

	// 문의게시판 등록 페이지
	@RequestMapping(value = "/sellerBoardRegister", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public void sellerBoardRegister(Model model, Authentication authentication,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		// 로그인한 사용자 정보 획득
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Seller seller = customUser.getSeller();

		SellerBoard sellerBoard = new SellerBoard();
		// 변수에 값을 집어넣음
		sellerBoard.setSb_id(seller.getS_id());
		sellerBoard.setS_num(seller.getS_num());
		model.addAttribute("scri", scri);
		model.addAttribute(sellerBoard);
	}

	// 문의게시판 등록 처리
	@RequestMapping(value = "/sellerBoardRegister", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerBoardRegister(@Validated SellerBoard sellerBoard, RedirectAttributes rttr,
			@AuthenticationPrincipal CustomUser customUser) throws Exception {
		// board S_num 에 seller S_num 삽입
		String userId = customUser.getUsername();

		Seller seller = sellerMapper.readByUserId(userId);

		int S_num = seller.getS_num();

		sellerBoard.setS_num(S_num);
//이미지 처리
		MultipartFile Sb_attachmentFile = sellerBoard.getSb_attachmentFile();

		String CreatedAttachmentFileName = uploadFile(Sb_attachmentFile.getOriginalFilename(),
				Sb_attachmentFile.getBytes());

		sellerBoard.setSb_attachmentFileUrl(CreatedAttachmentFileName);
//처리
		service.register(sellerBoard);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/sellerBoard/sellerBoardList";
	}

	// 등록 성공 페이지
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public void registerSuccess(Model model) throws Exception {

	}

	// 게시글 상세 페이지
	@RequestMapping(value = "/sellerBoardRead", method = RequestMethod.GET)
	public String read(int sb_num, RedirectAttributes rttr, @AuthenticationPrincipal CustomUser customUser, Model model,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {

		SellerBoard sellerBoard = service.read(sb_num);

		model.addAttribute(sellerBoard);
		model.addAttribute("scri", scri);

		return "sellerBoard/sellerBoardRead";
	}

	// 게시글 수정하기
	@RequestMapping(value = "/sellerBoardModify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public void modifyForm(int sb_num, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute(service.read(sb_num));
		model.addAttribute("scri", scri);
	}

	// 게시글 수정하기
	@RequestMapping(value = "/sellerBoardModify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerBoardModify(SellerBoard sellerBoard, Model model, RedirectAttributes rttr,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {

		MultipartFile file = sellerBoard.getSb_attachmentFile();

		if (file != null && file.getSize() > 0) {
			String CreatedAttachmentFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

			sellerBoard.setSb_attachmentFileUrl(CreatedAttachmentFileName);
		}

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		service.sellerBoardModify(sellerBoard);
		rttr.addAttribute("msg", "SUCCESS");

		return "redirect:/sellerBoard/sellerBoardList";
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/sellerBoardRemove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String sellerBoardRemove(SellerBoard sellerBoard, RedirectAttributes rttr,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		this.service.remove(sellerBoard.getSb_num());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sellerBoard/sellerBoardList";
	}

	// 이미지 파일미리보기
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer Sb_num) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String filename = service.getPicture(Sb_num);

		log.info("FILE_NAME=" + filename);

		try {
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);

			if (formatName.length() < 2) {
				return entity;
			}

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + filename);

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

	// 이미지 파일 미리보기
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			return MediaType.IMAGE_JPEG;
		}
		if (formatName.equals("GIF")) {
			return MediaType.IMAGE_GIF;
		}
		if (formatName.equals("PNG")) {
			return MediaType.IMAGE_PNG;
		}
		return null;
	}

	// 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uuid = UUID.randomUUID();

		String createdFileName = uuid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;

	}

}
