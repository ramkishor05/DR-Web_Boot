package com.work.drdo.domain;

import java.util.Date;

/**
 *
 * @author Aman
 */

public class BasicDetail{

   
    private Integer basicDetailId;
    private String designation;
    private Date joiningDate;
    private Date tillDate;
    private String researchArea;
    private String interestedResearchArea;
    private String qualification;
    private String researchPaper;
    private String patent;
    private String tot;
    private String copyright;
    private UserProfile userProfileId;


    public Integer getBasicDetailId() {
        return basicDetailId;
    }

    public void setBasicDetailId(Integer basicDetailId) {
        this.basicDetailId = basicDetailId;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    public Date getTillDate() {
        return tillDate;
    }

    public void setTillDate(Date tillDate) {
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

    public UserProfile getUserProfileId() {
        return userProfileId;
    }

    public void setUserProfileId(UserProfile userProfileId) {
        this.userProfileId = userProfileId;
    }

}
