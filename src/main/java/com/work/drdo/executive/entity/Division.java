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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "division")
@XmlRootElement
@NamedQueries({ @NamedQuery(name = "Division.findAll", query = "SELECT d FROM Division d"),
		@NamedQuery(name = "Division.findByDivsionId", query = "SELECT d FROM Division d WHERE d.divisionId = :divisionId"),
		@NamedQuery(name = "Division.findByDivisionName", query = "SELECT d FROM Division d WHERE d.divisionName = :divisionName") })
public class Division implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "division_id")
	private Integer divisionId;

	@Size(max = 45)
	@Column(name = "division_name")
	private String divisionName;

	@JoinColumn(name = "division_head", referencedColumnName = "profile_id", nullable = true)
	@OneToOne
	private UserProfile divisionHead;

	@Size(max = 100)
	@Column(name = "division_comment")
	private String divisionComment;

	@OneToMany(mappedBy = "division")
	private Collection<Formation> formations;

	@OneToMany(mappedBy = "division")
	private Collection<Department> departments;

	public Division() {
	}

	public Division(Integer divsionId) {
		this.divisionId = divsionId;
	}

	public Integer getDivisionId() {
		return divisionId;
	}

	public void setDivisionId(Integer divsionId) {
		this.divisionId = divsionId;
	}

	public String getDivisionName() {
		return divisionName;
	}

	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}

	public UserProfile getDivisionHead() {
		return divisionHead;
	}

	public void setDivisionHead(UserProfile divisionHead) {
		this.divisionHead = divisionHead;
	}

	public String getDivisionComment() {
		return divisionComment;
	}

	public void setDivisionComment(String divisionComment) {
		this.divisionComment = divisionComment;
	}

	@XmlTransient
	public Collection<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(Collection<Department> departments) {
		this.departments = departments;
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
		hash += (divisionId != null ? divisionId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Division)) {
			return false;
		}
		Division other = (Division) object;
		if ((this.divisionId == null && other.divisionId != null)
				|| (this.divisionId != null && !this.divisionId.equals(other.divisionId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "entities.Division[ divsionId=" + divisionId + " ]";
	}

}
