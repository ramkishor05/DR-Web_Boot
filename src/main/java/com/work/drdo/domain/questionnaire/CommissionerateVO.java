package com.work.drdo.domain.questionnaire;

public class CommissionerateVO {
	public Integer commissionerateId;
    public String commissionerateName;    
    public String commissionerateComment;
    public String zoneId;
    public String deptId;
    
    public Integer getCommissionerateId() {
        return commissionerateId;
    }

    public void setCommissionerateId(Integer commissionerateId) {
        this.commissionerateId = commissionerateId;
    }

    public String getCommissionerateName() {
        return commissionerateName;
    }

    public void setCommissionerateName(String commissionerateName) {
        this.commissionerateName = commissionerateName;
    }

    public String getCommissionerateComment() {
        return commissionerateComment;
    }

    public void setCommissionerateComment(String commissionerateComment) {
        this.commissionerateComment = commissionerateComment;
    }
    public String getZoneId() {
        return zoneId;
    }

    public void setZoneId(String zoneId) {
        this.zoneId = zoneId;
    }
    
    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

}
