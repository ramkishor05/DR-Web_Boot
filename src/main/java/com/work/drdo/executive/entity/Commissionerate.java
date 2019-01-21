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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author dipak
 */
@Entity
@Table(name = "commissionerate")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Commissionerate.findAll", query = "SELECT c FROM Commissionerate c"),
    @NamedQuery(name = "Commissionerate.findByCommissionerateId", query = "SELECT c FROM Commissionerate c WHERE c.commissionerateId = :commissionerateId"),
    @NamedQuery(name = "Commissionerate.findByCommissionerateName", query = "SELECT c FROM Commissionerate c WHERE c.commissionerateName = :commissionerateName"),
    @NamedQuery(name = "Commissionerate.findByComment", query = "SELECT c FROM Commissionerate c WHERE c.comment = :comment")})
public class Commissionerate implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "commissionerate_id")
    private Integer commissionerateId;
    @Column(name = "commissionerate_name")
    private String commissionerateName;
    @Column(name = "comment")
    private String comment;
  /*  @OneToMany(fetch = FetchType.EAGER,mappedBy = "commissionerateId")
    private Collection<Division> divisionCollection;*/
    @JoinColumn(name = "zone_id", referencedColumnName = "zone_id")
    @ManyToOne
    private Zone zoneId;

    public Commissionerate() {
    }

    public Commissionerate(Integer commissionerateId) {
        this.commissionerateId = commissionerateId;
    }

    public Integer getCommissionerateId() {
        return commissionerateId;
    }

    public void setCommissionerateId(Integer commissionerateId) {
        this.commissionerateId = commissionerateId;
    }

    public String getCommissionerateName() {
        return commissionerateName;
    }

    public void setCommissionerateName(String commissionerateName) {
        this.commissionerateName = commissionerateName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

  /*  @XmlTransient
    public Collection<Division> getDivisionCollection() {
        return divisionCollection;
    }

    public void setDivisionCollection(Collection<Division> divisionCollection) {
        this.divisionCollection = divisionCollection;
    }*/

    public Zone getZoneId() {
        return zoneId;
    }

    public void setZoneId(Zone zoneId) {
        this.zoneId = zoneId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (commissionerateId != null ? commissionerateId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Commissionerate)) {
            return false;
        }
        Commissionerate other = (Commissionerate) object;
        if ((this.commissionerateId == null && other.commissionerateId != null) || (this.commissionerateId != null && !this.commissionerateId.equals(other.commissionerateId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "files.Commissionerate[ commissionerateId=" + commissionerateId + " ]";
    }
    
}
