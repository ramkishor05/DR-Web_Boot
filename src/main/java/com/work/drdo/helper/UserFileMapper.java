package com.work.drdo.helper;

import java.util.Calendar;
import java.util.Random;

import com.work.drdo.domain.questionnaire.UserFileVO;
import com.work.drdo.executive.entity.UserFile;

public class UserFileMapper {
	
	public static UserFileVO mapFromDB(UserFile file){
		UserFileVO fileVO = new UserFileVO();
		fileVO.setFileId(file.getUserFileId().toString());
		fileVO.setFileNumber(file.getFileNumber());
		fileVO.setFileName(file.getFileName());
		fileVO.setFileDescription(file.getFileDescription());
		return fileVO;
	}

	public static UserFile mapToDB(UserFileVO fileVO){
		UserFile file = new UserFile();
		file.setUserFileId(null!=fileVO.getFileId() ? Integer.parseInt(fileVO.getFileId()) : null);
		 Random rand = new Random(); 
        int random = rand.nextInt(1000000); 
		Calendar calendar = Calendar.getInstance();  
		int month = calendar.get(Calendar.MONTH)+1;
		int year = calendar.get(Calendar.YEAR);
		file.setFileNumber(random+"/"+year+"/"+month);
		file.setFileName(fileVO.getFileName());
		file.setFileDescription(fileVO.getFileDescription());
		return file;
	}
}
