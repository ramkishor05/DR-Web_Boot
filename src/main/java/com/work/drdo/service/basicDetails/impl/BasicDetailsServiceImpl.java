package com.work.drdo.service.basicDetails.impl;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AddressDAO;
import com.work.drdo.dao.BasicDetailsDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.BasicDetailsVO;
import com.work.drdo.executive.entity.Address;
import com.work.drdo.executive.entity.BasicDetail;
import com.work.drdo.helper.BasicDetailsMapper;
import com.work.drdo.service.basicDetails.BasicDetailService;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.login.impl.RegistrationServiceImpl;
import com.work.drdo.utils.SecurityUtils;

@Service
@Transactional(propagation=Propagation.REQUIRED)
public class BasicDetailsServiceImpl implements BasicDetailService {
	@Autowired
	BasicDetailsDAO basicDetailsDAO;
	@Autowired
	private UserProfileDAO profileDAO;
	@Autowired
	AddressDAO addressDAO;
	@Autowired
	DepartmentService departmentService;
	
	Logger logger = Logger.getLogger(RegistrationServiceImpl.class);
	
	@Override
	public BasicDetailsVO getBasicDetailsById(Integer basicDetailId) {
		logger.debug("Start getBasicDetails");
		BasicDetail basicDetail = basicDetailsDAO.getReference(basicDetailId);
		BasicDetailsVO basicDetailsVO = BasicDetailsMapper.mapFromDB(basicDetail);
		 return basicDetailsVO;
	}
	@Override
	public void updateBasicDetails(BasicDetailsVO basicDetailsVO) {
		try {
			logger.debug("Start Basic Detail Updation");
			com.work.drdo.executive.entity.UserProfile userProfile = profileDAO.getReference(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId());
			com.work.drdo.executive.entity.BasicDetail basicDetail = BasicDetailsMapper.mapToDB(basicDetailsVO);
			Address address = userProfile.getAddress();
			address.setAddressLine(basicDetailsVO.getSHIPPING_ADDRESS());
			address.setAddressCity(basicDetailsVO.getSHIPPING_CITY());
			address.setAddressState(basicDetailsVO.getSHIPPING_STATE());
			address.setAddressPin(Integer.parseInt(basicDetailsVO.getSHIPPING_ZIP()));
			addressDAO.merge(address);
			
			Date date = null;
			if(null!=basicDetailsVO.getBirthDay()){
			}
			userProfile.setDateOfBirth(date);
			userProfile.setPhone(basicDetailsVO.getPHONE_NUMBER());
			userProfile.setEmail(basicDetailsVO.getEMAIL_ADDRESS());
			userProfile.setPrefix(basicDetailsVO.getPrefix());
			userProfile.setFirstName(basicDetailsVO.getFirstName());
			userProfile.setMiddleName(basicDetailsVO.getMiddleName());
			userProfile.setGender(basicDetailsVO.getGender());
			userProfile.setLastName(basicDetailsVO.getLastName());
			userProfile.setExtension(basicDetailsVO.getExtension());
			userProfile.setMobile(basicDetailsVO.getMobile());
			if(userProfile.getBasicDetail()!=null){
				basicDetail.setBasicDetailId(userProfile.getBasicDetail().getBasicDetailId());
			}
			basicDetailsDAO.saveProfile(basicDetail);
			userProfile.setBasicDetail(basicDetail);
			//userProfile.setDepartmentId(departmentService.getDeptById(Integer.parseInt(basicDetailsVO.getDepartment())));
			profileDAO.saveProfile(userProfile);
		} catch (Exception ex) {
			ex.printStackTrace();
		}		
	}

}
