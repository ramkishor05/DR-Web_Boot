/*
                               * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.util.Collection;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "attachment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Attachment.findAll", query = "SELECT a FROM Attachment a")
    , @NamedQuery(name = "Attachment.findByAttachmentId", query = "SELECT a FROM Attachment a WHERE a.attachmentId = :attachmentId")
    , @NamedQuery(name = "Attachment.findByFileName", query = "SELECT a FROM Attachment a WHERE a.fileName = :fileName")
    , @NamedQuery(name = "Attachment.findByDescription", query = "SELECT a FROM Attachment a WHERE a.description = :description")
    , @NamedQuery(name = "Attachment.findByFileId", query = "SELECT a FROM Attachment a WHERE a.fileId = :fileId")
    , @NamedQuery(name = "Attachment.findByContentPath", query = "SELECT a FROM Attachment a WHERE a.contentPath = :contentPath")
    , @NamedQuery(name = "Attachment.findByDiaryId", query = "SELECT a FROM Attachment a WHERE a.diaryId = :diaryId")})
public class Attachment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "attachment_id")
    private Integer attachmentId;
    @Size(max = 45)
    @Column(name = "file_name")
    private String fileName;
    @Size(max = 100)
    @Column(name = "type")
    private String type;
    @Size(max = 145)
    @Column(name = "description")
    private String description;
    /*@Column(name = "file_id")
    private Integer fileId;*/
    @Size(max = 45)
    @Column(name = "content_path")
    private String contentPath;
    @JoinColumn(name = "diary_id", referencedColumnName = "diary_id")
    @ManyToOne
    private UserDiary diaryId;
    @JoinColumn(name = "file_id", referencedColumnName = "user_file_id")
    @ManyToOne
    private UserFile fileId;
    @OneToMany(mappedBy = "attachmentId")
    private Collection<UserDiary> userDiaryCollection;

    public Attachment() {
    }

    public Attachment(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }

    public Integer getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

   /* public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }*/

    public String getContentPath() {
        return contentPath;
    }

    public void setContentPath(String contentPath) {
        this.contentPath = contentPath;
    }

   /* public Integer getDiaryId() {
        return diaryId;
    }

    public void setDiaryId(Integer diaryId) {
        this.diaryId = diaryId;
    }*/
    
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public UserDiary getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(UserDiary diaryId) {
		this.diaryId = diaryId;
	}

	public UserFile getFileId() {
		return fileId;
	}

	public void setFileId(UserFile fileId) {
		this.fileId = fileId;
	}
    
    @XmlTransient
    public Collection<UserDiary> getUserDiaryCollection() {
        return userDiaryCollection;
    }

    public void setUserDiaryCollection(Collection<UserDiary> userDiaryCollection) {
        this.userDiaryCollection = userDiaryCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (attachmentId != null ? attachmentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Attachment)) {
            return false;
        }
        Attachment other = (Attachment) object;
        if ((this.attachmentId == null && other.attachmentId != null) || (this.attachmentId != null && !this.attachmentId.equals(other.attachmentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Attachment[ attachmentId=" + attachmentId + " ]";
    }
    
}
