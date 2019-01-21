package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.util.Collection;

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
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "UserProject")
@XmlRootElement
@NamedQueries({
	@NamedQuery(name = "UserProject.findAll", query = "SELECT t FROM UserProject t")
})
public class UserProject  implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Basic(optional = false)
	@Column(name = "userProject_Id")
	private Integer userProjectId;
	
	@Column(name = "name")
	private String name;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy = "userProject" , cascade = CascadeType.ALL ,orphanRemoval=true)
    private Collection<UserProjectDetail> userProjectDetails;

	public Integer getUserProjectId() {
		return userProjectId;
	}

	public void setUserProjectId(Integer userProjectId) {
		this.userProjectId = userProjectId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<UserProjectDetail> getUserProjectDetails() {
		return userProjectDetails;
	}

	public void setUserProjectDetails(Collection<UserProjectDetail> userProjectDetails) {
		this.userProjectDetails = userProjectDetails;
	}
}
