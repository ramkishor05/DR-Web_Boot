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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "basic_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BasicDetail.findAll", query = "SELECT b FROM BasicDetail b")
    , @NamedQuery(name = "BasicDetail.findByBasicDetailId", query = "SELECT b FROM BasicDetail b WHERE b.basicDetailId = :basicDetailId")
    , @NamedQuery(name = "BasicDetail.findByDesignation", query = "SELECT b FROM BasicDetail b WHERE b.designation = :designation")
    , @NamedQuery(name = "BasicDetail.findByJoiningDate", query = "SELECT b FROM BasicDetail b WHERE b.joiningDate = :joiningDate")
    , @NamedQuery(name = "BasicDetail.findByTillDate", query = "SELECT b FROM BasicDetail b WHERE b.tillDate = :tillDate")
    , @NamedQuery(name = "BasicDetail.findByResearchArea", query = "SELECT b FROM BasicDetail b WHERE b.researchArea = :researchArea")
    , @NamedQuery(name = "BasicDetail.findByInterestedResearchArea", query = "SELECT b FROM BasicDetail b WHERE b.interestedResearchArea = :interestedResearchArea")
    , @NamedQuery(name = "BasicDetail.findByQualification", query = "SELECT b FROM BasicDetail b WHERE b.qualification = :qualification")
    , @NamedQuery(name = "BasicDetail.findByResearchPaper", query = "SELECT b FROM BasicDetail b WHERE b.researchPaper = :researchPaper")
    , @NamedQuery(name = "BasicDetail.findByPatent", query = "SELECT b FROM BasicDetail b WHERE b.patent = :patent")})
public class BasicDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "basic_detail_id")
    private Integer basicDetailId;
    @Size(max = 45)
    @Column(name = "designation")
    private String designation;
    @Column(name = "joining_date")
    @Temporal(TemporalType.DATE)
    private Date joiningDate;
    @Column(name = "till_date")
    @Temporal(TemporalType.DATE)
    private Date tillDate;
    @Size(max = 145)
    @Column(name = "research_area")
    private String researchArea;
    @Size(max = 145)
    @Column(name = "interested_research_area")
    private String interestedResearchArea;
    @Size(max = 45)
    @Column(name = "qualification")
    private String qualification;
    @Size(max = 145)
    @Column(name = "research_paper")
    private String researchPaper;
    @Size(max = 145)
    @Column(name = "patent")
    private String patent;
    @Column(name = "tot")
    private String tot;
    @Column(name = "copyright")
    private String copyright;
    
    @OneToMany(mappedBy = "basicDetail", cascade = {CascadeType.ALL})
    private Collection<UserProfile> userProfileCollection;

    public BasicDetail() {
    }

    public BasicDetail(Integer basicDetailId) {
        this.basicDetailId = basicDetailId;
    }

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

	@XmlTransient
    public Collection<UserProfile> getUserProfileCollection() {
        return userProfileCollection;
    }

    public void setUserProfileCollection(Collection<UserProfile> userProfileCollection) {
        this.userProfileCollection = userProfileCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (basicDetailId != null ? basicDetailId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BasicDetail)) {
            return false;
        }
        BasicDetail other = (BasicDetail) object;
        if ((this.basicDetailId == null && other.basicDetailId != null) || (this.basicDetailId != null && !this.basicDetailId.equals(other.basicDetailId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.BasicDetail[ basicDetailId=" + basicDetailId + " ]";
    }
    
}
