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

@Entity
@Table(name = "UserProjectDetail")
@XmlRootElement
@NamedQueries({
	@NamedQuery(name = "UserProjectDetail.findAll", query = "SELECT t FROM UserProjectDetail t")
})
public class UserProjectDetail  implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Basic(optional = false)
	@Column(name = "userProjectDetail_id")
	private Integer userProjectDetailId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@JoinColumn(name = "userProject_id", referencedColumnName = "userProject_id")
    @ManyToOne
	private UserProject userProject;

	public Integer getUserProjectDetailId() {
		return userProjectDetailId;
	}

	public void setUserProjectDetailId(Integer userProjectDetailId) {
		
		this.userProjectDetailId = userProjectDetailId;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public UserProject getUserProject() {
		return userProject;
	}

	public void setUserProject(UserProject userProject) {
		this.userProject = userProject;
	}
}
