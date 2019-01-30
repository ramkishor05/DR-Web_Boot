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
import javax.persistence.Lob;
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
@Table(name = "user_profile")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserProfile.findAll", query = "SELECT u FROM UserProfile u")
    , @NamedQuery(name = "UserProfile.findByProfileId", query = "SELECT u FROM UserProfile u WHERE u.profileId = :profileId")
    , @NamedQuery(name = "UserProfile.findByUserName", query = "SELECT u FROM UserProfile u WHERE u.userName = :userName")
    , @NamedQuery(name = "UserProfile.findByFirstName", query = "SELECT u FROM UserProfile u WHERE u.firstName = :firstName")
    , @NamedQuery(name = "UserProfile.findByMiddleName", query = "SELECT u FROM UserProfile u WHERE u.middleName = :middleName")
    , @NamedQuery(name = "UserProfile.findByLastName", query = "SELECT u FROM UserProfile u WHERE u.lastName = :lastName")
    , @NamedQuery(name = "UserProfile.findByGender", query = "SELECT u FROM UserProfile u WHERE u.gender = :gender")
    , @NamedQuery(name = "UserProfile.findByDateOfBirth", query = "SELECT u FROM UserProfile u WHERE u.dateOfBirth = :dateOfBirth")
    , @NamedQuery(name = "UserProfile.findByRegnDate", query = "SELECT u FROM UserProfile u WHERE u.regnDate = :regnDate")
    , @NamedQuery(name = "UserProfile.findByEmail", query = "SELECT u FROM UserProfile u WHERE u.email = :email")
    , @NamedQuery(name = "UserProfile.findByCreatedBy", query = "SELECT u FROM UserProfile u WHERE u.createdBy = :createdBy")
    , @NamedQuery(name = "UserProfile.findByCreatedByRole", query = "SELECT u FROM UserProfile u WHERE u.createdByRole = :createdByRole")
    , @NamedQuery(name = "UserProfile.findByCreatedTs", query = "SELECT u FROM UserProfile u WHERE u.createdTs = :createdTs")
    , @NamedQuery(name = "UserProfile.findByPhone", query = "SELECT u FROM UserProfile u WHERE u.phone = :phone")
    , @NamedQuery(name = "UserProfile.findByExtension", query = "SELECT u FROM UserProfile u WHERE u.extension = :extension")
    , @NamedQuery(name = "UserProfile.findByMobile", query = "SELECT u FROM UserProfile u WHERE u.mobile = :mobile")
    , @NamedQuery(name = "UserProfile.findByPosition", query = "SELECT u FROM UserProfile u WHERE u.position = :position")
    , @NamedQuery(name = "UserProfile.findByReplaceBy", query = "SELECT u FROM UserProfile u WHERE u.replaceBy = :replaceBy")
    , @NamedQuery(name = "UserProfile.findByExpirationDate", query = "SELECT u FROM UserProfile u WHERE u.expirationDate = :expirationDate")
    , @NamedQuery(name = "UserProfile.findByPrefix", query = "SELECT u FROM UserProfile u WHERE u.prefix = :prefix")
    , @NamedQuery(name = "UserProfile.findByFormationId", query = "SELECT u FROM UserProfile u WHERE u.formation.formationId = :formationId")})
