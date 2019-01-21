/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.work.drdo.executive.entity;

import java.io.Serializable;

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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "formation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formation.findAll", query = "SELECT f FROM Formation f")
    , @NamedQuery(name = "Formation.findByFormationId", query = "SELECT f FROM Formation f WHERE f.formationId = :formationId")
    , @NamedQuery(name = "Formation.findByDivisionId", query = "SELECT f FROM Formation f WHERE f.division.divisionId = :divisionId")
    , @NamedQuery(name = "Formation.findByDepartmentId", query = "SELECT f FROM Formation f WHERE f.department.deptId = :departmentId")
    , @NamedQuery(name = "Formation.findByGroupId", query = "SELECT f FROM Formation f WHERE f.group.groupId = :groupId")})
public class Formation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "formation_id")
    private Integer formationId;
    
    @ManyToOne
    @JoinColumn(name = "division_id")
    private Division division;
    
    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;
    
    @ManyToOne
    @JoinColumn(name = "group_id")
    private Drdogroup group;
    
    @OneToOne
    @JoinColumn(name = "profile_id")
    private UserProfile profile;

    public Formation() {
    }

    public Formation(Integer formationId) {
        this.formationId = formationId;
    }

    public Integer getFormationId() {
        return formationId;
    }

    public void setFormationId(Integer formationId) {
        this.formationId = formationId;
    }

    public UserProfile getProfile() {
        return profile;
    }

    public void setProfile(UserProfile profile) {
        this.profile = profile;
    }

    public Division getDivision() {
		return division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Drdogroup getGroup() {
		return group;
	}

	public void setGroup(Drdogroup group) {
		this.group = group;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (formationId != null ? formationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Formation)) {
            return false;
        }
        Formation other = (Formation) object;
        if ((this.formationId == null && other.formationId != null) || (this.formationId != null && !this.formationId.equals(other.formationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Formation[ formationId=" + formationId + " ]";
    }
    
}
