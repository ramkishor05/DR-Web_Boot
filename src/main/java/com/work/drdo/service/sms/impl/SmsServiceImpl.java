package com.work.drdo.service.sms.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.work.drdo.domain.Smsbeans;
import com.work.drdo.pool.ConnectionManager;
import com.work.drdo.sms.builder.SmsServices;
import com.work.drdo.utils.CommonUtil;

@Service
public class SmsServiceImpl {
	
	@Value("${sms.ACL.url}")
	private String smsurl;
	
	@Async("asyncExecutor")
	public void sendSms(String primaryMobileNumber, String message , Logger logger , String operator ) {		
		try {
			sendMessage(primaryMobileNumber, message , logger , operator);
		} catch (Exception e) {
			logger.debug("Sms could not sent sucessfully to user [ " + primaryMobileNumber + " ] , message [ " + message + " ] ");
		} 
	}


	private  void sendMessage(String primaryMobileNumber, String msg , Logger logger , String smsVendor) throws UnsupportedEncodingException {
		Smsbeans[] smsVendors = SmsServices.getSmsServiceInstance().getSmsBeans();
		String sRespone  = null;
		for (int i = 0; i < smsVendors.length; i++) {
			Smsbeans smsbeans = smsVendors[i];
			if (smsbeans.isActive() && smsbeans.getsVendorName().equals(smsVendor)) {
				String strurl = smsurl.replaceAll("%phNo%", primaryMobileNumber).replaceAll("%message%", URLEncoder.encode(msg , "UTF-8"));
				System.out.println(smsbeans.isActive() +"@@@@@@@@@"+ strurl);
				sRespone = ConnectionManager.getPoolingConnectionManager().sendMessage(primaryMobileNumber, msg , strurl);
				if (sRespone != null && !sRespone.isEmpty()) {
					logger.info("Sms has been send via [ " + smsbeans.getsVendorName() + " ] Sucessfully to [ " + primaryMobileNumber + " ] at [ " +  CommonUtil.getCurrentDate() + " ] , Response obtained [ " + sRespone + "  ] " );
					break;
				}
			}
		}
	}
}
