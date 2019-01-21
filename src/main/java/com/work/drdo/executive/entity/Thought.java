package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.sql.Timestamp;

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
@Table(name = "thought")
@XmlRootElement
@NamedQueries({
	@NamedQuery(name = "Thought.findAll", query = "SELECT t FROM Thought t"),
	@NamedQuery(name = "Thought.today", query = "SELECT t FROM Thought t order by modifyAt desc")
})
public class Thought implements Serializable {

	/**
	 * 
	 */
	//select * from sys.objects order by modify_date desc
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Basic(optional = false)
	@Column(name = "thought_id")
	private Integer thoughtId;
	@Basic(optional = false)
	@Column(name = "thought_createdAt")
	private Timestamp createdAt;
	@Basic(optional = false)
	@Column(name = "thought_modifyAt")
	private Timestamp modifyAt;
	
	@Column(name = "thought_desciption")
	private String desciption;
	
	/*@OneToOne
	private UserProfile user;*/

	public Integer getThoughtId() {
		return thoughtId;
	}

	public void setThoughtId(Integer thoughtId) {
		this.thoughtId = thoughtId;
	}

	public String getDesciption() {
		return desciption;
	}

	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}

	public void setModifyAt(Timestamp modifyAt) {
		this.modifyAt = modifyAt;
	}
	
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
}
