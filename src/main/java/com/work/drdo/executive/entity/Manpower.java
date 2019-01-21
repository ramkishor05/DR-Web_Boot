package com.work.drdo.executive.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Manpower_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ManpowerDetail.findAll", query = "SELECT mp FROM Manpower mp")
})
public class Manpower {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "manpower_id")
    private Integer manpowerId;
	
	@Column(name = "JRF", nullable=false)
    private Integer jrf;
	
    @Column(name = "SRF", nullable=false)
    private Integer srf;
    
    @Column(name = "RA", nullable=false)
    private Integer ra;
    
    @Column(name = "JPROJECT_ASSIGNEDRF", nullable=false)
    private Integer projectAssinged;
    
    @Column(name = "MTS", nullable=false)
    private Integer mts;
    
    public void setManpowerId(Integer manpowerId) {
		this.manpowerId = manpowerId;
	}
    
    public Integer getManpowerId() {
		return manpowerId;
	}
    
	public Integer getJrf() {
		return jrf;
	}
	public void setJrf(Integer jrf) {
		this.jrf = jrf;
	}
	public Integer getSrf() {
		return srf;
	}
	public void setSrf(Integer srf) {
		this.srf = srf;
	}
	public Integer getRa() {
		return ra;
	}
	public void setRa(Integer ra) {
		this.ra = ra;
	}
	public Integer getProjectAssinged() {
		return projectAssinged;
	}
	public void setProjectAssinged(Integer projectAssinged) {
		this.projectAssinged = projectAssinged;
	}
	public Integer getMts() {
		return mts;
	}
	public void setMts(Integer mts) {
		this.mts = mts;
	}
}
