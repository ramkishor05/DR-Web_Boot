package com.work.drdo.service.diary.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.drdo.dao.DiaryDAO;
import com.work.drdo.dao.UserFileDAO;
import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.domain.questionnaire.UserFileVO;
import com.work.drdo.executive.entity.UserDiary;
import com.work.drdo.executive.entity.UserFile;
import com.work.drdo.helper.UserFileMapper;
import com.work.drdo.service.diary.FileService;

@Service(value="fileService")
public class FileServiceImpl implements FileService {

	@Autowired
    private DiaryDAO diaryDAO;
	
	@Autowired
	UserFileDAO fileDAO;
	
	
	@Override
	public String saveFile(UserFileVO userFileVO) {
		String fileId = null;
		try {
			UserFile file = UserFileMapper.mapToDB(userFileVO);
			if (null != userFileVO.getFileId()) {
				fileDAO.merge(file);
			} else {
				fileId= fileDAO.saveFile(file);
				UserDiary diary = diaryDAO.getReference(Integer.parseInt(userFileVO.getDiaryId()));
				diary.setFileNumber(file);
				diaryDAO.merge(diary);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return fileId;
	}

	@Override
	public void updateDiary(DiaryVO diaryVO) {
		
	}
	
	@Override
	public UserFileVO getFileById(Integer fileId){
		UserFile file = fileDAO.getReference(fileId);
		UserFileVO fileVO=null;
		if(null!=file){
			fileVO = UserFileMapper.mapFromDB(file);
		}
		return fileVO;
	}
	
	@Override
	public UserFile getFileEntityById(Integer fileId){
		return fileDAO.getReference(fileId);
	}
}
