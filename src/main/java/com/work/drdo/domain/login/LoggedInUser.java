
package com.work.drdo.domain.login;

import java.util.Collection;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.executive.entity.UserRole;

public class LoggedInUser extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userId;
	private UserRole role;
	private UserProfile userProfile;
	
	/**
	 * @param username
	 * @param password
	 * @param enabled
	 * @param accountNonExpired
	 * @param credentialsNonExpired
	 * @param accountNonLocked
	 * @param authorities
	 */
	public LoggedInUser(String username, String password, String userId, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, UserRole roleId, UserProfile userProfile) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.userId = userId;
		this.role = roleId;
		this.userProfile = userProfile;
	}

	public String getUserId(){
		return this.userId;
	}
	public UserRole getRole(){
		return this.role;
	}
	
	@Override
	public boolean equals(Object other){
		if(null == other || !(other instanceof LoggedInUser)){
			return false;
		}
		
		LoggedInUser otherUser = (LoggedInUser)other;
		if(StringUtils.equalsIgnoreCase(this.getUsername(), otherUser.getUsername())){
			return true;
		}
		
		return false;//Default is that the objects are not equal
	}
	
	@Override
	public int hashCode(){
		return 13 * (StringUtils.isEmpty(getUsername()) ? 1 : getUsername().hashCode());
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}
	
}
