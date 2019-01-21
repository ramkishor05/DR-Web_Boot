package com.work.drdo.domain.questionnaire;

public class AddressVO {
	private Integer addressId;
	
	private String EMAIL_ADDRESS;
	private String PHONE_NUMBER;
	private String extension;
	private String mobile;
	private String department;
	private String SHIPPING_ADDRESS;
	private String SHIPPING_CITY;
	private String SHIPPING_STATE;
	private String SHIPPING_ZIP;
	
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public String getEMAIL_ADDRESS() {
		return EMAIL_ADDRESS;
	}

	public void setEMAIL_ADDRESS(String eMAIL_ADDRESS) {
		EMAIL_ADDRESS = eMAIL_ADDRESS;
	}

	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSHIPPING_ADDRESS() {
		return SHIPPING_ADDRESS;
	}

	public void setSHIPPING_ADDRESS(String sHIPPING_ADDRESS) {
		SHIPPING_ADDRESS = sHIPPING_ADDRESS;
	}

	public String getSHIPPING_CITY() {
		return SHIPPING_CITY;
	}

	public void setSHIPPING_CITY(String sHIPPING_CITY) {
		SHIPPING_CITY = sHIPPING_CITY;
	}

	public String getSHIPPING_STATE() {
		return SHIPPING_STATE;
	}

	public void setSHIPPING_STATE(String sHIPPING_STATE) {
		SHIPPING_STATE = sHIPPING_STATE;
	}

	public String getSHIPPING_ZIP() {
		return SHIPPING_ZIP;
	}

	public void setSHIPPING_ZIP(String sHIPPING_ZIP) {
		SHIPPING_ZIP = sHIPPING_ZIP;
	}
	
	
}
