/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.work.drdo.executive.entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dipak
 */
@Entity
@Table(name = "login_log")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LoginLog.findAll", query = "SELECT l FROM LoginLog l")
    , @NamedQuery(name = "LoginLog.findByLoginLogId", query = "SELECT l FROM LoginLog l WHERE l.loginLogId = :loginLogId")
    , @NamedQuery(name = "LoginLog.findByLoginAt", query = "SELECT l FROM LoginLog l WHERE l.loginAt = :loginAt")
    , @NamedQuery(name = "LoginLog.findByLogoutAt", query = "SELECT l FROM LoginLog l WHERE l.logoutAt = :logoutAt")
    , @NamedQuery(name = "LoginLog.findBySessionId", query = "SELECT l FROM LoginLog l WHERE l.sessionId = :sessionId")})
public class LoginLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "login_log_id")
    private Long loginLogId;
    
    @Column(name = "login_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date loginAt;
    
    @Column(name = "logout_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date logoutAt;
    
    @Size(max = 50)
    @Column(name = "session_id")
    private String sessionId;
    
    @JoinColumn(name = "login_info_id")
    @ManyToOne
    private LoginInfo loginInfo;

    public LoginLog() {
    }

    public LoginLog(Long loginLogId) {
        this.loginLogId = loginLogId;
    }

    public Long getLoginLogId() {
        return loginLogId;
    }

    public void setLoginLogId(Long loginLogId) {
        this.loginLogId = loginLogId;
    }

    public Date getLoginAt() {
        return loginAt;
    }

    public void setLoginAt(Date loginAt) {
        this.loginAt = loginAt;
    }

    public Date getLogoutAt() {
        return logoutAt;
    }

    public void setLogoutAt(Date logoutAt) {
        this.logoutAt = logoutAt;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public LoginInfo getLoginInfo() {
		return loginInfo;
	}

	public void setLoginInfo(LoginInfo loginInfo) {
		this.loginInfo = loginInfo;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (loginLogId != null ? loginLogId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LoginLog)) {
            return false;
        }
        LoginLog other = (LoginLog) object;
        if ((this.loginLogId == null && other.loginLogId != null) || (this.loginLogId != null && !this.loginLogId.equals(other.loginLogId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.LoginLog[ loginLogId=" + loginLogId + " ]";
    }
    
}
