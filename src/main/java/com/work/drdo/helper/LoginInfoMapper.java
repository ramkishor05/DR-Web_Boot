package com.work.drdo.helper;

import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.work.drdo.domain.beans.RegisterDesignationBean;
import com.work.drdo.domain.beans.RegisterFormationBean;
import com.work.drdo.domain.beans.RegisterLoginBean;
import com.work.drdo.domain.beans.RegisterProfileBean;
import com.work.drdo.domain.beans.WelcomeAddressBean;
import com.work.drdo.domain.beans.WelcomeBasicDetailBean;
import com.work.drdo.domain.beans.WelcomeProfileBean;
import com.work.drdo.domain.login.LoggedInUser;
import com.work.drdo.domain.questionnaire.AddressVO;
import com.work.drdo.domain.questionnaire.BasicDetailsVO;
import com.work.drdo.domain.questionnaire.FormationVO;
import com.work.drdo.domain.questionnaire.ManPowerVo;
import com.work.drdo.domain.questionnaire.ProjectDetailVo;
import com.work.drdo.domain.questionnaire.ProjectVo;
import com.work.drdo.domain.questionnaire.UserDesignationVO;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.Address;
import com.work.drdo.executive.entity.BasicDetail;
import com.work.drdo.executive.entity.Formation;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.Manpower;
import com.work.drdo.executive.entity.UserDesignation;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.executive.entity.UserProject;
import com.work.drdo.executive.entity.UserProjectDetail;
import com.work.drdo.utils.DateUtils;
import com.work.drdo.utils.SecurityUtils;

public class LoginInfoMapper {

	static Logger logger = Logger.getLogger(LoginInfoMapper.class.getName());

	/**
	 * 
	 * @param loginBean
	 * @return
	 */
	public static LoginInfo getRegisterLoginInfo(RegisterLoginBean loginBean,LoggedInUser createdBy) {
		Date currentDate = new Date();
		LoginInfo loginDetail = new LoginInfo();
		loginDetail.setUserName(loginBean.getUserName());
		loginDetail.setPassword(new BCryptPasswordEncoder().encode(loginBean.getPassword()));
		loginDetail.setEnabled('Y');
		loginDetail.setActive('Y');
		loginDetail.setLocked('N');
		loginDetail.setCreatedBy(createdBy.getUsername());
		loginDetail.setUpdBy(createdBy.getUsername());
		loginDetail.setLastLogin(currentDate);
		loginDetail.setCreatedTs(currentDate);
		loginDetail.setUpdTs(currentDate);
		return loginDetail;
	}
	
	public static UserProfile getRegisterProfileInfo(LoginInfo loginInfo,RegisterProfileBean profileBean) {
		if(profileBean==null) {
			System.err.println("RegisterProfileBean is null");
			return null;
		}
		Date currentDate = new Date();
		UserProfile profile = new UserProfile();
		profile.setProfileId(profileBean.getProfileId());
		profile.setCreatedTs(currentDate);
		profile.setRegnDate(currentDate);
		profile.setUserName(loginInfo.getUserName());
		profile.setPrefix(profileBean.getPrefix());
		profile.setFirstName(profileBean.getFirstName());
		profile.setMiddleName(profileBean.getMiddleName());
		profile.setLastName(profileBean.getLastName());
		profile.setGender(profileBean.getGender());
		profile.setEmail(profileBean.getEmail());
		return profile;
	}

	public static UserDesignation getUserDesignation(RegisterDesignationBean designationBean) {
		if(designationBean==null) {
			return null;
		}
		UserDesignation designation=new UserDesignation();
		designation.setGrade(designationBean.getGrade());
		designation.setDesignation(designationBean.getDesignation());
		designation.setId(designationBean.getId());
		return designation;
	} 
	
	
	public static UserProfile getWelcomeProfile(UserProfile dbUserProfile, WelcomeProfileBean profileBean) {
		if(dbUserProfile==null) {
			return null;
		}
		dbUserProfile.setPrefix(profileBean.getPrefix());;
		dbUserProfile.setFirstName(profileBean.getFirstName());;
		dbUserProfile.setMiddleName(profileBean.getMiddleName());;
		dbUserProfile.setLastName(profileBean.getLastName());;
		dbUserProfile.setGender(profileBean.getGender());;
		dbUserProfile.setEmail(profileBean.getEmail());;
		if (StringUtils.isNotEmpty(profileBean.getDateOfBirth())) {
			try {
				dbUserProfile.setDateOfBirth(DateUtils.toDate(profileBean.getDateOfBirth()));
			} catch (Exception ex) {
				logger.log(Level.ALL, ex.getMessage(), ex);
			}
		}
		dbUserProfile.setExtension(profileBean.getExtension());;
		dbUserProfile.setPhone(profileBean.getPhone());;
		dbUserProfile.setMobile(profileBean.getMobile());;
		return dbUserProfile;
	}
	
