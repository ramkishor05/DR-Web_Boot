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
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "recipent")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Recipent.findAll", query = "SELECT r FROM Recipent r")
    , @NamedQuery(name = "Recipent.findByRecipentId", query = "SELECT r FROM Recipent r WHERE r.recipentId = :recipentId")
    , @NamedQuery(name = "Recipent.findByName", query = "SELECT r FROM Recipent r WHERE r.name = :name")
    , @NamedQuery(name = "Recipent.findByDesignation", query = "SELECT r FROM Recipent r WHERE r.designation = :designation")
    , @NamedQuery(name = "Recipent.findByOfficeNumber", query = "SELECT r FROM Recipent r WHERE r.officeNumber = :officeNumber")
    , @NamedQuery(name = "Recipent.findByExt", query = "SELECT r FROM Recipent r WHERE r.ext = :ext")})
public class Recipent implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "recipent_id")
    private Integer recipentId;
    @Size(max = 145)
    @Column(name = "name")
    private String name;
    @Size(max = 145)
    @Column(name = "designation")
    private String designation;
    @Column(name = "office_number")
    private Integer officeNumber;
    @Column(name = "ext")
    private Integer ext;
    /*@JoinColumn(name = "address_id", referencedColumnName = "address_id")
    @ManyToOne*/
    @Column(name = "address_id")
    private String addressId;
    @JoinColumn(name = "recipent_for", referencedColumnName = "diary_id")
    @ManyToOne
    private UserDiary recipentFor;
    @Size(max = 80)
    @Column(name = "email")
    private String email;
    
    public Recipent() {
    }

    public Recipent(Integer recipentId) {
        this.recipentId = recipentId;
    }

    public Integer getRecipentId() {
        return recipentId;
    }

    public void setRecipentId(Integer recipentId) {
        this.recipentId = recipentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Integer getOfficeNumber() {
        return officeNumber;
    }

    public void setOfficeNumber(Integer officeNumber) {
        this.officeNumber = officeNumber;
    }

    public Integer getExt() {
        return ext;
    }

    public void setExt(Integer ext) {
        this.ext = ext;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public UserDiary getRecipentFor() {
        return recipentFor;
    }

    public void setRecipentFor(UserDiary recipentFor) {
        this.recipentFor = recipentFor;
    }
    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (recipentId != null ? recipentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Recipent)) {
            return false;
        }
        Recipent other = (Recipent) object;
        if ((this.recipentId == null && other.recipentId != null) || (this.recipentId != null && !this.recipentId.equals(other.recipentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Recipent[ recipentId=" + recipentId + " ]";
    }
    
}
