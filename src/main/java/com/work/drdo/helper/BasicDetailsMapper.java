package com.work.drdo.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.work.drdo.domain.questionnaire.BasicDetailsVO;
import com.work.drdo.executive.entity.BasicDetail;
import com.work.drdo.utils.SecurityUtils;

public class BasicDetailsMapper {

	private static final Logger logger = LoggerFactory.getLogger(UserDetailMapper.class);

    public static BasicDetail mapToDB(BasicDetailsVO basicDetailsVO) {
    	Date joiningDate = null;
		Date tillDate = null;
		joiningDate = new Date();
		tillDate = new Date();
		try {
			logger.debug("Start ExecutiveMapper mapperTODB>>>>");
			//tillDate=df.parse(basicDetailsVO.getTillDate());
			//joiningDate = df.parse(basicDetailsVO.getJoiningDate());
			
		} catch (Exception e) {
			//logger.error(e.getMessage());
			e.printStackTrace();
		}
    	try{
    	BasicDetail basicDetail = new BasicDetail();
    	basicDetail.setDesignation(basicDetailsVO.getDesignation());
    	basicDetail.setResearchArea(basicDetailsVO.getResearchArea());
    	basicDetail.setInterestedResearchArea(basicDetailsVO.getInterestedResearchArea());
    	basicDetail.setJoiningDate(joiningDate);
    	basicDetail.setTillDate(tillDate);
    	basicDetail.setPatent(basicDetailsVO.getPatent());
    	basicDetail.setResearchPaper(basicDetailsVO.getResearchPaper());
    	basicDetail.setQualification(basicDetailsVO.getQualification());
    	return basicDetail;
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}
    	return null;
    }

    public static BasicDetailsVO mapFromDB(BasicDetail basicDetail) {
    	Date joiningDate = null;
		Date tillDate = null;
		DateFormat df = new SimpleDateFormat("MM/DD/YYYY"); //yyyy-mm-dd
		joiningDate = new Date();
		tillDate = new Date();
		try {
			logger.debug("Start ExecutiveMapper mapperTODB>>>>");
			if(null != basicDetail.getJoiningDate())
			joiningDate = df.parse((basicDetail.getJoiningDate()).toString());
			if(null != basicDetail.getTillDate())
			tillDate=df.parse((basicDetail.getTillDate()).toString());
			
		} catch (ParseException e) {
			logger.error(e.getMessage());
		}
    	BasicDetailsVO basicDetailsVO = new BasicDetailsVO();
    	basicDetailsVO.setDesignation(basicDetail.getDesignation());
    	basicDetailsVO.setResearchArea(basicDetail.getResearchArea());
    	basicDetailsVO.setInterestedResearchArea(basicDetail.getInterestedResearchArea());
    	basicDetailsVO.setJoiningDate(joiningDate.toString());
    	basicDetailsVO.setTillDate(tillDate.toString());
    	basicDetailsVO.setPatent(basicDetail.getPatent());
    	basicDetailsVO.setResearchPaper(basicDetail.getResearchPaper());
    	basicDetailsVO.setQualification(basicDetail.getQualification());
    	
    	basicDetailsVO.setFirstName(SecurityUtils.getUserProfile().getFirstName());
    	basicDetailsVO.setLastName(SecurityUtils.getUserProfile().getLastName());
    	basicDetailsVO.setMiddleName(SecurityUtils.getUserProfile().getMiddleName());
    	basicDetailsVO.setEMAIL_ADDRESS(SecurityUtils.getUserProfile().getEmail());
    	basicDetailsVO.setMobile(SecurityUtils.getUserProfile().getMobile());
    	return basicDetailsVO;
    }
}
