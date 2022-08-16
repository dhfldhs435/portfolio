package com.ebookmarket.board.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
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

import com.ebookmarket.board.domain.MemberNotice;
import com.ebookmarket.board.service.MemberNoticeService;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Controller
@RequestMapping("/notice")
public class MemberNoticeController {
	
	@Autowired
	private MemberNoticeService service;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	
	
	//공지사항 목록
	@RequestMapping(value = "/memberNoticeList",method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String list(Model model,@ModelAttribute("scri") SearchCriteria scri)throws Exception{
		
		model.addAttribute("memberNoticeList",service.memberNoticeList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		
	
		return "notice/memberNoticeList";
	}
	//상세페이지
	@RequestMapping(value = "/memberNoticeRead",method = RequestMethod.GET)
	public void memberNoticeRead(int mn_num,Model model,MemberNotice memberNotice)throws Exception{
		
		
		mn_num = memberNotice.getMn_num();
		log.info(memberNotice.getMn_num());
		
		model.addAttribute(service.memberNoticeRead(mn_num));
	}
	
	// 이미지 파일미리보기
		@ResponseBody
		@RequestMapping("/display")
		public ResponseEntity<byte[]> displayFile(Integer mn_num) throws Exception {

			InputStream in = null;
			ResponseEntity<byte[]> entity = null;

			String filename = service.getPicture(mn_num);


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