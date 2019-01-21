package com.work.drdo.helper;

import com.work.drdo.domain.UserProfile;

public class ProfileMapper {

	public static UserProfile mapFromDB(com.work.drdo.executive.entity.UserProfile profile) {
		UserProfile userProfile = new UserProfile();
		
		if(null!=profile){
			userProfile.setCreatedBy(profile.getCreatedBy());
			userProfile.setCreatedByRole(profile.getCreatedByRole());
			userProfile.setCreatedTs(profile.getCreatedTs());
			userProfile.setDateOfBirth(profile.getDateOfBirth());
			userProfile.setEmail(profile.getEmail());
			userProfile.setFirstName(profile.getFirstName());
			userProfile.setMiddleName(profile.getMiddleName());
			userProfile.setGender(profile.getGender());
			userProfile.setLastName(profile.getLastName());
			userProfile.setProfileId(new Long(profile.getProfileId()));
			userProfile.setRegnDate(profile.getRegnDate());
			userProfile.setUserName(profile.getUserName());
		}
		return userProfile;
	}

}
