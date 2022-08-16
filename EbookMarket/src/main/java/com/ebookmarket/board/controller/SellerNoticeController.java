package com.ebookmarket.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebookmarket.board.domain.SellerNotice;
import com.ebookmarket.board.service.SellerNoticeService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/notice")
public class SellerNoticeController {

	@Autowired
	private SellerNoticeService service;

	@Value("${upload.path}")
	private String uploadPath;

	// 공지사항 목록
	@RequestMapping(value = "/sellerNoticeList", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_SELLER')")
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("sellerNoticeList", service.sellerNoticeList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "notice/sellerNoticeList";
	}

	// 상세페이지
	@RequestMapping(value = "/sellerNoticeRead", method = RequestMethod.GET)
	public void sellerNoticeRead(int sn_num, Model model, SellerNotice sellerNotice) throws Exception {

		sn_num = sellerNotice.getSn_num();
		log.info(sellerNotice.getSn_num());

		model.addAttribute(service.sellerNoticeRead(sn_num));
	}

	// 이미지 파일미리보기
	@ResponseBody
	@RequestMapping("/display2")
	public ResponseEntity<byte[]> displayFile(Integer sn_num) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String filename = service.getPicture(sn_num);

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
