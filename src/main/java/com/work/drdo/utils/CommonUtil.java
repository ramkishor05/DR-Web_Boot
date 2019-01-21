package com.work.drdo.utils;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringUtils;





public final class CommonUtil {	
	
	
	private CommonUtil() {		
	}
	
	public static String generatePasscode() {
		List<Integer> numbers = new ArrayList<Integer>();
		for (int i = 0; i < 10; i++) {
			numbers.add(i);
		}
		Collections.shuffle(numbers);
		String passcode = "";
		for (int i = 0; i < 4; i++) {
			passcode += numbers.get(i).toString();
		}
		return passcode;
	}
	
	public static String getCurrentDate() {
		 final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(Calendar.getInstance().getTime());
	}

	
	
	public static String defaultIfNull(String str , String def) {
		return StringUtils.defaultIfEmpty(str, def);
	}
	

	
}