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
@Table(name = "user_file")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserFile.findAll", query = "SELECT u FROM UserFile u")
    , @NamedQuery(name = "UserFile.findByUserFileId", query = "SELECT u FROM UserFile u WHERE u.userFileId = :userFileId")
    , @NamedQuery(name = "UserFile.findByFileNumber", query = "SELECT u FROM UserFile u WHERE u.fileNumber = :fileNumber")
    , @NamedQuery(name = "UserFile.findByFileDescription", query = "SELECT u FROM UserFile u WHERE u.fileDescription = :fileDescription")
    , @NamedQuery(name = "UserFile.findByFileName", query = "SELECT u FROM UserFile u WHERE u.fileName = :fileName")})
public class UserFile implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_file_id")
    private Integer userFileId;
    @Size(max = 45)
    @Column(name = "file_number")
    private String fileNumber;
    @Size(max = 145)
    @Column(name = "file_description")
    private String fileDescription;
    @Size(max = 145)
    @Column(name = "file_name")
    private String fileName;
    
    @OneToMany(mappedBy = "file")
    private Collection<UserDiary> userDiarys;
    
    @OneToMany(mappedBy = "file")
    private Collection<Attachment> attachments;

    public UserFile() {
    }

    public UserFile(Integer userFileId) {
        this.userFileId = userFileId;
    }

    public Integer getUserFileId() {
        return userFileId;
    }

    public void setUserFileId(Integer userFileId) {
        this.userFileId = userFileId;
    }

    public String getFileNumber() {
        return fileNumber;
    }

    public void setFileNumber(String fileNumber) {
        this.fileNumber = fileNumber;
    }

    public String getFileDescription() {
        return fileDescription;
    }

    public void setFileDescription(String fileDescription) {
        this.fileDescription = fileDescription;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @XmlTransient
    public Collection<UserDiary> getUserDiarys() {
        return userDiarys;
    }

    public void setUserDiarys(Collection<UserDiary> userDiarys) {
        this.userDiarys = userDiarys;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userFileId != null ? userFileId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof UserFile)) {
            return false;
        }
        UserFile other = (UserFile) object;
        if ((this.userFileId == null && other.userFileId != null) || (this.userFileId != null && !this.userFileId.equals(other.userFileId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.UserFile[ userFileId=" + userFileId + " ]";
    }
    
}
