package com.work.drdo.service.diary;

import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.domain.questionnaire.UserFileVO;
import com.work.drdo.executive.entity.UserFile;

public interface FileService {
	public String saveFile(UserFileVO userFileVO);

	public void updateDiary(DiaryVO diaryVO);

	public UserFileVO getFileById(Integer fileId);

	public UserFile getFileEntityById(Integer fileId);
}
