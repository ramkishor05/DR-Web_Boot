package com.work.drdo.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.work.drdo.executive.entity.Attachment;

public class Utility {
	
	public static final String STR_YES_SHORT = "Y";
	private static final String STR_YES = "YES";
	private static final String STR_TRUE = "TRUE";
	public static final String STR_NO_SHORT = "N";

	public String getMMDDYYYY(String dob){
		
		return "";
	}
	
	public static boolean asBoolean(Character value){
		boolean bool = false;
		String _value = Character.toString(value);
		if(null != _value && (STR_YES_SHORT.equalsIgnoreCase(_value) || STR_YES.equalsIgnoreCase(Character.toString(value)) 
								|| STR_TRUE.equalsIgnoreCase(_value))){
			bool = true;
		}
		return bool;
	}
	
	public static boolean asBoolean(Boolean value){
		if(null==value){
			return false;
		}
		return value.booleanValue();
	}
	
	public static String boolAsYN(Boolean value, boolean isNullable){
		if(isNullable){
			return (null == value) ? null : boolAsYN(value.booleanValue());
		}else{
			return (null == value) ? "N" : boolAsYN(value.booleanValue());
		}
	}
	public static String boolAsYN(boolean value){
		return value ? "Y" : "N";
	}
	public static UUID generateToken(){
		return UUID.randomUUID();
	}
	
	public static void saveFileToLocation(String documentPath, MultipartFile multipartFile, Attachment document){
		try{
			String path ="";
			path = documentPath+document.getDiaryId().getDiaryId();
		
			File file = new File(path);
	        if (!file.exists()) {
	            file.mkdir();
	        }
			String pathname=path+"/"+document.getFileName();
			FileOutputStream fos = new FileOutputStream(pathname);
		    fos.write(multipartFile.getBytes());
		    fos.close();
		    document.setContentPath(path);
	    }catch(Exception ex){
	    	ex.printStackTrace();
	    }
		
	}
	
	public static void deleteFileFromLocation(String documentPath,Attachment attachment){
		Integer id = attachment.getDiaryId().getDiaryId();
		String fileName = attachment.getFileName();
		try{
			File file = new File(documentPath+id+"/"+fileName);
			file.delete();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
}
