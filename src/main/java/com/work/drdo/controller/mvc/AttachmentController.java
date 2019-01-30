package com.work.drdo.controller.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.AttachmentVO;
import com.work.drdo.executive.entity.Attachment;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.service.attachmentdetail.AttachmentDetailService;
import com.work.drdo.service.diary.DiaryService;
import com.work.drdo.service.diary.FileService;
import com.work.drdo.utils.SecurityUtils;
import com.work.drdo.utils.Utility;

@Controller
public class AttachmentController {

	@Autowired
	private AttachmentDetailService attachmentDetailService;

	@Autowired
	private DiaryService diaryService;

	@Autowired
	private FileService fileService;
	@Autowired
	UserProfileDAO profileDao;

	@Value("${attachment.path}")
	private String attachmentPath;

	@RequestMapping(value = "/diary/attachment", method = RequestMethod.GET)
	public String questionAttachment(@RequestParam(value = "fileId", required = false) String fileId,
			@Valid AttachmentVO fileBucket, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		try {
			model.addAttribute("fileId", null != fileId ? fileService.getFileById(Integer.parseInt(fileId)) : null);
			if (null != fileId) {
				List<Attachment> documents = attachmentDetailService.findAttachmentByFileId((Integer.parseInt(fileId)));
				model.addAttribute("documents", documents);
				
				UserProfile profile = profileDao
						.find(Integer.valueOf(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId()));
				model.addAttribute("profile", profile);

				String diaryId = (String) model.get("diaryId");
				// model.addAttribute("diary",
				// diaryService.getDiaryEntityById(Integer.parseInt(diaryId)));
				model.addAttribute("diary", diaryService.getDiaryById(Integer.parseInt(diaryId)));
				model.addAttribute("fileName", (String) model.get("fileName"));
				model.addAttribute("fileDescription", (String) model.get("fileDescription"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		/*
		 * String questionText = (String) model.get("questionText");
		 * model.addAttribute("questionText", questionText);
		 * model.addAttribute("parliamentQues", (Integer)
		 * model.get("parliamentQues")); model.addAttribute("parliamentHouse",
		 * (Integer) model.get("parliamentHouse"));
		 * model.addAttribute("suppQues", (String) model.get("suppQues"));
		 * model.addAttribute("suppQuesNumber", (Integer)
		 * model.get("suppQuesNumber")); model.addAttribute("starredQues",
		 * (Character) model.get("starredQues"));
		 * model.addAttribute("starredNoteText", (String)
		 * model.get("starredNoteText"));
		 */
		return "scientist/submitFilePage";
	}

	@RequestMapping(value = "/diary/saveAttachment", method = RequestMethod.POST)
	public String saveAttachment(@Valid AttachmentVO fileBucket, BindingResult result, HttpServletRequest request,
			HttpServletResponse response, ModelMap model, RedirectAttributes redir) throws IOException {
		List<Attachment> documents = attachmentDetailService.findAll();
		model.addAttribute("documents", documents);

		redir.addFlashAttribute("diaryId", fileBucket.getDiaryId());
		redir.addFlashAttribute("fileName", fileBucket.getFileName());
		redir.addFlashAttribute("fileDescription", fileBucket.getFileDescription());
		request.setAttribute("fileId", fileBucket.getFileId());

		saveDocument(fileBucket);
		return "redirect:/diary/attachment?fileId=" + fileBucket.getFileId();
	}

	private void saveDocument(AttachmentVO fileBucket) throws IOException {
		Attachment document = new Attachment();
		MultipartFile multipartFile = fileBucket.getFile();
		document.setFileName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setDiary(diaryService.getDiaryEntityById(Integer.parseInt(fileBucket.getDiaryId())));
		document.setFile(fileService.getFileEntityById(Integer.parseInt(fileBucket.getFileId())));
		// document.setContent(multipartFile.getBytes());
		// String documentPath= attachmentPath+"/question/";
		Utility.saveFileToLocation(attachmentPath, multipartFile, document);
		attachmentDetailService.saveDocument(document);
	}

	/*
	 * @RequestMapping(value = { "/download-document-{docId}" }, method =
	 * RequestMethod.GET) public String downloadDocument(@PathVariable int
	 * docId, HttpServletResponse response) throws IOException { Attachment
	 * document = attachmentDetailService.findById(docId);
	 * response.setContentType(null!=document.getType()? document.getType():"");
	 * //response.setContentLength(document.getContent().length);
	 * response.setHeader("Content-Disposition", "attachment; filename=\"" +
	 * document.getFileName() + "\"");
	 * //FileCopyUtils.copy(document.getContent(), response.getOutputStream());
	 * return "attachment"; }
	 */

	/*
	 * @RequestMapping(value = { "/delete-document-{docId}" }, method =
	 * RequestMethod.GET) public String deleteDocument(@RequestParam(value =
	 * "question", required = false) String question,@PathVariable int docId) {
	 * 
	 * attachmentDetailService.deleteById(docId); if(null!=question){ return
	 * "redirect:/admin/attachment?question="+question; }else{ return
	 * "redirect:/admin/attachment"; }
	 * 
	 * }
	 * 
	 * @RequestMapping(value = { "/delete-ans-document-{docId}" }, method =
	 * RequestMethod.GET) public String deleteAnswerDocument(@RequestParam(value
	 * = "answer", required = false) String answer,@PathVariable int docId) {
	 * 
	 * attachmentDetailService.deleteById(docId); if(null!=answer){ return
	 * "redirect:/admin/answer?answer="+answer; }else{ return
	 * "redirect:/admin/answer"; } }
	 */
}