	public static Address getWelcomeAddress(Address dbAddress, WelcomeAddressBean addressBean) {
		if(addressBean==null) {
			return null;
		}
		if(dbAddress==null) {
			dbAddress =new Address();
		}
		dbAddress.setAddressId(addressBean.getAddressId());
		dbAddress.setAddressCity(addressBean.getAddressCity());
		dbAddress.setAddressLine(addressBean.getAddressLine());
		dbAddress.setAddressPin(addressBean.getAddressPin());
		dbAddress.setAddressState(addressBean.getAddressState());
		return dbAddress;
	}
	
	public static BasicDetail getBasicDetail(BasicDetail bnBasicDetail,WelcomeBasicDetailBean basicDetailBean) {
		if(basicDetailBean==null) {
			return null;
		}
		if(bnBasicDetail==null) {
			bnBasicDetail=new BasicDetail();
		}
		bnBasicDetail.setBasicDetailId(basicDetailBean.getBasicDetailId());
		if (StringUtils.isNotEmpty(basicDetailBean.getJoiningDate()))
			try {
				bnBasicDetail.setJoiningDate(DateUtils.toDate(basicDetailBean.getJoiningDate()));
			} catch (ParseException e) {
				e.printStackTrace();
		}
		bnBasicDetail.setInterestedResearchArea(basicDetailBean.getInterestedResearchArea());
		bnBasicDetail.setResearchArea(basicDetailBean.getResearchArea());
		bnBasicDetail.setResearchPaper(basicDetailBean.getResearchPaper());
		bnBasicDetail.setPatent(basicDetailBean.getPatent());
		bnBasicDetail.setQualification(basicDetailBean.getQualification());
		bnBasicDetail.setDesignation(basicDetailBean.getDesignation());
		return bnBasicDetail;
	}
	
	
	
	
	public static LoginInfo getLoginInfo(UserDetailVO loginVo) {
		Date currentDate = new Date();
		LoginInfo loginDetail = new LoginInfo();
		loginDetail.setEnabled('Y');
		loginDetail.setActive('Y');
		loginDetail.setLocked('N');
		loginDetail.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		loginDetail.setUpdBy(SecurityUtils.getLoggedInUser().getUsername());
		loginDetail.setUserName(loginVo.getUsername());
		loginDetail.setLastLogin(currentDate);
		loginDetail.setCreatedTs(currentDate);
		loginDetail.setUpdTs(currentDate);
		loginDetail.setPassword(new BCryptPasswordEncoder().encode(loginVo.getPassword()));
		return loginDetail;
	}

