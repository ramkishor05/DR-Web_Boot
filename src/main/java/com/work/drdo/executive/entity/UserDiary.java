/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "user_diary")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserDiary.findAll", query = "SELECT u FROM UserDiary u")
    , @NamedQuery(name = "UserDiary.findByDiaryId", query = "SELECT u FROM UserDiary u WHERE u.diaryId = :diaryId")
    , @NamedQuery(name = "UserDiary.findByDiaryType", query = "SELECT u FROM UserDiary u WHERE u.diaryType = :diaryType")
    , @NamedQuery(name = "UserDiary.findByDiaryStatus", query = "SELECT u FROM UserDiary u WHERE u.diaryStatus = :diaryStatus")
    , @NamedQuery(name = "UserDiary.findByTimestamp", query = "SELECT u FROM UserDiary u WHERE u.timestamp = :timestamp")
    , @NamedQuery(name = "UserDiary.findByApprovalStatus", query = "SELECT u FROM UserDiary u WHERE u.approvalStatus = :approvalStatus")
    , @NamedQuery(name = "UserDiary.findByApprovalComment", query = "SELECT u FROM UserDiary u WHERE u.approvalComment = :approvalComment")
    , @NamedQuery(name = "UserDiary.findByClouserComment", query = "SELECT u FROM UserDiary u WHERE u.clouserComment = :clouserComment")
    , @NamedQuery(name = "UserDiary.findByDiaryNo", query = "SELECT u FROM UserDiary u WHERE u.diaryNo = :diaryNo")})
public class UserDiary implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "diary_id")
    private Integer diaryId;
    @Size(max = 145)
    @Column(name = "diary_type")
    private String diaryType;
    @Size(max = 45)
    @Column(name = "diary_status")
    private String diaryStatus;
    
    @Size(max = 45)
    @Column(name = "status")
    private String status;
    
    @Column(name = "timestamp")
    @Temporal(TemporalType.DATE)
    private Date timestamp;
    @Size(max = 145)
    @Column(name = "approval_status")
    private String approvalStatus;
    @Size(max = 145)
    @Column(name = "approval_comment")
    private String approvalComment;
    @Size(max = 145)
    @Column(name = "clouser_comment")
    private String clouserComment;
    @Size(max = 145)
    @Column(name = "diary_no")
    private String diaryNo;
    @OneToMany(mappedBy = "recipentFor")
    private Collection<Recipent> recipentCollection;
    @JoinColumn(name = "file_number", referencedColumnName = "user_file_id")
    @ManyToOne
    private UserFile fileNumber;
    @JoinColumn(name = "sender_id", referencedColumnName = "profileId")
    @ManyToOne
    private UserProfile senderId;
    @JoinColumn(name = "attachment_id", referencedColumnName = "attachment_id")
    @ManyToOne
    private Attachment attachmentId;
    @JoinColumn(name = "approval_by", referencedColumnName = "profileId")
    @ManyToOne
    private UserProfile approvalBy;
    @JoinColumn(name = "created_by", referencedColumnName = "profileId")
    @ManyToOne
    private UserProfile createdBy;
    @OneToMany(mappedBy = "diaryId")
    private Collection<Assignment> assignmentCollection;
    @OneToMany(mappedBy = "diaryId")
    private Collection<Attachment> attachmentCollection;
    
    public UserDiary() {
    }

    public UserDiary(Integer diaryId) {
        this.diaryId = diaryId;
    }

    public Integer getDiaryId() {
        return diaryId;
    }

    public void setDiaryId(Integer diaryId) {
        this.diaryId = diaryId;
    }

    public String getDiaryType() {
        return diaryType;
    }

    public void setDiaryType(String diaryType) {
        this.diaryType = diaryType;
    }

    public String getDiaryStatus() {
        return diaryStatus;
    }

    public void setDiaryStatus(String diaryStatus) {
        this.diaryStatus = diaryStatus;
    }

    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Collection<Attachment> getAttachmentCollection() {
		return attachmentCollection;
	}

	public void setAttachmentCollection(Collection<Attachment> attachmentCollection) {
		this.attachmentCollection = attachmentCollection;
	}

	public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getApprovalComment() {
        return approvalComment;
    }

    public void setApprovalComment(String approvalComment) {
        this.approvalComment = approvalComment;
    }

    public String getClouserComment() {
        return clouserComment;
    }

    public void setClouserComment(String clouserComment) {
        this.clouserComment = clouserComment;
    }

    public String getDiaryNo() {
        return diaryNo;
    }

    public void setDiaryNo(String diaryNo) {
        this.diaryNo = diaryNo;
    }

    @XmlTransient
    public Collection<Recipent> getRecipentCollection() {
        return recipentCollection;
    }

    public void setRecipentCollection(Collection<Recipent> recipentCollection) {
        this.recipentCollection = recipentCollection;
    }

    public UserFile getFileNumber() {
        return fileNumber;
    }

    public void setFileNumber(UserFile fileNumber) {
        this.fileNumber = fileNumber;
    }

    public UserProfile getSenderId() {
        return senderId;
    }

    public void setSenderId(UserProfile senderId) {
        this.senderId = senderId;
    }

    public Attachment getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Attachment attachmentId) {
        this.attachmentId = attachmentId;
    }

    public UserProfile getApprovalBy() {
        return approvalBy;
    }

    public void setApprovalBy(UserProfile approvalBy) {
        this.approvalBy = approvalBy;
    }

    public UserProfile getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(UserProfile createdBy) {
        this.createdBy = createdBy;
    }
    
    @XmlTransient
    public Collection<Assignment> getAssignmentCollection() {
		return assignmentCollection;
	}

	public void setAssignmentCollection(Collection<Assignment> assignmentCollection) {
		this.assignmentCollection = assignmentCollection;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (diaryId != null ? diaryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserDiary)) {
            return false;
        }
        UserDiary other = (UserDiary) object;
        if ((this.diaryId == null && other.diaryId != null) || (this.diaryId != null && !this.diaryId.equals(other.diaryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.UserDiary[ diaryId=" + diaryId + " ]";
    }
    
}
