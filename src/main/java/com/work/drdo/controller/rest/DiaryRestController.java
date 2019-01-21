package com.work.drdo.controller.rest;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.domain.questionnaire.RecipientVO;
import com.work.drdo.domain.questionnaire.UserFileVO;
import com.work.drdo.service.diary.DiaryService;
import com.work.drdo.service.diary.FileService;

@RestController
@RequestMapping(value = "/diary")
public class DiaryRestController {
	@Autowired
	private DiaryService diaryService;
	@Autowired
	private FileService fileService;
	
	private static final Logger logger = LoggerFactory.getLogger(DiaryRestController.class);

	@RequestMapping(value = "/generateDiaryId/{diaryType}", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public Object generateDiaryID(@PathVariable String diaryType) {
		logger.info("Generate Diary ID contoller");
		DiaryVO diaryVO = new DiaryVO();
		diaryVO.setDiaryType(diaryType);
		String diaryID = diaryService.saveDiary(diaryVO);
		//return diaryID;
		Gson gson = new Gson();
		String json = gson.toJson(diaryService.getDiaryById(Integer.parseInt(diaryID)));
		return json;
	}
	
	@RequestMapping(value = "/addRecipient", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public Object addRecipient(HttpServletRequest request, @RequestBody RecipientVO recipientVO) {
		String recipientId = diaryService.saveRecipient(recipientVO);
		return recipientId;
	}
	
	@RequestMapping(value="/getRecipientById/{recipientId}",method=RequestMethod.GET)
	public @ResponseBody String getRecipientById(@PathVariable Integer recipientId){
		RecipientVO recipientVO = diaryService.getRecipientById(recipientId);
		Gson gson = new Gson();
		String json = gson.toJson(recipientVO);
		return json;
	}
	
	@RequestMapping(value = "/deleteRecipientById/{recipientId}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void deleteRecipientById(@PathVariable int recipientId) {
		try {
			diaryService.deleteRecipientById(recipientId);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/generateFileNumber/{diaryId}",method=RequestMethod.POST)
	public @ResponseBody String generateFileNumber(@PathVariable Integer diaryId){
		UserFileVO userFileVO = new UserFileVO();
		userFileVO.setDiaryId(diaryId.toString());
		String fileId = fileService.saveFile(userFileVO);
		Gson gson = new Gson();
		String json = gson.toJson(fileService.getFileById(Integer.parseInt(fileId)));
		return json;
	}

}
