/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "login_info")
@XmlRootElement
@NamedQueries({ @NamedQuery(name = "LoginInfo.findAll", query = "SELECT l FROM LoginInfo l"),
		@NamedQuery(name = "LoginInfo.findByLoginId", query = "SELECT l FROM LoginInfo l WHERE l.loginId = :loginId"),
		@NamedQuery(name = "LoginInfo.findByUserName", query = "SELECT l FROM LoginInfo l WHERE l.userName = :userName"),
		@NamedQuery(name = "LoginInfo.findByPassword", query = "SELECT l FROM LoginInfo l WHERE l.password = :password"),
		@NamedQuery(name = "LoginInfo.findByActive", query = "SELECT l FROM LoginInfo l WHERE l.active = :active"),
		@NamedQuery(name = "LoginInfo.findByLocked", query = "SELECT l FROM LoginInfo l WHERE l.locked = :locked"),
		@NamedQuery(name = "LoginInfo.findByLastLogin", query = "SELECT l FROM LoginInfo l WHERE l.lastLogin = :lastLogin"),
		@NamedQuery(name = "LoginInfo.findByCreatedBy", query = "SELECT l FROM LoginInfo l WHERE l.createdBy = :createdBy"),
		@NamedQuery(name = "LoginInfo.findByCreatedTs", query = "SELECT l FROM LoginInfo l WHERE l.createdTs = :createdTs"),
		@NamedQuery(name = "LoginInfo.findByUpdBy", query = "SELECT l FROM LoginInfo l WHERE l.updBy = :updBy"),
		@NamedQuery(name = "LoginInfo.findByUpdTs", query = "SELECT l FROM LoginInfo l WHERE l.updTs = :updTs"),
		@NamedQuery(name = "LoginInfo.findByEnabled", query = "SELECT l FROM LoginInfo l WHERE l.enabled = :enabled"),
		@NamedQuery(name = "LoginInfo.findByRoleId", query = "SELECT l FROM LoginInfo l WHERE l.role.userRoleId = :roleId"),
		@NamedQuery(name = "LoginInfo.findByRoleIdGroupId", query = "SELECT l FROM LoginInfo l WHERE l.role.userRoleId = :roleId AND l.profile.formation.group.groupId =:groupId") })
public class LoginInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "LOGIN_ID")
	private Integer loginId;
	
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 254)
	@Column(name = "USER_NAME")
	private String userName;
	
	@Size(max = 60)
	@Column(name = "PASSWORD")
	private String password;
	
	@Column(name = "ACTIVE")
	private Character active;
	@Column(name = "LOCKED")
	private Character locked;
	
	@Basic(optional = false)
	@NotNull
	@Column(name = "LAST_LOGIN")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastLogin;
	
	@Size(max = 254)
	@Column(name = "CREATED_BY")
	private String createdBy;
	
	@Basic(optional = false)
	@NotNull
	@Column(name = "CREATED_TS")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTs;
	
	@Size(max = 254)
	@Column(name = "UPD_BY")
	private String updBy;
	
	@Basic(optional = false)
	@NotNull
	@Column(name = "UPD_TS")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updTs;
	
	@Column(name = "ENABLED")
	private Character enabled;
	
	@JoinColumn(name = "PROFILE_ID")
	@OneToOne(mappedBy="loginInfo")
	private UserProfile profile;
	
	@JoinColumn(name = "ROLE_ID")
	@ManyToOne
	private UserRole role;

	@OneToMany(mappedBy = "loginInfo", cascade = { CascadeType.ALL })
	private Collection<LoginLog> loginLogs;

	public LoginInfo() {
	}

	public LoginInfo(Integer loginId) {
		this.loginId = loginId;
	}

	public LoginInfo(Integer loginId, String userName, Date lastLogin, Date createdTs, Date updTs) {
		this.loginId = loginId;
		this.userName = userName;
		this.lastLogin = lastLogin;
		this.createdTs = createdTs;
		this.updTs = updTs;
	}

	public Integer getLoginId() {
		return loginId;
	}

	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Character getActive() {
		return active;
	}

	public void setActive(Character active) {
		this.active = active;
	}

	public Character getLocked() {
		return locked;
	}

	public void setLocked(Character locked) {
		this.locked = locked;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedTs() {
		return createdTs;
	}

	public void setCreatedTs(Date createdTs) {
		this.createdTs = createdTs;
	}

	public String getUpdBy() {
		return updBy;
	}

	public void setUpdBy(String updBy) {
		this.updBy = updBy;
	}

	public Date getUpdTs() {
		return updTs;
	}

	public void setUpdTs(Date updTs) {
		this.updTs = updTs;
	}

	public Character getEnabled() {
		return enabled;
	}

	public void setEnabled(Character enabled) {
		this.enabled = enabled;
	}

	public UserProfile getProfile() {
		return profile;
	}

	public void setProfile(UserProfile profileId) {
		this.profile = profileId;
	}

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole roleId) {
		this.role = roleId;
	}

	@XmlTransient
	public Collection<LoginLog> getLoginLogs() {
		return loginLogs;
	}

	public void setLoginLogs(Collection<LoginLog> loginLogs) {
		this.loginLogs = loginLogs;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (loginId != null ? loginId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof LoginInfo)) {
			return false;
		}
		LoginInfo other = (LoginInfo) object;
		if ((this.loginId == null && other.loginId != null)
				|| (this.loginId != null && !this.loginId.equals(other.loginId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "entities.LoginInfo[ loginId=" + loginId + " ]";
	}

}
