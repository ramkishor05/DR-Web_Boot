package com.work.drdo.domain;

public class Smsbeans {
	
	private boolean isActive = false;
	private String strurl = null;
	private String sVendorName = null;
	
	public Smsbeans(boolean isActive , String strUrl , String sVendorName) {
		this.isActive = isActive;
		this.strurl = strUrl;
		this.sVendorName = sVendorName;
	}
	
	public boolean isActive() {
		return isActive;
	}

	public String getStrurl() {
		return strurl;
	}

	public String getsVendorName() {
		return sVendorName;
	}

	@Override
	public String toString() {
		return String.format("Smsbeans [ isActive=%s, strurl=%s , vendorName = %s ] ", isActive, strurl , sVendorName);
	}	
}
