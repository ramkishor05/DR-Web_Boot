package com.work.drdo.service.basicDetails.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.UserAwardDAO;
import com.work.drdo.domain.questionnaire.UserAwardVO;
import com.work.drdo.executive.entity.UserAward;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.service.UserAwardService;

@Service("userAwardService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserAwardServiceImpl implements UserAwardService {
	@Autowired
	UserAwardDAO userAwardDAO;
	@Override
	public String saveAward(UserProfile userProfile,UserAwardVO awardVO) {
		UserAward award=new UserAward();
		award.setDescription(awardVO.getDescription());
		if(awardVO.getId()!=null){
		 award.setId(Integer.valueOf(awardVO.getId()));
		}
		award.setUserProfile(userProfile);
		userAwardDAO.saveAward(award);
		return String.valueOf(award.getId());
	}

	@Override
	public List<UserAward> findAll() {
		return null;
	}

	@Override
	public UserAward findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAwardById(int id) {
		// TODO Auto-generated method stub

	}

}
