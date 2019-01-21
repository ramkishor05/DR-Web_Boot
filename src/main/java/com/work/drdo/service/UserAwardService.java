package com.work.drdo.service;

import java.util.List;

import com.work.drdo.domain.questionnaire.UserAwardVO;
import com.work.drdo.executive.entity.UserAward;
import com.work.drdo.executive.entity.UserProfile;

public interface UserAwardService {

	public String saveAward(UserProfile userProfile,UserAwardVO userAwardVO);

	public List<UserAward> findAll();

	public UserAward findById(Integer id);

	public void deleteAwardById(int id);
}
