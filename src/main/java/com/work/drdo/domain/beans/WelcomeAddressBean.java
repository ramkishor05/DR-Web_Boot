package com.work.drdo.domain.beans;

public class WelcomeAddressBean {
	private Integer addressId;
	private String addressLine;
	private String addressCity;
	private String addressState;
	private Integer addressPin;

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddressLine() {
		return addressLine;
	}

	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public String getAddressState() {
		return addressState;
	}

	public void setAddressState(String addressState) {
		this.addressState = addressState;
	}

	public Integer getAddressPin() {
		return addressPin;
	}

	public void setAddressPin(Integer addressPin) {
		this.addressPin = addressPin;
	}

}
