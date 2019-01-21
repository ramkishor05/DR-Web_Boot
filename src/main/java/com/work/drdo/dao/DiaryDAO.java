package com.work.drdo.dao;

import java.util.List;

import com.work.drdo.executive.entity.UserDiary;

public interface DiaryDAO {
	public String saveDiary(UserDiary entity);

	public void merge(UserDiary entity);

	public UserDiary getReference(Integer diaryID);

	public List<UserDiary> getDiaryListByProfileId(Integer profileId);

}
