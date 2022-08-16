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
import com.ebookmarket.board.domain.MemberReply;
import com.ebookmarket.board.service.MemberBoardService;
import com.ebookmarket.board.service.MemberReplyService;
import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.mapper.MemberMapper;
import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.client.service.MemberService;
import com.ebookmarket.common.domain.Criteria;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/memberBoard")
public class MemberBoardController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private MemberBoardService service;

	@Value("${upload.path}")
	private String uploadPath;

	// 문의게시판 목록 페이지
	@RequestMapping(value = "/memberBoardList", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_SUPERADMIN')")
	public String memberBoardList(Model model, Authentication authentication,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("memberBoardList", service.memberBoardList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "memberBoard/memberBoardList";

	}

	// 문의게시판 등록 페이지
	@RequestMapping(value = "/memberBoardRegister", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void memberBoardRegister(Model model, Authentication authentication,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		// 로그인한 사용자 정보 획득
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		Member member = customUser.getMember();

		MemberBoard memberBoard = new MemberBoard();
		// 변수에 값을 집어넣음
		memberBoard.setMb_id(member.getM_id());
		memberBoard.setM_num(member.getM_num());

		model.addAttribute("scri", scri);
		model.addAttribute(memberBoard);
	}

	// 문의게시판 등록 처리
	@RequestMapping(value = "/memberBoardRegister", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String memberBoardRegister(@Validated MemberBoard memberBoard, RedirectAttributes rttr,
			@AuthenticationPrincipal CustomUser customUser) throws Exception {
		// board m_num 에 member m_num 삽입
		String userId = customUser.getUsername();

		Member member = memberMapper.readByUserId(userId);

		int m_num = member.getM_num();

		memberBoard.setM_num(m_num);
//이미지 처리
		MultipartFile mb_attachmentFile = memberBoard.getMb_attachmentFile();

		String CreatedAttachmentFileName = uploadFile(mb_attachmentFile.getOriginalFilename(),
				mb_attachmentFile.getBytes());

		memberBoard.setMb_attachmentFileUrl(CreatedAttachmentFileName);
//처리
		service.register(memberBoard);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/memberBoard/memberBoardList";
	}

	// 등록 성공 페이지
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public void registerSuccess(Model model) throws Exception {

	}

	// 게시글 상세 페이지
	@RequestMapping(value = "/memberBoardRead", method = RequestMethod.GET)
	public String read(int mb_num, RedirectAttributes rttr, @AuthenticationPrincipal CustomUser customUser, Model model,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {

		MemberBoard memberBoard = service.read(mb_num);

		model.addAttribute(memberBoard);
		model.addAttribute("scri", scri);

		return "memberBoard/memberBoardRead";

	}

	// 게시글 수정하기
	@RequestMapping(value = "/memberBoardModify", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public void modifyForm(int mb_num, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute(service.read(mb_num));
		model.addAttribute("scri", scri);
	}

	// 게시글 수정하기
	@RequestMapping(value = "/memberBoardModify", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String memberBoardModify(MemberBoard memberBoard, Model model, RedirectAttributes rttr,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {

		MultipartFile file = memberBoard.getMb_attachmentFile();

		if (file != null && file.getSize() > 0) {
			String CreatedAttachmentFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

			memberBoard.setMb_attachmentFileUrl(CreatedAttachmentFileName);
		}

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		service.memberBoardModify(memberBoard);
		rttr.addAttribute("msg", "SUCCESS");

		return "redirect:/memberBoard/memberBoardList";
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/memberBoardRemove", method = RequestMethod.POST)
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	public String memberBoardRemove(MemberBoard memberBoard, RedirectAttributes rttr,
			@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		this.service.remove(memberBoard.getMb_num());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/memberBoard/memberBoardList";
	}

	// 이미지 파일미리보기
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer mb_num) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String filename = service.getPicture(mb_num);

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
