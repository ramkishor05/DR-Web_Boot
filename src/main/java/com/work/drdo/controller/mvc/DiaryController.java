package com.work.drdo.controller.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.AssignmentVO;
import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.domain.questionnaire.RecipientVO;
import com.work.drdo.domain.questionnaire.UserFileVO;
import com.work.drdo.executive.entity.Attachment;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.service.attachmentdetail.AttachmentDetailService;
import com.work.drdo.service.diary.DiaryService;
import com.work.drdo.service.diary.FileService;
import com.work.drdo.utils.Constants;
import com.work.drdo.utils.SecurityUtils;

@Controller
public class DiaryController {
	@Autowired
	UserProfileDAO profileDao;

	@Autowired
	private DiaryService diaryService;

	@Autowired
	private FileService fileService;

	@Autowired
	private AttachmentDetailService attachmentDetailService;

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@RequestMapping(value = "/scientist/diary/createDiaryPage", method = RequestMethod.GET)
	public String createDiary(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("Create diary contoller");
		UserProfile profile = profileDao
				.find(Integer.valueOf(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId()));
		model.addAttribute("profile", profile);
		return "scientist/createDiary";
	}

	@RequestMapping(value = "/scientist/diary/addDiaryUserDetails", method = RequestMethod.POST)
	public String addDiaryUserDetails(@ModelAttribute("diaryVO") DiaryVO diaryVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("Add Sender and Recipient Details diary contoller");
		try {
			model.addAttribute("diary", diaryService.getDiaryById(Integer.parseInt(diaryVO.getDiaryId())));
			UserProfile profile = profileDao
					.find(Integer.valueOf(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId()));
			model.addAttribute("profile", profile);
			List<RecipientVO> recipientList = diaryService.getRecipientByDiaryId(diaryVO.getDiaryId());
			model.addAttribute("recipientList", recipientList);
			return "scientist/addUserDetailsPage";
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}

	@RequestMapping(value = "/scientist/diary/addDiaryUsers", method = RequestMethod.POST)
	public String addDiaryUsers(@ModelAttribute("recipientVO") RecipientVO recipientVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("diaryID", diaryService.getDiaryById(Integer.parseInt(recipientVO.getDiaryId())));
		return "scientist/fileCreatedPage";
	}

	@RequestMapping(value = "/scientist/diary/fileData", method = RequestMethod.POST)
	public String saveFileNumber(@ModelAttribute("userFileVO") UserFileVO userFileVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		UserFileVO file = fileService.getFileById(Integer.parseInt(userFileVO.getFileId()));
		model.addAttribute("diary", diaryService.getDiaryById(Integer.parseInt(userFileVO.getDiaryId())));
		model.addAttribute("fileId", file);
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(userFileVO.getDiaryId()));
		UserProfile profile = profileDao
				.find(Integer.valueOf(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId()));
		model.addAttribute("profile", profile);
		return "scientist/submitFilePage";
	}

