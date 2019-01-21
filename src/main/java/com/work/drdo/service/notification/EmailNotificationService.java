package com.work.drdo.service.notification;

import java.util.List;

import com.work.drdo.domain.UserProfile;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.UserDiary;

public interface EmailNotificationService {
	void notifyRegistration(LoginInfo profile,String passcode);
	public void sendPasswordResetInfo(UserProfile profile, String resetURL);
	public void notifyUpdatePassword(UserProfile profile);
	//public void notifyPendingQuestion(LoginInfo user ,Assignment assignment);
	public void sendDiaryConfirmation(UserDiary diary,List<String> approvalChk);
	public void sendDiaryDisapprovalEmail(UserDiary diary,String remark);
}
