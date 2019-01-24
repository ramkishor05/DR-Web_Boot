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

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "drdogroup")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Drdogroup.findAll", query = "SELECT d FROM Drdogroup d")
    , @NamedQuery(name = "Drdogroup.findByGroupId", query = "SELECT d FROM Drdogroup d WHERE d.groupId = :groupId")
    , @NamedQuery(name = "Drdogroup.findByGroupName", query = "SELECT d FROM Drdogroup d WHERE d.groupName = :groupName")
    , @NamedQuery(name = "Drdogroup.findByComment", query = "SELECT d FROM Drdogroup d WHERE d.comment = :comment")
    , @NamedQuery(name = "Drdogroup.findByStatus", query = "SELECT d FROM Drdogroup d WHERE d.status = :status")})
public class Drdogroup implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "group_id")
    private Integer groupId;
    
    @Size(max = 145)
    @Column(name = "group_name")
    private String groupName;
    
    @Size(max = 145)
    @Column(name = "comment")
    private String comment;
    
    @Size(max = 45)
    @Column(name = "status")
    private String status;
    
    @JoinColumn(name = "dept_id")
    @ManyToOne
    private Department department;
    
    @OneToMany(mappedBy = "group")
    private Collection<Formation> formations;

    public Drdogroup() {
    }

    public Drdogroup(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (groupId != null ? groupId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Drdogroup)) {
            return false;
        }
        Drdogroup other = (Drdogroup) object;
        if ((this.groupId == null && other.groupId != null) || (this.groupId != null && !this.groupId.equals(other.groupId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Drdogroup[ groupId=" + groupId + " ]";
    }
    
}
