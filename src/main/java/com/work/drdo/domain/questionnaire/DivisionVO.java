package com.work.drdo.domain.questionnaire;

public class DivisionVO {
	public Integer divisionId;
	public String divisionName;
	public String divisionComment;

	public Integer getDivisionId() {
        return divisionId;
    }

    public void setDivisionId(Integer divisionId) {
        this.divisionId = divisionId;
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }

    public String getDivisionComment() {
        return divisionComment;
    }

    public void setDivisionComment(String divisionComment) {
        this.divisionComment = divisionComment;
    }
}