	public static UserProfile getUserProfile(UserDetailVO userDetailVO) {
		Date currentDate = new Date();
		UserProfile profile = new UserProfile();
		profile.setProfileId(userDetailVO.getId());
		profile.setCreatedTs(currentDate);
		profile.setRegnDate(currentDate);
		if (StringUtils.isNotEmpty(userDetailVO.getBirthDay())) {
		try {
			profile.setDateOfBirth(DateUtils.toDate(userDetailVO.getBirthDay()));
		} catch (Exception ex) {
			logger.log(Level.ALL, ex.getMessage(), ex);
		}
		}
		if (StringUtils.isNotEmpty(userDetailVO.getExpirationDate())) {
		try {
			profile.setExpirationDate(DateUtils.toDate(userDetailVO.getExpirationDate()));
		} catch (Exception ex) {
			logger.log(Level.ALL, ex.getMessage(), ex);
		}
		}
		if (StringUtils.isNotEmpty(userDetailVO.getPHONE_NUMBER())) {
			profile.setPhone(userDetailVO.getPHONE_NUMBER());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getEMAIL_ADDRESS())) {
			profile.setEmail(userDetailVO.getEMAIL_ADDRESS());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getPrefix())) {
			profile.setPrefix(userDetailVO.getPrefix());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getFirstName())) {
			profile.setFirstName(userDetailVO.getFirstName());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getMiddleName())) {
			profile.setMiddleName(userDetailVO.getMiddleName());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getGender())) {
			profile.setGender(userDetailVO.getGender());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getLastName())) {
			profile.setLastName(userDetailVO.getLastName());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getUsername())) {
			profile.setUserName(userDetailVO.getUsername());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getExtension())) {
			profile.setExtension(userDetailVO.getExtension());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getMobile())) {
			profile.setMobile(userDetailVO.getMobile());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getReplaceBy())) {
			profile.setPosition(userDetailVO.getPosition());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getReplaceBy())) {
			profile.setReplaceBy(userDetailVO.getReplaceBy());
		}
		return profile;
	}
	
	
	public static UserProfile getUserProfile(UserProfile profile,UserDetailVO userDetailVO) {
		if(profile==null){
			profile= new UserProfile();
		}
		if (StringUtils.isNotEmpty(userDetailVO.getBirthDay())) {
			try {
				profile.setDateOfBirth(DateUtils.toDate(userDetailVO.getBirthDay()));
			} catch (Exception ex) {
				logger.log(Level.ALL, ex.getMessage(), ex);
			}
		}
		if (StringUtils.isNotEmpty(userDetailVO.getExpirationDate())) {
			try {
				profile.setExpirationDate(DateUtils.toDate(userDetailVO.getExpirationDate()));
			} catch (Exception ex) {
				logger.log(Level.ALL, ex.getMessage(), ex);
			}
		}
		if (StringUtils.isNotEmpty(userDetailVO.getPHONE_NUMBER())) {
			profile.setPhone(userDetailVO.getPHONE_NUMBER());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getEMAIL_ADDRESS())) {
			profile.setEmail(userDetailVO.getEMAIL_ADDRESS());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getPrefix())) {
			profile.setPrefix(userDetailVO.getPrefix());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getFirstName())) {
			profile.setFirstName(userDetailVO.getFirstName());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getMiddleName())) {
			profile.setMiddleName(userDetailVO.getMiddleName());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getGender())) {
			profile.setGender(userDetailVO.getGender());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getLastName())) {
			profile.setLastName(userDetailVO.getLastName());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getUsername())) {
			profile.setUserName(userDetailVO.getUsername());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getExtension())) {
			profile.setExtension(userDetailVO.getExtension());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getMobile())) {
			profile.setMobile(userDetailVO.getMobile());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getReplaceBy())) {
			profile.setPosition(userDetailVO.getPosition());
		}
		if (StringUtils.isNotEmpty(userDetailVO.getReplaceBy())) {
			profile.setReplaceBy(userDetailVO.getReplaceBy());
		}
		return profile;
	}

	public static Address getAddress(AddressVO addressVo) {
		if(addressVo==null) {
			return null;
		}
		Address address = new Address();
		address.setAddressId(addressVo.getAddressId());
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_CITY())) {
			address.setAddressCity(addressVo.getSHIPPING_CITY());
		}
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_ADDRESS())) {
			address.setAddressLine(addressVo.getSHIPPING_ADDRESS());
		}
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_ZIP())) {
			address.setAddressPin(Integer.parseInt(addressVo.getSHIPPING_ZIP()));
		}
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_STATE())) {
			address.setAddressState(addressVo.getSHIPPING_STATE());
		}
		return address;
	}

	public static BasicDetail getBasicDetail(BasicDetailsVO basicDetailVo) {
		if(basicDetailVo==null) {
			return null;
		}
		BasicDetail basicDetail = new BasicDetail();
		if (StringUtils.isNotEmpty(basicDetailVo.getDesignation()))
			basicDetail.setDesignation(basicDetailVo.getDesignation());
		if (StringUtils.isNotEmpty(basicDetailVo.getJoiningDate()))
			try {
				basicDetail.setJoiningDate(DateUtils.toDate(basicDetailVo.getJoiningDate()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		if (StringUtils.isNotEmpty(basicDetailVo.getTillDate()))
			try {
				basicDetail.setTillDate(DateUtils.toDate(basicDetailVo.getTillDate()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		if (StringUtils.isNotEmpty(basicDetailVo.getInterestedResearchArea())){
			basicDetail.setInterestedResearchArea(basicDetailVo.getInterestedResearchArea());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getResearchArea())){
			basicDetail.setResearchArea(basicDetailVo.getResearchArea());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getPatent())){
			basicDetail.setPatent(basicDetailVo.getPatent());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getQualification())){
			basicDetail.setQualification(basicDetailVo.getQualification());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getResearchPaper())){
			basicDetail.setResearchPaper(basicDetailVo.getResearchPaper());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getTot())){
			basicDetail.setTot(basicDetailVo.getTot());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getCopyright())){
			basicDetail.setCopyright(basicDetailVo.getCopyright());
		}
		return basicDetail;
	}
	
	public static Manpower getManpowerDetail(ManPowerVo manpowerVo) {
		if(manpowerVo==null) {
			return null;
		}
		Manpower manpowerDetail=new Manpower();
		manpowerDetail.setManpowerId(manpowerVo.getManpowerId());
		manpowerDetail.setJrf(manpowerVo.getJrf());
		manpowerDetail.setSrf(manpowerVo.getSrf());
		manpowerDetail.setRa(manpowerVo.getRa());
		manpowerDetail.setProjectAssinged(manpowerVo.getProjectAssinged());
		manpowerDetail.setMts(manpowerVo.getMts());
		return manpowerDetail;
	}
	
	public static UserDesignation getUserDesignation(UserDesignationVO userDesignation) {
		if(userDesignation==null) {
			return null;
		}
		UserDesignation designation=new UserDesignation();
		designation.setGrade(userDesignation.getGrade());
		designation.setDesignation(userDesignation.getDesignation());
		designation.setId(userDesignation.getId());
		return designation;
	}
	
	public static UserProject getUserProject(ProjectVo projectVo) {
		if(projectVo==null) {
			return null;
		}
		UserProject userProject=new UserProject();
		userProject.setUserProjectId(projectVo.getUserProjectId());
		userProject.setName(projectVo.getName());
		return userProject;
	}

	public static UserProjectDetail getUserProjectDetail(ProjectDetailVo projectDetailVo) {
		if(projectDetailVo==null) {
			return null;
		}
		UserProjectDetail detail=new UserProjectDetail();
		detail.setUserProjectDetailId(projectDetailVo.getUserProjectDetailId());
		detail.setDescription(projectDetailVo.getDescription());
		detail.setName(projectDetailVo.getName());
		return detail;
	}
	
	/*
	 * Remove in future
	 */

	
	public static BasicDetail getBasicDetail(BasicDetail basicDetail, BasicDetailsVO basicDetailVo) {
		if(basicDetail==null) {
			basicDetail = new BasicDetail();
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getDesignation()))
			basicDetail.setDesignation(basicDetailVo.getDesignation());
		if (StringUtils.isNotEmpty(basicDetailVo.getJoiningDate())) {
			try {
				basicDetail.setJoiningDate(DateUtils.toDate(basicDetailVo.getJoiningDate()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getTillDate())) {
			try {
				basicDetail.setTillDate(DateUtils.toDate(basicDetailVo.getTillDate()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getInterestedResearchArea())){
			basicDetail.setInterestedResearchArea(basicDetailVo.getInterestedResearchArea());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getResearchArea())){
			basicDetail.setResearchArea(basicDetailVo.getResearchArea());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getPatent())){
			basicDetail.setPatent(basicDetailVo.getPatent());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getQualification())){
			basicDetail.setQualification(basicDetailVo.getQualification());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getResearchPaper())){
			basicDetail.setResearchPaper(basicDetailVo.getResearchPaper());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getTot())){
			basicDetail.setTot(basicDetailVo.getTot());
		}
		if (StringUtils.isNotEmpty(basicDetailVo.getCopyright())){
			basicDetail.setCopyright(basicDetailVo.getCopyright());
		}
		return basicDetail;
	}


	public static Address getAddress(Address address, AddressVO addressVo) {
		if(address==null) {
			address =new Address();
		}
		address.setAddressId(addressVo.getAddressId());
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_CITY())) {
			address.setAddressCity(addressVo.getSHIPPING_CITY());
		}
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_ADDRESS())) {
			address.setAddressLine(addressVo.getSHIPPING_ADDRESS());
		}
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_ZIP())) {
			address.setAddressPin(Integer.valueOf(addressVo.getSHIPPING_ZIP()));
		}
		if (StringUtils.isNotEmpty(addressVo.getSHIPPING_STATE())) {
			address.setAddressState(addressVo.getSHIPPING_STATE());
		}
		return address;
	}

	

	

	

	
}
