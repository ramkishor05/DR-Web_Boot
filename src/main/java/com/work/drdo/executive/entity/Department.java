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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "department")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Department.findAll", query = "SELECT d FROM Department d")
    , @NamedQuery(name = "Department.findByDeptId", query = "SELECT d FROM Department d WHERE d.deptId = :deptId")
    , @NamedQuery(name = "Department.findByDeptName", query = "SELECT d FROM Department d WHERE d.deptName = :deptName")
    , @NamedQuery(name = "Department.findByDeptHead", query = "SELECT d FROM Department d WHERE d.deptHead = :deptHead")
    , @NamedQuery(name = "Department.findByDeptDescription", query = "SELECT d FROM Department d WHERE d.deptDescription = :deptDescription")})
public class Department implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "dept_id")
    private Integer deptId;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 145)
    @Column(name = "dept_name")
    private String deptName;
    
    @Size(max = 145)
    @Column(name = "dept_head")
    private String deptHead;
    
    @Size(max = 145)
    @Column(name = "dept_description")
    private String deptDescription;
    
    @JoinColumn(name = "division_id")
    @ManyToOne
    private Division division;
   
    @OneToMany(mappedBy = "department")
    private Collection<Drdogroup> drdogroups;
    
    @OneToMany(mappedBy = "department")
    private Collection<Formation> formations;
    
    public Department() {
    }

    public Department(Integer deptId) {
        this.deptId = deptId;
    }

    public Department(Integer deptId, String deptName) {
        this.deptId = deptId;
        this.deptName = deptName;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptHead() {
        return deptHead;
    }

    public void setDeptHead(String deptHead) {
        this.deptHead = deptHead;
    }

    public String getDeptDescription() {
        return deptDescription;
    }

    public void setDeptDescription(String deptDescription) {
        this.deptDescription = deptDescription;
    }
    
    public Division getDivision() {
		return division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

    @XmlTransient
    public Collection<Drdogroup> getDrdogroups() {
        return drdogroups;
    }

    public void setDrdogroups(Collection<Drdogroup> drdogroups) {
        this.drdogroups = drdogroups;
    }
    
    public Collection<Formation> getFormations() {
		return formations;
	}

	public void setFormations(Collection<Formation> formations) {
		this.formations = formations;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (deptId != null ? deptId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Department)) {
            return false;
        }
        Department other = (Department) object;
        if ((this.deptId == null && other.deptId != null) || (this.deptId != null && !this.deptId.equals(other.deptId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Department[ deptId=" + deptId + " ]";
    }
    
}
