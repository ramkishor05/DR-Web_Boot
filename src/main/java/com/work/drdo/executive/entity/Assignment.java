/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "assignment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Assignment.findAll", query = "SELECT a FROM Assignment a")
    , @NamedQuery(name = "Assignment.findByAssignmentId", query = "SELECT a FROM Assignment a WHERE a.assignmentId = :assignmentId")
    , @NamedQuery(name = "Assignment.findByTimestamp", query = "SELECT a FROM Assignment a WHERE a.timestamp = :timestamp")
    , @NamedQuery(name = "Assignment.findByDiaryId", query = "SELECT a FROM Assignment a WHERE a.diaryId = :diaryId")
	, @NamedQuery(name = "Assignment.findByAssignId", query = "SELECT a FROM Assignment a WHERE a.assignTo.profileId = :profileId AND a.columnActive = :columnActive")})
public class Assignment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "assignment_id")
    private Integer assignmentId;
    @Column(name = "timestamp")
    @Temporal(TemporalType.DATE)
    private Date timestamp;
    @JoinColumn(name = "diary_id", referencedColumnName = "diary_id")
    @ManyToOne
    private UserDiary diaryId;
    @JoinColumn(name = "assign_to", referencedColumnName = "profileId")
    @ManyToOne
    private UserProfile assignTo;
    @JoinColumn(name = "assign_from", referencedColumnName = "profileId")
    @ManyToOne
    private UserProfile assignFrom;
    @Size(max = 1)
    @Column(name = "approval_status")
    private String approvalStatus;
    @Size(max = 200)
    @Column(name = "approver_comment")
    private String approverComment;
    @Size(max = 1)
    @Column(name = "column_active")
    private String columnActive;
    
    @OneToOne
    @JoinColumn(name = "prevAssignment_id")
    private Assignment prevAssignment;
    
    @OneToOne
    @JoinColumn(name = "nextAssignment_id")
    private Assignment nextAssignment;
    
    
    public Assignment() {
    }

    public Assignment(Integer assignmentId) {
        this.assignmentId = assignmentId;
    }

    public Integer getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(Integer assignmentId) {
        this.assignmentId = assignmentId;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public UserDiary getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(UserDiary diaryId) {
		this.diaryId = diaryId;
	}

	public UserProfile getAssignTo() {
        return assignTo;
    }

    public void setAssignTo(UserProfile assignTo) {
        this.assignTo = assignTo;
    }

    public UserProfile getAssignFrom() {
        return assignFrom;
    }

    public void setAssignFrom(UserProfile assignFrom) {
        this.assignFrom = assignFrom;
    }

    public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getApproverComment() {
		return approverComment;
	}

	public void setApproverComment(String approverComment) {
		this.approverComment = approverComment;
	}

	public String getColumnActive() {
		return columnActive;
	}

	public void setColumnActive(String columnActive) {
		this.columnActive = columnActive;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (assignmentId != null ? assignmentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Assignment)) {
            return false;
        }
        Assignment other = (Assignment) object;
        if ((this.assignmentId == null && other.assignmentId != null) || (this.assignmentId != null && !this.assignmentId.equals(other.assignmentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Assignment[ assignmentId=" + assignmentId + " ]";
    }
    
}
