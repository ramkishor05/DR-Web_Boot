
package com.work.drdo.service.login;

import java.util.List;

import com.work.drdo.domain.UserForgotPasswordRequest;
import com.work.drdo.domain.beans.RegisterLoginBean;
import com.work.drdo.domain.beans.WelcomeProfileBean;
import com.work.drdo.domain.login.LoggedInUser;
import com.work.drdo.domain.questionnaire.AddressVO;
import com.work.drdo.domain.questionnaire.BasicDetailsVO;
import com.work.drdo.domain.questionnaire.FormationVO;
import com.work.drdo.domain.questionnaire.ManPowerVo;
import com.work.drdo.domain.questionnaire.ProjectDetailVo;
import com.work.drdo.domain.questionnaire.ProjectVo;
import com.work.drdo.domain.questionnaire.UserAwardVO;
import com.work.drdo.domain.questionnaire.UserDesignationVO;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.Address;
import com.work.drdo.executive.entity.BasicDetail;
import com.work.drdo.executive.entity.Formation;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.Manpower;
import com.work.drdo.executive.entity.UserDesignation;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.executive.entity.UserProject;

public interface RegistrationService {

	void resetPassword(UserForgotPasswordRequest request);

	boolean verifyToken(String token);

	void resetPassword(com.work.drdo.domain.ResetPasswordRequest request);

	public void resetPasswordAfterLogin(com.work.drdo.domain.ResetPasswordRequest request);

	public UserDetailVO findUser(String userName);

	public LoginInfo registerUser(UserDetailVO userDetailVO, LoggedInUser createdBy, byte[] bytes);

	public UserProfile updateProfile(UserDetailVO userDetailVO, LoggedInUser createdBy, byte[] bytes);

	public UserProfile updateProfile(UserDetailVO userDetailVO, byte[] bytes);

	public UserProfile createProfile(UserDetailVO userDetailVO, LoggedInUser createdBy, byte[] bytes);

	public BasicDetail registerBasicDetail(BasicDetailsVO userDetailVO);

	public LoginInfo updateUser(LoginInfo userLoginInfo);

	public LoginInfo updateUser(UserDetailVO userDetailVO);

	public Address updateAddress(AddressVO addressVO);

	public Address registerAddress(AddressVO addressVO);

	public Formation updateFormation(com.work.drdo.executive.entity.UserProfile userProfile,FormationVO formationVO);

	public Formation registerFormation(com.work.drdo.executive.entity.UserProfile userProfile,FormationVO formationVO);

	public Manpower updateManpowerDetail(ManPowerVo manPowerVo);

	public Manpower registerManpowerDetail(ManPowerVo manPowerVo);

	public UserDesignation registerDesignation(UserDesignationVO designationVO);

	public BasicDetail updateBasicDetails(BasicDetailsVO basicDetailsVo);

	public UserDesignation updateDesignation(UserDesignationVO designationVO);

	public void addProjectDetails(UserProject userProject, List<ProjectDetailVo> userProjectDetails);

	public void updateProjectDetails(UserProject userProject, List<ProjectDetailVo> userProjectDetails);

	public UserProject updateProject(ProjectVo userProjectVO);

	public UserProject addProject(ProjectVo userProjectVO);

	public void updateAwards(UserProfile userProfile, List<UserAwardVO> awards);

	public void addAwards(UserProfile userProfile, List<UserAwardVO> awards);

	public LoginInfo registerUserFromAdmin(RegisterLoginBean loginBean, LoggedInUser createdBy, byte[] bytes);

	public UserProfile updateProfile(WelcomeProfileBean profileBean);

}
