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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "address")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Address.findAll", query = "SELECT a FROM Address a")
    , @NamedQuery(name = "Address.findByAddressId", query = "SELECT a FROM Address a WHERE a.addressId = :addressId")
    , @NamedQuery(name = "Address.findByAddressLine", query = "SELECT a FROM Address a WHERE a.addressLine = :addressLine")
    , @NamedQuery(name = "Address.findByAddressCity", query = "SELECT a FROM Address a WHERE a.addressCity = :addressCity")
    , @NamedQuery(name = "Address.findByAddressState", query = "SELECT a FROM Address a WHERE a.addressState = :addressState")
    , @NamedQuery(name = "Address.findByAddressPin", query = "SELECT a FROM Address a WHERE a.addressPin = :addressPin")})
public class Address implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Basic(optional = false)
    @Column(name = "address_id")
    private Integer addressId;
    
    @Column(name = "address_line")
    private String addressLine;
    
    @Column(name = "address_city")
    private String addressCity;
    
    @Column(name = "address_state")
    private String addressState;
    
    @Column(name = "address_pin")
    private Integer addressPin;
    
    @OneToMany(mappedBy = "address")
    private Collection<UserProfile> userProfiles;
    
    public Address() {
    }

    public Address(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getAddressLine() {
        return addressLine;
    }

    public void setAddressLine(String addressLine) {
        this.addressLine = addressLine;
    }

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }

    public String getAddressState() {
        return addressState;
    }

    public void setAddressState(String addressState) {
        this.addressState = addressState;
    }

    public Integer getAddressPin() {
        return addressPin;
    }

    public void setAddressPin(Integer addressPin) {
        this.addressPin = addressPin;
    }

    @XmlTransient
    public Collection<UserProfile> getUserProfiles() {
        return userProfiles;
    }

    public void setUserProfiles(Collection<UserProfile> userProfiles) {
        this.userProfiles = userProfiles;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (addressId != null ? addressId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Address)) {
            return false;
        }
        Address other = (Address) object;
        if ((this.addressId == null && other.addressId != null) || (this.addressId != null && !this.addressId.equals(other.addressId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Address[ addressId=" + addressId + " ]";
    }
    
}
