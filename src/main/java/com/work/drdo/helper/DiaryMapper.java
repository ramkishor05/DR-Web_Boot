package com.work.drdo.helper;

import java.util.Calendar;
import java.util.Random;

import com.work.drdo.domain.questionnaire.DiaryVO;
import com.work.drdo.executive.entity.UserDiary;
import com.work.drdo.utils.Constants;
import com.work.drdo.utils.SecurityUtils;

public class DiaryMapper {
	
	public static DiaryVO mapFromDB(UserDiary diary){
		DiaryVO diaryVO = new DiaryVO();
		diaryVO.setDairyNumber(diary.getDiaryNo());
		diaryVO.setDiaryId(diary.getDiaryId().toString());
		diaryVO.setDiaryType(diary.getDiaryType());
		diaryVO.setFileId(null!=diary.getFile() ? diary.getFile().getUserFileId().toString() : "");
		diaryVO.setSenderName(diary.getCreatedBy().getFirstName()+" "+diary.getCreatedBy().getLastName());
		diaryVO.setClosureComment(diary.getClouserComment());
		diaryVO.setDiaryStatus(diary.getDiaryStatus());
		return diaryVO;
	}

	public static UserDiary mapToDB(DiaryVO diaryVO){
		UserDiary diary = new UserDiary();
		Random rand = new Random(); 
        int random = rand.nextInt(100000);
		Calendar calendar = Calendar.getInstance();  
		int date = calendar.get(Calendar.DATE); 
		int month = calendar.get(Calendar.MONTH)+1;
		int year = calendar.get(Calendar.YEAR);
		diary.setDiaryNo(random+"/"+year+"/"+month+"/"+date);
		diary.setDiaryType(diaryVO.getDiaryType());
		diary.setStatus(Constants.OPEN_DIARY);
		diary.setTimestamp(calendar.getTime());
		diary.setSender(SecurityUtils.getUserProfile());
		diary.setCreatedBy(SecurityUtils.getUserProfile());
		diary.setClouserComment(null!=diaryVO.getClosureComment() ? diaryVO.getClosureComment() : "");
		return diary;
	}
}
