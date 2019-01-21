package com.work.drdo.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.Address;
import com.work.drdo.executive.entity.BasicDetail;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.Manpower;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.utils.SecurityUtils;

public class UserDetailMapper {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDetailMapper.class);
	
	
	public static LoginInfo mapperTODB(UserDetailVO document, byte[] bytes,Integer profileId){
		try{
		Date date = null;
		Date expDate = null;
		LoginInfo loginDetail = new LoginInfo();
		UserProfile profile = new UserProfile();
		Address addressId = new Address();
		//UserRole roleId = new UserRole();
		if(null!=document.getBirthDay()){
			logger.debug("Start ExecutiveMapper mapperTODB>>>>");
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			date = new Date();
			expDate = new Date();
			try {
				logger.debug("Start ExecutiveMapper mapperTODB>>>>");
				if(null != document.getBirthDay())
				date = df.parse(document.getBirthDay());
				if(null != document.getExpirationDate())
				expDate=df.parse(document.getExpirationDate());
				
			} catch (ParseException e) {
				logger.error(e.getMessage());
			}
		}
		logger.debug("Start ExecutiveMapper after date>>>>"+date);
		loginDetail.setActive('Y');
		loginDetail.setLocked('N');
		loginDetail.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		loginDetail.setUpdBy(SecurityUtils.getLoggedInUser().getUsername());
		loginDetail.setUserName(document.getUsername());
		loginDetail.setLastLogin(new Date());
		loginDetail.setCreatedTs(new Date());
		loginDetail.setUpdTs(new Date());
		loginDetail.setPassword(new BCryptPasswordEncoder().encode(document.getPassword()));
		profile.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		profile.setCreatedByRole("ROLE_ADMIN");
		profile.setCreatedTs(new Date());
		profile.setDateOfBirth(date);
		profile.setPhone(document.getPHONE_NUMBER());
		profile.setEmail(document.getEMAIL_ADDRESS());
		profile.setPrefix(document.getPrefix());
		profile.setFirstName(document.getFirstName());
		profile.setMiddleName(document.getMiddleName());
		profile.setGender(document.getGender());
		profile.setLastName(document.getLastName());
		profile.setRegnDate(new Date());
		profile.setUserName(document.getUsername());
		profile.setExtension(document.getExtension());
		profile.setMobile(document.getMobile());
		profile.setPosition(document.getPosition());
		if(null!=document.getReplaceBy()){
			profile.setReplaceBy(document.getReplaceBy());
		}
		profile.setExpirationDate(expDate);
		profile.setProfilePic(bytes);
		/*if(null!=document.getDepartment()){
			profile.setDepartmentId(departmentService.getDeptById(Integer.parseInt(document.getDepartment())));
		}*/
		profile.setAddress(addressId);
		addressId.setAddressCity(document.getSHIPPING_CITY());
		addressId.setAddressLine(document.getSHIPPING_ADDRESS());
		if(null != document.getSHIPPING_ZIP()){
		addressId.setAddressPin(Integer.parseInt(document.getSHIPPING_ZIP()));
		}
		addressId.setAddressState(document.getSHIPPING_STATE());
		profile.setAddress(addressId);
		loginDetail.setProfile(profile);
		return loginDetail;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	public static LoginInfo mapperTODBWithOutImage(UserDetailVO document,Integer profileId) {
		try{
		Date date = null;
		Date expDate = null;
		LoginInfo loginDetail = new LoginInfo();
		UserProfile profile = new UserProfile();
		Address addressId = new Address();
		//Group group = new Group();
		//group.setGroupId(Integer.parseInt(document.getGroupId()));
		//UserRole roleId = new UserRole();
		if(null!=document.getBirthDay()){
			logger.debug("Start ExecutiveMapper mapperTODB>>>>");
			//DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
			date = new Date();
			expDate = new Date();
			try {
				logger.debug("Start ExecutiveMapper mapperTODB>>>>");
				if(null!=document.getBirthDay()){
					date = df.parse(document.getBirthDay());
				}
				if(null!=document.getExpirationDate()){
					expDate=df.parse(document.getExpirationDate());
				}
				
			} catch (ParseException e) {
				logger.error(e.getMessage());
			}
		}
		logger.debug("Start ExecutiveMapper after date>>>>"+date);
		loginDetail.setActive('Y');//TODO take it deom Model
		loginDetail.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		loginDetail.setUpdBy(SecurityUtils.getLoggedInUser().getUsername());
		loginDetail.setUserName(document.getUsername());
		loginDetail.setLastLogin(new Date());
		loginDetail.setCreatedTs(new Date());
		loginDetail.setUpdTs(new Date());
		loginDetail.setLocked('N');
		loginDetail.setPassword(new BCryptPasswordEncoder().encode(document.getPassword()));
		profile.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		profile.setCreatedByRole("ROLE_ADMIN");//TODO
		profile.setCreatedTs(new Date());
		profile.setDateOfBirth(date);
		profile.setPhone(null!=document.getPHONE_NUMBER() ? document.getPHONE_NUMBER() : null);
		profile.setEmail(document.getEMAIL_ADDRESS());
		profile.setPrefix(document.getPrefix());
		profile.setFirstName(document.getFirstName());
		profile.setMiddleName(document.getMiddleName());
		profile.setGender(null!=document.getGender()?document.getGender():"");
		profile.setLastName(document.getLastName());
		profile.setRegnDate(new Date());
		profile.setUserName(document.getUsername());
		//profile.setDepartmentId(departmentService.getDeptById(Integer.parseInt(document.getDepartment())));
		profile.setExtension(null!=document.getExtension()?document.getExtension():"");
		profile.setMobile(null!=document.getMobile()?document.getMobile():"");
		profile.setPosition(null!=document.getPosition()?document.getPosition():"");
		/*if(null != document.getReplaceBy() || "" != document.getReplaceBy()){
		profile.setReplaceBy(Integer.parseInt(document.getReplaceBy()));
		}*/
		profile.setExpirationDate(expDate);
		//profile.setGroupId(group);
		
		addressId.setAddressCity(null!=document.getSHIPPING_CITY() ? document.getSHIPPING_CITY() : "");
		addressId.setAddressLine(null!=document.getSHIPPING_ADDRESS() ? document.getSHIPPING_ADDRESS() : "");
		addressId.setAddressPin(null!=document.getSHIPPING_ZIP() ? Integer.parseInt(document.getSHIPPING_ZIP()): null);
		addressId.setAddressState(null!=document.getSHIPPING_STATE()?document.getSHIPPING_STATE():"");
		profile.setAddress(addressId);
		loginDetail.setProfile(profile);
		return loginDetail;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	public static UserProfile mapperTODBUpdateWithOutImage(UserDetailVO document,com.work.drdo.executive.entity.UserProfile userProfile) {
		try{
			return updateProfile(document, userProfile,null);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	public static UserProfile mapperTODBUpdateWithImage(UserDetailVO document,com.work.drdo.executive.entity.UserProfile userProfile, byte[] pic) {
		try{
			return updateProfile(document, userProfile,pic);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	private static UserProfile updateProfile(UserDetailVO document,
			com.work.drdo.executive.entity.UserProfile userProfile, byte[] pic) {
		Date date = null;
		Date expDate = null;
		Date joiningDate = null;
		Date tillDate = null;
		Address addressId = userProfile.getAddress();
		if(null!=document.getBirthDay()){
			logger.debug("Start ExecutiveMapper mapperTODB>>>>");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date = new Date();
			expDate = new Date();
			joiningDate = new Date();
			tillDate = new Date();
			try {
				logger.debug("Start ExecutiveMapper mapperTODB>>>>");
				if(null != document.getBirthDay())
				date = df.parse(document.getBirthDay());
				if(null!= document.getExpirationDate())
				expDate=df.parse(document.getExpirationDate());
				if(null != document.getJoiningDate())
				joiningDate = df.parse(document.getJoiningDate());
				if(null != document.getTillDate())
				tillDate =df.parse(document.getTillDate());
			} catch (ParseException e) {
				logger.error(e.getMessage());
			}
		}
		logger.debug("Start ExecutiveMapper after date>>>>"+date);
		if(null!=pic){
			userProfile.setProfilePic(pic);
		}
		userProfile.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		userProfile.setCreatedByRole("ROLE_ADMIN");//TODO
		userProfile.setCreatedTs(new Date());
		userProfile.setDateOfBirth(date);
		userProfile.setPhone(document.getPHONE_NUMBER());
		userProfile.setEmail(document.getEMAIL_ADDRESS());
		userProfile.setPrefix(document.getPrefix());
		userProfile.setFirstName(document.getFirstName());
		userProfile.setMiddleName(document.getMiddleName());
		userProfile.setGender(document.getGender());
		userProfile.setLastName(document.getLastName());
		userProfile.setRegnDate(new Date());
		userProfile.setExtension(document.getExtension());
		userProfile.setMobile(document.getMobile());
		userProfile.setPosition(document.getPosition());
		userProfile.setReplaceBy(document.getReplaceBy());
		userProfile.setExpirationDate(expDate);
		//userProfile.setDepartmentId(departmentService.getDeptById(Integer.parseInt(document.getDepartment())));
		//Group group = new Group();
		//group.setGroupId(Integer.parseInt(document.getGroupId()));
		//userProfile.setGroupId(group);
		
		addressId.setAddressCity(document.getSHIPPING_CITY());
		addressId.setAddressLine(document.getSHIPPING_ADDRESS());
		addressId.setAddressPin(null!=document.getSHIPPING_ZIP() ? Integer.parseInt(document.getSHIPPING_ZIP()) : null);
		addressId.setAddressState(document.getSHIPPING_STATE());
		userProfile.setAddress(addressId);
		
		if(null == userProfile.getBasicDetail()){
			userProfile.setBasicDetail(new BasicDetail());
		}
		if(document.getDesignation()!=null)
		userProfile.getBasicDetail().setDesignation(document.getDesignation());
		if(joiningDate!=null)
		userProfile.getBasicDetail().setJoiningDate(joiningDate);
		if(tillDate!=null)
		userProfile.getBasicDetail().setTillDate(tillDate);
		if(document.getInterestedResearchArea()!=null)
		userProfile.getBasicDetail().setInterestedResearchArea(document.getInterestedResearchArea());
		if(document.getResearchArea()!=null)
		userProfile.getBasicDetail().setResearchArea(document.getResearchArea());
		if(document.getPatent()!=null)
		userProfile.getBasicDetail().setPatent(document.getPatent());
		if(document.getQualification()!=null)
		userProfile.getBasicDetail().setQualification(document.getQualification());
		if(document.getResearchPaper()!=null)
		userProfile.getBasicDetail().setResearchPaper(document.getResearchPaper());
		if(document.getTot()!=null)
		userProfile.getBasicDetail().setTot(document.getTot());
		if(document.getCopyright()!=null)
		userProfile.getBasicDetail().setCopyright(document.getCopyright());
		if(null ==userProfile.getManpower()){
			userProfile.setManpower(new Manpower());
		}
		return userProfile;
	}
	
	public static UserDetailVO mappingFromDB(UserProfile userProfile){
		try{
		UserDetailVO userDetailVO = new UserDetailVO();
		userDetailVO.setId(userProfile.getProfileId());
		userDetailVO.setUsername(userProfile.getUserName());
		userDetailVO.setPHONE_NUMBER(userProfile.getPhone());
		userDetailVO.setEMAIL_ADDRESS(userProfile.getEmail());
		userDetailVO.setPrefix(userProfile.getPrefix());
		userDetailVO.setFirstName(userProfile.getFirstName());
		userDetailVO.setMiddleName(userProfile.getMiddleName());
		userDetailVO.setGender(null!=userProfile.getGender()?userProfile.getGender():"");
		userDetailVO.setLastName(userProfile.getLastName());
		userDetailVO.setDepartment(null!=userProfile.getFormation().getDepartment() ? userProfile.getFormation().getDepartment().getDeptId().toString():null);
		userDetailVO.setExtension(userProfile.getExtension());
		userDetailVO.setMobile(userProfile.getMobile());
		userDetailVO.setPosition(userProfile.getPosition());
		
		return userDetailVO;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	/*public static UserProfile mapperTOUpdateDB(UserDetailVO document, byte[] bytes,Integer profileId){
		Date date = null;
		UserProfile profile = new UserProfile();
		Address addressId = new Address();
		//UserRole roleId = new UserRole();
		if(null!=document.getBirthDay()){
			logger.debug("Start ExecutiveMapper mapperTODB>>>>");
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			date = new Date();
			try {
				logger.debug("Start ExecutiveMapper mapperTODB>>>>");
				date = df.parse(document.getBirthDay());
				
			} catch (ParseException e) {
				logger.error(e.getMessage());
			}
		}
		logger.debug("Start ExecutiveMapper after date>>>>"+date);
		
		profile.setCreatedBy(SecurityUtils.getLoggedInUser().getUsername());
		profile.setCreatedByRole("ROLE_ADMIN");
		profile.setCreatedTs(new Date());
		profile.setDateOfBirth(date);
		profile.setPhone(document.getPHONE_NUMBER());
		profile.setEmail(document.getEMAIL_ADDRESS());
		profile.setFirstName(document.getFirstName());
		profile.setGender(document.getGender());
		profile.setLastName(document.getLastName());
		profile.setRegnDate(new Date());
		profile.setUserName(document.getEMAIL_ADDRESS());
		profile.setProfilePic(bytes);
		profile.setAddressId(addressId);
		addressId.setAddressCity(document.getSHIPPING_CITY());
		addressId.setAddressLine(document.getSHIPPING_ADDRESS());
		addressId.setAddressPin(Integer.parseInt(document.getSHIPPING_ZIP()));
		addressId.setAddressState(document.getSHIPPING_STATE());
		profile.setAddressId(addressId);
		return profile;
	}*/
}