public class UserProfile implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "profile_id")
    private Integer profileId;
   
    @Lob
    @Column(name = "profile_pic")
    private byte[] profilePic;
    
    @Size(max = 145)
    @Column(name = "user_name")
    private String userName;
   
    @Size(max = 45)
    @Column(name = "first_name")
    private String firstName;
    
    @Size(max = 45)
    @Column(name = "middle_name")
    private String middleName;
   
    @Size(max = 45)
    @Column(name = "last_name")
    private String lastName;
   
    @Size(max = 45)
    @Column(name = "gender")
    private String gender;
   
    @Column(name = "date_of_birth")
    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;
   
    @Column(name = "regn_date")
    @Temporal(TemporalType.DATE)
    private Date regnDate;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    
    @Size(max = 45)
    @Column(name = "created_by")
    private String createdBy;
    
    @Size(max = 45)
    @Column(name = "created_by_role")
    private String createdByRole;
    
    @Column(name = "created_ts")
    @Temporal(TemporalType.DATE)
    private Date createdTs;

    @Size(max = 45)
    @Column(name = "phone")
    private String phone;
    
    @Size(max = 45)
    @Column(name = "extension")
    private String extension;
    
    @Size(max = 45)
    @Column(name = "mobile")
    private String mobile;
    
    @Size(max = 45)
    @Column(name = "position")
    private String position;
    
    @Column(name = "replace_by")
    private String replaceBy;
    
    @Column(name = "expiration_date")
    @Temporal(TemporalType.DATE)
    private Date expirationDate;
    
    @Size(max = 5)
    @Column(name = "prefix")
    private String prefix;
    
    @JoinColumn(name = "login_info_id")
    @OneToOne(mappedBy="profile")
    private LoginInfo loginInfo;

    @JoinColumn(name = "formation_id")
    @OneToOne
    private Formation formation;
    
    @JoinColumn(name = "replace_role_id")
    @OneToOne(cascade = {CascadeType.ALL})
    private UserRole replaceRole;

    @JoinColumn(name = "basic_detail")
    @OneToOne(cascade = {CascadeType.ALL})
    private BasicDetail basicDetail;
    
    @JoinColumn(name = "manpower_id")
    @OneToOne(cascade=CascadeType.ALL)
    private Manpower manpower;
   
    @JoinColumn(name = "address_id")
    @OneToOne(cascade = {CascadeType.ALL})
    private Address address;
    
    @JoinColumn(name = "user_project_id")
    @OneToOne(cascade = {CascadeType.ALL})
    private UserProject userProject;
    
    @JoinColumn(name = "designation_id")
    @OneToOne(cascade = {CascadeType.ALL})
    private UserDesignation userDesignation;
    
    @OneToMany(mappedBy = "createdBy",cascade = {CascadeType.ALL})
    private Collection<UserDiary> userDiarys;
  
    @OneToMany(mappedBy = "userProfile" ,cascade = CascadeType.ALL)
    private Collection<UserAward> userAwards;
	

    public UserDesignation getUserDesignation() {
		return userDesignation;
	}

	public void setUserDesignation(UserDesignation userDesignation) {
		this.userDesignation = userDesignation;
	}

	public UserProfile() {
    }

    public UserProfile(Integer profileId) {
        this.profileId = profileId;
    }

    public UserProfile(Integer profileId, String email) {
        this.profileId = profileId;
        this.email = email;
    }

    public Integer getProfileId() {
        return profileId;
    }

    public void setProfileId(Integer profileId) {
        this.profileId = profileId;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Date getRegnDate() {
        return regnDate;
    }

    public void setRegnDate(Date regnDate) {
        this.regnDate = regnDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedByRole() {
        return createdByRole;
    }

    public void setCreatedByRole(String createdByRole) {
        this.createdByRole = createdByRole;
    }

    public Date getCreatedTs() {
        return createdTs;
    }

    public void setCreatedTs(Date createdTs) {
        this.createdTs = createdTs;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getReplaceBy() {
        return replaceBy;
    }

    public void setReplaceBy(String replaceBy) {
        this.replaceBy = replaceBy;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public LoginInfo getLoginInfo() {
		return loginInfo;
	}

	public void setLoginInfo(LoginInfo loginInfo) {
		this.loginInfo = loginInfo;
	}
   
    public Formation getFormation() {
		return formation;
	}

	public void setFormation(Formation formationId) {
		this.formation = formationId;
	}

    public UserRole getRoleId() {
        return replaceRole;
    }

    public void setRoleId(UserRole roleId) {
        this.replaceRole = roleId;
    }

    public BasicDetail getBasicDetail() {
        return basicDetail;
    }

    public void setBasicDetail(BasicDetail basicDetail) {
        this.basicDetail = basicDetail;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address addressId) {
        this.address = addressId;
    }
    
    public void setManpower(Manpower manpower) {
		this.manpower = manpower;
	}
    
    public Manpower getManpower() {
		return manpower;
	}
    
    public void setUserProject(UserProject userProject) {
		this.userProject=userProject;
	}
    
	public UserProject getUserProject() {
		return userProject;
	}

    @XmlTransient
    public Collection<UserDiary> getUserDiarys() {
        return userDiarys;
    }

    public void setUserDiarys(Collection<UserDiary> userDiarys) {
        this.userDiarys = userDiarys;
    }

    public Collection<UserAward> getUserAwards() {
		return userAwards;
	}
    
     public void setUserAwards(Collection<UserAward> userAwards) {
		this.userAwards = userAwards;
	}
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (profileId != null ? profileId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserProfile)) {
            return false;
        }
        UserProfile other = (UserProfile) object;
        if ((this.profileId == null && other.profileId != null) || (this.profileId != null && !this.profileId.equals(other.profileId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.UserProfile[ profileId=" + profileId + " ]";
    }

	
}
