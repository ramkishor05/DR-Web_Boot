package com.work.drdo.domain.questionnaire;

import java.util.List;

import org.apache.commons.lang.StringUtils;

public class UserDetailVO {
	private int id;
	private String prefix;
	private String firstName;
	private String middleName;
	private String username;
	private String lastName;
	private String birthDay;
	private String gender;
	private String password;
	private String confirmPassword;
	private String role;
	private String PHONE_NUMBER;
	private String EMAIL_ADDRESS;
	private String SHIPPING_ADDRESS;
	private String SHIPPING_CITY;
	private String SHIPPING_STATE;
	private String SHIPPING_ZIP;
	private String enrolledOn;
	private byte[] executivePic;
	private String pic;
	private Integer addressId;
	private String expirationDate;
	private String replaceBy;
	private String position;
	private String phoneNumber;
	private String extension;
	private String mobile;
	private String groupId;
	private String designation;
	private String joiningDate;
	private String tillDate;
	private String researchArea;
	private String interestedResearchArea;
	private String qualification;
	private String researchPaper;
	private String patent;
	private String tot;
	private String copyright;
	private String department;
	private String divisionId;

	private ManPowerVo manpowerDetail;
	private ProjectVo userProject;

	private List<UserAwardVO> awards;

	private UserDesignationVO userDesignation;

	public UserDesignationVO getUserDesignation() {
		return userDesignation;
	}

	public void setUserDesignation(UserDesignationVO userDesignation) {
		this.userDesignation = userDesignation;
	}

	public void setUserProject(ProjectVo userProject) {
		this.userProject = userProject;
	}

	public ProjectVo getUserProject() {
		return userProject;
	}

