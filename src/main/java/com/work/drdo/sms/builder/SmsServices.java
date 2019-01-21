package com.work.drdo.sms.builder;

import com.work.drdo.domain.Smsbeans;

public class SmsServices {
	
	private SmsServices() {}
	private Smsbeans[] smsBeans = null;
	private static SmsServices getSmsServiceinstance = null;
	
	public static synchronized SmsServices getSmsServiceInstance() {
		if (getSmsServiceinstance == null) {
			getSmsServiceinstance = new SmsServices();
		}
		return getSmsServiceinstance;
	}

	public void buildSmsServices(final String smsvendors) {
		String [] str = smsvendors.split(",");
		smsBeans = new Smsbeans[str.length];		
		for (int i = 0; i < str.length; i++) {
			
			String strUrl = "sms." + str[i].trim() + ".url" ;
			smsBeans[i] = new Smsbeans(true, strUrl , str[i].trim());
		}
	}
	
	public Smsbeans[] getSmsBeans() {
		return smsBeans;
	}
}