	@RequestMapping(value = "/scientist/diary/submitFile", method = RequestMethod.POST)
	public String submitFile(@ModelAttribute("userFileVO") UserFileVO userFileVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) {
		try {
			fileService.saveFile(userFileVO);
			diaryService.assignDiary(userFileVO.getDiaryId(), null);
			redir.addFlashAttribute("fileSuccess", Constants.SUCCESS);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/scientist/diary/getdiaryList";
	}

	@RequestMapping(value = "/scientist/diary/getdiaryList", method = RequestMethod.GET)
	public String getdiaryList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<DiaryVO> assign = diaryService.getDiaryListByProfileId(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		return "scientist/diaryListPage";
	}

	@RequestMapping(value = "/scientist/diary/viewDiaryDetails/{diaryId}", method = RequestMethod.GET)
	public String viewDiaryDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);
		UserFileVO file = fileService.getFileById(Integer.parseInt(diary.getFileId()));
		List<Attachment> documents = attachmentDetailService
				.findAttachmentByFileId(Integer.parseInt(diary.getFileId()));
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(diaryId.toString()));
		model.addAttribute("documents", documents);
		model.addAttribute("diary", diary);
		model.addAttribute("file", file);
		return "scientist/diaryDetails";
	}
	
	@RequestMapping(value = "/scientist/diary/closeDiaryPage/{diaryId}", method = RequestMethod.GET)
	public String closeDiaryPage(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);
		model.addAttribute("diary", diary);
		return "scientist/closeDiaryDetailsPage";
	}
	
	@RequestMapping(value = "/scientist/diary/closeUserDiary", method = RequestMethod.POST)
	public String closeUserDiary(@ModelAttribute("diaryVO") DiaryVO diaryVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) {
		try {
			diaryService.closeDiary(diaryVO);
			redir.addFlashAttribute("fileSuccess", Constants.SUCCESS);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/scientist/diary/getdiaryList";
	}

	/* Group */
	@RequestMapping(value = "/group/diary/getdiaryList", method = RequestMethod.GET)
	public String getGroupdiaryList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<AssignmentVO> assign = diaryService.getDiaryAssignment(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		model.addAttribute("fileSuccess", (String) model.get("fileSuccess"));
		return "group/diaryListPage";
	}

	@RequestMapping(value = "/group/diary/viewDiaryDetails/{diaryId}/{assignmentId}", method = RequestMethod.GET)
	public String viewGroupDiaryDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId, @PathVariable Integer assignmentId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);
		UserFileVO file = fileService.getFileById(Integer.parseInt(diary.getFileId()));
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(diaryId.toString()));
		List<Attachment> documents = attachmentDetailService
				.findAttachmentByFileId(Integer.parseInt(diary.getFileId()));
		model.addAttribute("documents", documents);
		model.addAttribute("diary", diary);
		model.addAttribute("file", file);
		return "group/diaryDetails";
	}

	@RequestMapping(value = "/group/diary/submitFile", method = RequestMethod.POST)
	public String submitGroupFile(@ModelAttribute("userFileVO") AssignmentVO assignmentVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) {
		try {
			diaryService.assignDiary(assignmentVO.getDiaryId(), assignmentVO);
			redir.addFlashAttribute("fileSuccess", Constants.SUCCESS);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/group/diary/getdiaryList";
	}

	/* Department */
	@RequestMapping(value = "/deptHead/diary/getdiaryList", method = RequestMethod.GET)
	public String getDeptdiaryList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<AssignmentVO> assign = diaryService.getDiaryAssignment(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		model.addAttribute("fileSuccess", (String) model.get("fileSuccess"));
		return "deptHead/diaryListPage";
	}

	@RequestMapping(value = "/deptHead/diary/viewDiaryDetails/{diaryId}/{assignmentId}", method = RequestMethod.GET)
	public String viewDeptDiaryDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId, @PathVariable Integer assignmentId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);

		UserFileVO file = fileService.getFileById(Integer.parseInt(diary.getFileId()));
		List<Attachment> documents = attachmentDetailService
				.findAttachmentByFileId(Integer.parseInt(diary.getFileId()));
		model.addAttribute("documents", documents);
		model.addAttribute("diary", diary);
		model.addAttribute("file", file);
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(diaryId.toString()));
		model.addAttribute("assignment", diaryService.getAssignmentById(assignmentId));
		
		return "deptHead/diaryDetails";
	}

	@RequestMapping(value = "/deptHead/diary/submitFile", method = RequestMethod.POST)
	public String submitDeptFile(@ModelAttribute("userFileVO") AssignmentVO assignmentVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) {
		try {
			diaryService.assignDiary(assignmentVO.getDiaryId(), assignmentVO);
			redir.addFlashAttribute("fileSuccess", Constants.SUCCESS);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/deptHead/diary/getdiaryList";
	}

	/* Division */
	@RequestMapping(value = "/division/diary/getdiaryList", method = RequestMethod.GET)
	public String getDivisionDiaryList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<AssignmentVO> assign = diaryService.getDiaryAssignment(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		model.addAttribute("fileSuccess", (String) model.get("fileSuccess"));
		return "division/diaryListPage";
	}

	@RequestMapping(value = "/division/diary/viewDiaryDetails/{diaryId}/{assignmentId}", method = RequestMethod.GET)
	public String viewDivisionDiaryDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId, @PathVariable Integer assignmentId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);
		UserFileVO file = fileService.getFileById(Integer.parseInt(diary.getFileId()));
		List<Attachment> documents = attachmentDetailService
				.findAttachmentByFileId(Integer.parseInt(diary.getFileId()));
		model.addAttribute("documents", documents);
		model.addAttribute("diary", diary);
		model.addAttribute("file", file);
		model.addAttribute("assignment", diaryService.getAssignmentById(assignmentId));
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(diaryId.toString()));
		return "division/diaryDetails";
	}

	@RequestMapping(value = "/division/diary/submitFile", method = RequestMethod.POST)
	public String submitDivisionFile(@ModelAttribute("userFileVO") AssignmentVO assignmentVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) {
		try {
			diaryService.assignDiary(assignmentVO.getDiaryId(), assignmentVO);
			redir.addFlashAttribute("fileSuccess", Constants.SUCCESS);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/division/diary/getdiaryList";
	}

	/* Admin */
	@RequestMapping(value = "/admin/diary/getdiaryList", method = RequestMethod.GET)
	public String getAdmindiaryList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<AssignmentVO> assign = diaryService.getDiaryAssignment(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		model.addAttribute("fileSuccess", (String) model.get("fileSuccess"));
		return "admin/diaryListPage";
	}

	@RequestMapping(value = "/admin/diary/viewDiaryDetails/{diaryId}/{assignmentId}", method = RequestMethod.GET)
	public String viewAdminDiaryDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId, @PathVariable Integer assignmentId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);
		UserFileVO file = fileService.getFileById(Integer.parseInt(diary.getFileId()));
		List<Attachment> documents = attachmentDetailService
				.findAttachmentByFileId(Integer.parseInt(diary.getFileId()));
		model.addAttribute("documents", documents);
		model.addAttribute("diary", diary);
		model.addAttribute("file", file);
		model.addAttribute("assignmentId", assignmentId);
		model.addAttribute("assignment", diaryService.getAssignmentById(assignmentId));
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(diaryId.toString()));
		return "admin/diaryDetails";
	}

	@RequestMapping(value = "/admin/diary/submitFile", method = RequestMethod.POST)
	public String submitAdminFile(@ModelAttribute("userFileVO") AssignmentVO assignmentVO, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redir) {
		try {
			diaryService.assignDiary(assignmentVO.getDiaryId(), assignmentVO);
			redir.addFlashAttribute("fileSuccess", Constants.SUCCESS);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/admin/diary/getdiaryList";
	}

	@RequestMapping(value = "/admin/diary/getApprovedDiary", method = RequestMethod.GET)
	public String getApprovedDiary(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<AssignmentVO> assign = diaryService.getApprovedDiaryAssignment(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		model.addAttribute("fileSuccess", (String) model.get("fileSuccess"));
		return "admin/approvedDiaryListPage";
	}
	
	@RequestMapping(value = "/admin/diary/viewApprovedDiaryDetails/{diaryId}/{assignmentId}", method = RequestMethod.GET)
	public String viewApprovedDiaryDetails(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer diaryId, @PathVariable Integer assignmentId) {
		DiaryVO diary = diaryService.getDiaryById(diaryId);
		UserFileVO file = fileService.getFileById(Integer.parseInt(diary.getFileId()));
		List<Attachment> documents = attachmentDetailService
				.findAttachmentByFileId(Integer.parseInt(diary.getFileId()));
		model.addAttribute("documents", documents);
		model.addAttribute("diary", diary);
		model.addAttribute("file", file);
		model.addAttribute("assignmentId", assignmentId);
		model.addAttribute("assignment", diaryService.getAssignmentById(assignmentId));
		model.addAttribute("recipientList", diaryService.getRecipientByDiaryId(diaryId.toString()));
		return "admin/approvedDiaryDetails";
	}
	
	@RequestMapping(value = "/admin/diary/getClosedDiary", method = RequestMethod.GET)
	public String getClosedDiary(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		List<AssignmentVO> assign = diaryService.getApprovedDiaryAssignment(SecurityUtils.getUserProfile().getProfileId());
		model.addAttribute("assign", assign);
		return "admin/closedDiaryListPage";
	}
}