	/**
	 * @return the file
	 */
	public String getPic() {
		return pic;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName
	 *            the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the birthDay
	 */
	public String getBirthDay() {
		return birthDay;
	}

	/**
	 * @param birthDay
	 *            the birthDay to set
	 */
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender
	 *            the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the PHONE_NUMBER
	 */
	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	/**
	 * @param PHONE_NUMBER
	 *            the PHONE_NUMBER to set
	 */
	public void setPHONE_NUMBER(String PHONE_NUMBER) {
		this.PHONE_NUMBER = PHONE_NUMBER;
	}

	/**
	 * @return the EMAIL_ADDRESS
	 */
	public String getEMAIL_ADDRESS() {
		return EMAIL_ADDRESS;
	}

	/**
	 * @param EMAIL_ADDRESS
	 *            the EMAIL_ADDRESS to set
	 */
	public void setEMAIL_ADDRESS(String EMAIL_ADDRESS) {
		this.EMAIL_ADDRESS = EMAIL_ADDRESS;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the SHIPPING_ADDRESS
	 */
	public String getSHIPPING_ADDRESS() {
		return SHIPPING_ADDRESS;
	}

	/**
	 * @param SHIPPING_ADDRESS
	 *            the SHIPPING_ADDRESS to set
	 */
	public void setSHIPPING_ADDRESS(String SHIPPING_ADDRESS) {
		this.SHIPPING_ADDRESS = SHIPPING_ADDRESS;
	}

	/**
	 * @return the SHIPPING_CITY
	 */
	public String getSHIPPING_CITY() {
		return SHIPPING_CITY;
	}

	/**
	 * @param SHIPPING_CITY
	 *            the SHIPPING_CITY to set
	 */
	public void setSHIPPING_CITY(String SHIPPING_CITY) {
		this.SHIPPING_CITY = SHIPPING_CITY;
	}

	/**
	 * @return the SHIPPING_STATE
	 */
	public String getSHIPPING_STATE() {
		return SHIPPING_STATE;
	}

	/**
	 * @param SHIPPING_STATE
	 *            the SHIPPING_STATE to set
	 */
	public void setSHIPPING_STATE(String SHIPPING_STATE) {
		this.SHIPPING_STATE = SHIPPING_STATE;
	}

	/**
	 * @return the SHIPPING_ZIP
	 */
	public String getSHIPPING_ZIP() {
		return SHIPPING_ZIP;
	}

	/**
	 * @param SHIPPING_ZIP
	 *            the SHIPPING_ZIP to set
	 */
	public void setSHIPPING_ZIP(String SHIPPING_ZIP) {
		this.SHIPPING_ZIP = SHIPPING_ZIP;
	}

	/**
	 * @return the enrolledOn
	 */
	public String getEnrolledOn() {
		return enrolledOn;
	}

	/**
	 * @param enrolledOn
	 *            the enrolledOn to set
	 */
	public void setEnrolledOn(String enrolledOn) {
		this.enrolledOn = enrolledOn;
	}

	/**
	 * @return the executivePic
	 */
	public byte[] getExecutivePic() {
		return executivePic;
	}

	/**
	 * @param executivePic
	 *            the executivePic to set
	 */
	public void setExecutivePic(byte[] executivePic) {
		this.executivePic = executivePic;
	}

	/**
	 * @param file
	 *            the file to set
	 */

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the confirmPassword
	 */
	public String getConfirmPassword() {
		return confirmPassword;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param zone
	 *            the zone to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getReplaceBy() {
		return replaceBy;
	}

	public void setReplaceBy(String replaceBy) {
		this.replaceBy = replaceBy;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getTillDate() {
		return tillDate;
	}

	public void setTillDate(String tillDate) {
		this.tillDate = tillDate;
	}

	public String getResearchArea() {
		return researchArea;
	}

	public void setResearchArea(String researchArea) {
		this.researchArea = researchArea;
	}

	public String getInterestedResearchArea() {
		return interestedResearchArea;
	}

	public void setInterestedResearchArea(String interestedResearchArea) {
		this.interestedResearchArea = interestedResearchArea;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getResearchPaper() {
		return researchPaper;
	}

	public void setResearchPaper(String researchPaper) {
		this.researchPaper = researchPaper;
	}

	public String getPatent() {
		return patent;
	}

	public void setPatent(String patent) {
		this.patent = patent;
	}

	public String getTot() {
		return tot;
	}

	public void setTot(String tot) {
		this.tot = tot;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDivisionId() {
		return divisionId;
	}

	public void setDivisionId(String divisionId) {
		this.divisionId = divisionId;
	}

	public ManPowerVo getManpowerDetail() {
		return manpowerDetail;
	}

	public void setManpowerDetail(ManPowerVo manpowerDetail) {
		this.manpowerDetail = manpowerDetail;
	}

	public List<UserAwardVO> getAwards() {
		return awards;
	}

	public void setAwards(List<UserAwardVO> awards) {
		this.awards = awards;
	}

	public AddressVO getAddress() {
		AddressVO address = new AddressVO();
		address.setAddressId(this.getAddressId());
		if (StringUtils.isNotEmpty(this.getSHIPPING_CITY())) {
			address.setSHIPPING_CITY(this.getSHIPPING_CITY());
		}
		if (StringUtils.isNotEmpty(this.getSHIPPING_ADDRESS())) {
			address.setSHIPPING_ADDRESS(this.getSHIPPING_ADDRESS());
		}
		if (StringUtils.isNotEmpty(this.getSHIPPING_ZIP())) {
			address.setSHIPPING_ZIP(this.getSHIPPING_ZIP());
		}
		if (StringUtils.isNotEmpty(this.getSHIPPING_STATE())) {
			address.setSHIPPING_STATE(this.getSHIPPING_STATE());
		}
		return address;
	}
	
	public BasicDetailsVO getBasicDetail() {
		BasicDetailsVO basicDetail = new BasicDetailsVO();
		if (StringUtils.isNotEmpty(this.getDesignation()))
			basicDetail.setDesignation(this.getDesignation());
		if (StringUtils.isNotEmpty(this.getJoiningDate()))
			basicDetail.setJoiningDate(this.getJoiningDate());
		if (StringUtils.isNotEmpty(this.getTillDate()))
			basicDetail.setTillDate(this.getTillDate());
		if (StringUtils.isNotEmpty(this.getInterestedResearchArea())){
			basicDetail.setInterestedResearchArea(this.getInterestedResearchArea());
		}
		if (StringUtils.isNotEmpty(this.getResearchArea())){
			basicDetail.setResearchArea(this.getResearchArea());
		}
		if (StringUtils.isNotEmpty(this.getPatent())){
			basicDetail.setPatent(this.getPatent());
		}
		if (StringUtils.isNotEmpty(this.getQualification())){
			basicDetail.setQualification(this.getQualification());
		}
		if (StringUtils.isNotEmpty(this.getResearchPaper())){
			basicDetail.setResearchPaper(this.getResearchPaper());
		}
		if (StringUtils.isNotEmpty(this.getTot())){
			basicDetail.setTot(this.getTot());
		}
		if (StringUtils.isNotEmpty(this.getCopyright())){
			basicDetail.setCopyright(this.getCopyright());
		}
		return basicDetail;
	}
	
	public FormationVO getFormation() {
		FormationVO formation = new FormationVO();
		if (StringUtils.isNotEmpty(this.getDepartment())) {
			formation.setDepartment(this.getDepartment());
		}
		if (StringUtils.isNotEmpty(this.getDivisionId())) {
			formation.setDivisionId(this.getDivisionId());
		}
		if (StringUtils.isNotEmpty(this.getGroupId())) {
			formation.setGroupId(this.getGroupId());
		}
		return formation;
	}
}
