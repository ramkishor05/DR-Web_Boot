package com.work.drdo.service.diary;

import java.util.List;

import com.work.drdo.domain.questionnaire.AssignmentVO;
import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.domain.questionnaire.RecipientVO;
import com.work.drdo.executive.entity.UserDiary;

public interface DiaryService {
	public String saveDiary(DiaryVO diaryVO);

	public void updateDiary(DiaryVO diaryVO);

	public DiaryVO getDiaryById(Integer diaryId);

	public UserDiary getDiaryEntityById(Integer diaryId);

	public String saveRecipient(RecipientVO recipientVO);

	public RecipientVO getRecipientById(Integer recipientId);

	public List<RecipientVO> getRecipientByDiaryId(String diaryId);

	public List<DiaryVO> getDiaryListByProfileId(Integer profileId);

	public void assignDiary(String diaryId, AssignmentVO assignmentVO);

	public List<AssignmentVO> getDiaryAssignment(Integer profileId);

	public List<AssignmentVO> getApprovedDiaryAssignment(Integer assignFrom);

	public void deleteRecipientById(Integer recipientId);

	public AssignmentVO getAssignmentById(Integer assignmentId);

	public void closeDiary(DiaryVO diaryVO);

	public List<AssignmentVO> getClosedDiaryAssignment(Integer assignFrom);
}
