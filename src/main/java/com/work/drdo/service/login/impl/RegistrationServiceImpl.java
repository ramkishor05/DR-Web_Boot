package com.work.drdo.service.login.impl;

import static com.work.drdo.utils.SecurityUtils.getCtxPath;
import static com.work.drdo.utils.Utility.generateToken;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.AddressDAO;
import com.work.drdo.dao.BasicDetailsDAO;
import com.work.drdo.dao.DepartmentDAO;
import com.work.drdo.dao.DivisionDAO;
import com.work.drdo.dao.FormationDAO;
import com.work.drdo.dao.GroupDAO;
import com.work.drdo.dao.LoginInfoDAO;
import com.work.drdo.dao.ManpowerDetailDAO;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.dao.UserRoleDAO;
import com.work.drdo.domain.ResetPasswordRequest;
import com.work.drdo.domain.UserForgotPasswordRequest;
import com.work.drdo.domain.UserProfile;
import com.work.drdo.domain.beans.RegisterDesignationBean;
import com.work.drdo.domain.beans.RegisterFormationBean;
import com.work.drdo.domain.beans.RegisterLoginBean;
import com.work.drdo.domain.beans.RegisterProfileBean;
import com.work.drdo.domain.beans.WelcomeAddressBean;
import com.work.drdo.domain.beans.WelcomeBasicDetailBean;
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
import com.work.drdo.executive.entity.UserProject;
import com.work.drdo.executive.entity.UserProjectDetail;
import com.work.drdo.executive.entity.UserRole;
import com.work.drdo.framework.exception.ServiceException;
import com.work.drdo.helper.LoginInfoMapper;
import com.work.drdo.helper.ProfileMapper;
import com.work.drdo.service.UserAwardService;
import com.work.drdo.service.basicDetails.UserProjectDetailService;
import com.work.drdo.service.basicDetails.UserProjectService;
import com.work.drdo.service.designation.UserDesignationService;
import com.work.drdo.service.login.RegistrationService;
import com.work.drdo.service.notification.EmailNotificationService;
import com.work.drdo.utils.SecurityUtils;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RegistrationServiceImpl implements RegistrationService {
	@Autowired
	private EmailNotificationService emailNotifier;

	@Autowired
	private UserProfileDAO profileDAO;

	@Autowired
	private LoginInfoDAO loginInfoDAO;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private UserRoleDAO userRoleDAO;

	@Autowired
	private BasicDetailsDAO basicDetailsDAO;

	@Autowired
	private FormationDAO formationDAO;

	@Autowired
	private ManpowerDetailDAO manpowerDetailDAO;

	@Autowired
	private UserProjectService userProjectService;

	@Autowired
	private UserProjectDetailService userProjectDetailService;

	@Autowired
	private UserAwardService userAwardService;

	@Autowired
	private UserDesignationService userDesignationService;
	
	@Autowired
	private GroupDAO groupDAO;
	
	@Autowired
	private DepartmentDAO departmentDAO;
	
	
	@Autowired
	private DivisionDAO divisionDAO;

	Logger logger = Logger.getLogger(RegistrationServiceImpl.class);

	/**
	 * Verify the patient information
	 */
	@Override
	public void resetPassword(UserForgotPasswordRequest request) {
		logger.info("resetPassword !" + request.getDob());
		com.work.drdo.executive.entity.UserProfile profile = profileDAO.selectByUserId(request.getUserName());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = formatter.format(request.getDob());
		if (null == profile || !profile.getDateOfBirth().toString().equalsIgnoreCase(formattedDate)) {
			throw new ServiceException("resetpassword.invalid");
		}
		String token = generateToken().toString(); // Generate a unique random token
		loginInfoDAO.lockAccount(request.getUserName(), token); // Lock the account
		UserProfile profileBO = ProfileMapper.mapFromDB(profile);
		String resetURL = generateResetURL(token);
		emailNotifier.sendPasswordResetInfo(profileBO, resetURL); // Notify the member with password reset link

	}

	@Override
	public boolean verifyToken(String token) {
		int tokenCount = loginInfoDAO.verifyToken(token);
		return (tokenCount == 1);
	}

	@Override
	public void resetPassword(ResetPasswordRequest request) {
		LoginInfo loginInfo = loginInfoDAO.findByToken(request.getToken()); // Verify the token & get the user details
		if (null == loginInfo) {
			return;
		}
		if (StringUtils.isNotEmpty(loginInfo.getUserName())) {
			int result = loginInfoDAO.resetPassword(loginInfo.getUserName(), encoder.encode(request.getPassword())); // Reset
																														// the
																														// password
			if (result == 1) {
				logger.debug("Account Password has been reset successfuly !"); // Reset password success, notify the
																				// patient
				com.work.drdo.executive.entity.UserProfile userProfile = profileDAO
						.selectByUserId(loginInfo.getUserName()); // Get the patient profile from DB
				UserProfile profileBO = ProfileMapper.mapFromDB(userProfile);
				emailNotifier.notifyUpdatePassword(profileBO);// sending email notification
				return; // Safe Exit
			}
		}
		throw new ServiceException("resetpassword.invalid");
	}

	/**
	 * Reset the password
	 */
	@Override
	public void resetPasswordAfterLogin(ResetPasswordRequest request) {
		loginInfoDAO.resetPassword(SecurityUtils.getLoggedInUser().getUsername(),
				encoder.encode(request.getPassword()));
	}

	private String generateResetURL(String token) {
		StringBuilder sb = new StringBuilder(getCtxPath());
		sb.append("/resetPassword/verify").append("?token=").append(token);
		return sb.toString();
	}

	@Override
	public UserDetailVO findUser(String userName) {
		com.work.drdo.executive.entity.UserProfile userProfile = profileDAO.selectByUserId(userName);
		UserDetailVO userDetailVO = new UserDetailVO();
		userDetailVO.setPic(new Base64().encodeToString(userProfile.getProfilePic()));
		return userDetailVO;
	}

	public int generateKey() {
		return profileDAO.maxId();
	}
	
	@Override
	public LoginInfo registerUserFromAdmin(RegisterLoginBean loginBean, LoggedInUser createdBy, byte[] bytes) {
		LoginInfo loginInfo = LoginInfoMapper.getRegisterLoginInfo(loginBean,createdBy);
		if (loginInfoDAO.selectByUid(loginInfo.getUserName()) != null) {
			throw new ServiceException("User allready exist");
		}
		if (loginBean.getRole()==null || loginBean.getRole()==0) {
			throw new ServiceException("Invalid role.");
		}
		UserRole role = userRoleDAO.getUserRole(loginBean.getRole());
		if (role == null) {
			throw new ServiceException("Role not found.");
		}
		loginInfo.setRole(role);
		com.work.drdo.executive.entity.UserProfile userProfile = this.registerProfile(loginInfo,loginBean.getProfile(), createdBy, bytes);
		loginInfo.setProfile(userProfile);
		loginInfo = loginInfoDAO.register(loginInfo);
		emailNotifier.notifyRegistration(loginInfo, loginBean.getPassword());
		return loginInfo;
	}


	private com.work.drdo.executive.entity.UserProfile registerProfile(LoginInfo loginInfo,RegisterProfileBean profileBean,
			LoggedInUser createdBy, byte[] bytes) {
		com.work.drdo.executive.entity.UserProfile userProfile = LoginInfoMapper.getRegisterProfileInfo(loginInfo, profileBean);
		if(userProfile==null) {
			return null;
		}
		if (bytes != null && bytes.length > 0) {
			userProfile.setProfilePic(bytes);
		}
		userProfile.setCreatedBy(createdBy.getUsername());
		userProfile.setCreatedByRole(createdBy.getUserProfile().getRoleId().getUserRoleName());
		Formation formation = registerFormation(userProfile,profileBean.getFormation());
		userProfile.setFormation(formation);
		UserDesignation userDesignation =registerDesignation(profileBean.getDesignation());
		userProfile.setUserDesignation(userDesignation);
		profileDAO.registerProfile(userProfile);
		return userProfile;
	}
	
	private Formation registerFormation(com.work.drdo.executive.entity.UserProfile userProfile,
			RegisterFormationBean formationBean) {
		Formation formation =getFormation(userProfile, formationBean);
		if (formation == null) {
			return null;
		}
		formation.setProfile(userProfile);
		return formationDAO.saveFormation(formation);
	}
	
	public Formation getFormation(com.work.drdo.executive.entity.UserProfile userProfile,RegisterFormationBean formationBean) {
		if(formationBean==null) {
			System.err.println("RegisterFormationBean is null");
			return null;
		}
		Formation formation = new Formation();
		formation.setProfile(userProfile);
		if(formationBean.getDepartmentId()!=null&& formationBean.getDepartmentId()!=0) {
			formation.setDepartment(departmentDAO.find(formationBean.getDepartmentId()));
		}
		if(formationBean.getDivisionId()!=null && formationBean.getDivisionId()!=0) {
			formation.setDivision(divisionDAO.find(formationBean.getDivisionId()));
		}
		if(formationBean.getGroupId()!=null && formationBean.getGroupId()!=0) {
			formation.setGroup(groupDAO.find(formationBean.getGroupId()));
		}
		return formation;
	}

	private UserDesignation registerDesignation(RegisterDesignationBean designationBean) {
		UserDesignation designation = LoginInfoMapper.getUserDesignation(designationBean);
		if (designation == null) {
			return null;
		}
		return userDesignationService.saveDesignation(designation);
	}


	@Override
	public com.work.drdo.executive.entity.UserProfile updateProfile(WelcomeProfileBean profileBean) {
		com.work.drdo.executive.entity.UserProfile dbUserProfile =profileDAO.getReference(profileBean.getProfileId());
		if(dbUserProfile==null) {
			System.err.println("Invalid profile id");
			return null;
		}
		com.work.drdo.executive.entity.UserProfile bnUserProfile=LoginInfoMapper.getWelcomeProfile(dbUserProfile,profileBean);
		Address address = registerAddress(bnUserProfile.getAddress(),profileBean.getAddress());
		bnUserProfile.setAddress(address);
		BasicDetail basicDetail = this.registerBasicDetail(bnUserProfile.getBasicDetail(),profileBean.getBasicDetail());
		bnUserProfile.setBasicDetail(basicDetail);
		bnUserProfile=profileDAO.updateProfile(bnUserProfile);
		return bnUserProfile;
	}

	private BasicDetail registerBasicDetail(BasicDetail bnBasicDetail, WelcomeBasicDetailBean basicDetailBean) {
		BasicDetail basicDetail = LoginInfoMapper.getBasicDetail(bnBasicDetail,basicDetailBean);
		return updateBasicDetails(basicDetail);
	}

	private Address registerAddress(Address dbAddress,WelcomeAddressBean addressBean) {
		Address address=LoginInfoMapper.getWelcomeAddress(dbAddress,addressBean);
		return updateAddress(address);
	}

	@Override
	public LoginInfo registerUser(UserDetailVO userDetailVO, LoggedInUser createdBy, byte[] bytes) {
		LoginInfo loginInfo = LoginInfoMapper.getLoginInfo(userDetailVO);
		if (loginInfoDAO.selectByUid(loginInfo.getUserName()) != null) {
			throw new ServiceException("User allready exist");
		}
		if (StringUtils.isEmpty(userDetailVO.getRole()) || !StringUtils.isNumeric(userDetailVO.getRole())) {
			throw new ServiceException("Invalid role.");
		}
		Integer roleId = Integer.parseInt(userDetailVO.getRole());
		UserRole role = userRoleDAO.getUserRole(roleId);
		if (role == null) {
			throw new ServiceException("Role not found.");
		}
		loginInfo.setRole(role);
		com.work.drdo.executive.entity.UserProfile userProfile = this.createProfile(userDetailVO, createdBy, bytes);
		loginInfo.setProfile(userProfile);
		loginInfo = loginInfoDAO.register(loginInfo);
		emailNotifier.notifyRegistration(loginInfo, userDetailVO.getPassword());
		return loginInfo;
	}

	@Override
	public LoginInfo updateUser(UserDetailVO userDetailVO) {
		return null;
	}

	@Override
	public LoginInfo updateUser(LoginInfo loginInfo) {
		loginInfoDAO.updateLoginInfo(loginInfo);
		return loginInfo;
	}

	@Override
	public com.work.drdo.executive.entity.UserProfile createProfile(UserDetailVO userDetailVO, LoggedInUser createdBy,
			byte[] bytes) {
		com.work.drdo.executive.entity.UserProfile userProfile = LoginInfoMapper.getUserProfile(userDetailVO);
		userProfile.setCreatedBy(createdBy.getUsername());
		userProfile.setCreatedByRole(createdBy.getUserProfile().getRoleId().getUserRoleName());
		Address address = registerAddress(userDetailVO.getAddress());
		userProfile.setAddress(address);
		BasicDetail basicDetail = this.registerBasicDetail(userDetailVO.getBasicDetail());
		userProfile.setBasicDetail(basicDetail);
		Manpower manpowerDetail = updateManpowerDetail(userDetailVO.getManpower());
		userProfile.setManpower(manpowerDetail);
		UserDesignation userDesignation =registerDesignation(userDetailVO.getUserDesignation());
		userProfile.setUserDesignation(userDesignation);
		UserProject userProject = addProject(userDetailVO.getUserProject());
		userProfile.setUserProject(userProject);
		profileDAO.registerProfile(userProfile);
		Formation formation = registerFormation(userProfile,userDetailVO.getFormation());
		userProfile.setFormation(formation);
		this.addAwards(userProfile, userDetailVO.getAwards());
		return userProfile;
	}

	@Override
	public com.work.drdo.executive.entity.UserProfile updateProfile(UserDetailVO userDetailVO, LoggedInUser createdBy,
			byte[] bytes) {
		com.work.drdo.executive.entity.UserProfile dbUserProfile =profileDAO.getReference(userDetailVO.getId());
		com.work.drdo.executive.entity.UserProfile userProfile = LoginInfoMapper.getUserProfile(userDetailVO);
		if (dbUserProfile != null) {
			userProfile.setProfilePic(dbUserProfile.getProfilePic());
			userProfile.setCreatedBy(dbUserProfile.getCreatedBy());
			userProfile.setCreatedByRole(dbUserProfile.getCreatedByRole());
		}
		if (bytes != null && bytes.length > 0) {
			userProfile.setProfilePic(bytes);
		}
		Address address = updateAddress(userDetailVO.getAddress());
		if(address!=null){
		  userProfile.setAddress(address);
		}
		BasicDetail basicDetail = this.updateBasicDetails(userDetailVO.getBasicDetail());
		if(basicDetail!=null){
			userProfile.setBasicDetail(basicDetail);
		}
		Manpower manpowerDetail = updateManpowerDetail(userDetailVO.getManpower());
		if(manpowerDetail!=null){
		   userProfile.setManpower(manpowerDetail);
		}
		UserProject userProject = updateProject(userDetailVO.getUserProject());
		if(userProject!=null){
			userProfile.setUserProject(userProject);
		}
		userProfile=profileDAO.updateProfile(userProfile);
		this.updateAwards(userProfile, userDetailVO.getAwards());
		return userProfile;
	}

	@Override
	public com.work.drdo.executive.entity.UserProfile updateProfile(UserDetailVO userDetailVO, byte[] bytes) {
		com.work.drdo.executive.entity.UserProfile dbUserProfile =profileDAO.getReference(userDetailVO.getId());
		com.work.drdo.executive.entity.UserProfile userProfile = LoginInfoMapper.getUserProfile(dbUserProfile,userDetailVO);
		if (dbUserProfile != null) {
			userProfile.setProfilePic(dbUserProfile.getProfilePic());
			userProfile.setCreatedBy(dbUserProfile.getCreatedBy());
			userProfile.setCreatedByRole(dbUserProfile.getCreatedByRole());
			userProfile.setFormation(dbUserProfile.getFormation());
			Address address = updateAddress(LoginInfoMapper.getAddress(dbUserProfile.getAddress(),userDetailVO.getAddress()));
			if(address!=null){
			    userProfile.setAddress(address);
			}
			BasicDetail basicDetail = this.updateBasicDetails(LoginInfoMapper.getBasicDetail(dbUserProfile.getBasicDetail(),userDetailVO.getBasicDetail()));
			if(basicDetail!=null){
			    userProfile.setBasicDetail(basicDetail);
			}
		}else{
			Address address = updateAddress(userDetailVO.getAddress());
			if(address!=null){
			    userProfile.setAddress(address);
			}
			BasicDetail basicDetail = this.updateBasicDetails(userDetailVO.getBasicDetail());
			if(basicDetail!=null){
			    userProfile.setBasicDetail(basicDetail);
			}
		}
		if (bytes != null && bytes.length > 0) {
			userProfile.setProfilePic(bytes);
		}
		Manpower manpowerDetail = updateManpowerDetail(userDetailVO.getManpower());
		if(manpowerDetail!=null){
		   userProfile.setManpower(manpowerDetail);
		}
		UserProject userProject = updateProject(userDetailVO.getUserProject());
		if(userProject!=null){
			userProfile.setUserProject(userProject);
		}
		userProfile=profileDAO.updateProfile(userProfile);
		this.updateAwards(userProfile, userDetailVO.getAwards());
		return userProfile;
	}

	@Override
	public void addAwards(com.work.drdo.executive.entity.UserProfile userProfile, List<UserAwardVO> awards) {
		if (awards == null) {
			return;
		}
		for (UserAwardVO userAwardVO : awards) {
			userAwardService.saveAward(userProfile, userAwardVO);
		}
	}

	@Override
	public void updateAwards(com.work.drdo.executive.entity.UserProfile userProfile, List<UserAwardVO> awards) {
		if (awards == null) {
			return;
		}
		for (UserAwardVO userAwardVO : awards) {
			userAwardService.saveAward(userProfile, userAwardVO);
		}
	}

	@Override
	public UserProject addProject(ProjectVo userProjectVO) {
		if (userProjectVO == null) {
			return null;
		}
		UserProject userProject = LoginInfoMapper.getUserProject(userProjectVO);
		userProjectService.addProject(userProject);
		addProjectDetails(userProject, userProjectVO.getUserProjectDetails());
		return userProject;
	}

	@Override
	public UserProject updateProject(ProjectVo userProjectVO) {
		if (userProjectVO == null) {
			return null;
		}
		UserProject userProject = LoginInfoMapper.getUserProject(userProjectVO);
		userProjectService.updateProject(userProject);
		this.updateProjectDetails(userProject, userProjectVO.getUserProjectDetails());
		return userProject;
	}

	@Override
	public  void updateProjectDetails(UserProject userProject, List<ProjectDetailVo> userProjectDetails) {
		if (userProjectDetails == null) {
			return;
		}
		for (ProjectDetailVo projectDetailVo : userProjectDetails) {
			UserProjectDetail projectDetail = LoginInfoMapper.getUserProjectDetail(projectDetailVo);
			projectDetail.setUserProject(userProject);
			userProjectDetailService.updateProjectDetail(projectDetail);
		}
	}

	@Override
	public  void addProjectDetails(UserProject userProject, List<ProjectDetailVo> userProjectDetails) {
		if (userProjectDetails == null) {
			return;
		}
		for (ProjectDetailVo projectDetailVo : userProjectDetails) {
			UserProjectDetail projectDetail = LoginInfoMapper.getUserProjectDetail(projectDetailVo);
			projectDetail.setUserProject(userProject);
			userProjectDetailService.addProjectDetail(projectDetail);
		}
	}

	@Override
	public Address updateAddress(AddressVO addressVO) {
		if (addressVO == null) {
			return null;
		}
		Address address = LoginInfoMapper.getAddress(addressVO);
		return updateAddress(address);
	}
	
	public Address updateAddress(Address address) {
		if (address == null) {
			return null;
		}
		return addressDAO.updateAddress(address);
	}


	@Override
	public UserDesignation updateDesignation(UserDesignationVO designationVO) {
		if (designationVO == null) {
			return null;
		}
		UserDesignation designation = LoginInfoMapper.getUserDesignation(designationVO);
		return userDesignationService.updateDesignation(designation);
	}
	
	public BasicDetail updateBasicDetails(BasicDetail basicDetail) {
		if (basicDetail == null) {
			return null;
		}
		return basicDetailsDAO.updateBasicDetail(basicDetail);
	}

	@Override
	public BasicDetail updateBasicDetails(BasicDetailsVO basicDetailsVo) {
		if (basicDetailsVo == null) {
			return null;
		}
		BasicDetail basicDetail = LoginInfoMapper.getBasicDetail(basicDetailsVo);
		return updateBasicDetails(basicDetail);
	}

	@Override
	public Address registerAddress(AddressVO addressVO) {
		if (addressVO == null) {
			return null;
		}
		Address address = LoginInfoMapper.getAddress(addressVO);
		return addressDAO.registerAddress(address);
	}

	@Override
	public BasicDetail registerBasicDetail(BasicDetailsVO basicDetailsVO) {
		if (basicDetailsVO == null) {
			return null;
		}
		BasicDetail basicDetail = LoginInfoMapper.getBasicDetail(basicDetailsVO);
		return basicDetailsDAO.registerBasicDetail(basicDetail);
	}

	@Override
	public UserDesignation registerDesignation(UserDesignationVO designationVO) {
		if (designationVO == null) {
			return null;
		}
		UserDesignation designation = LoginInfoMapper.getUserDesignation(designationVO);
		return userDesignationService.saveDesignation(designation);
	}

	@Override
	public Manpower registerManpowerDetail(ManPowerVo manPowerVo) {
		if (manPowerVo == null) {
			return null;
		}
		Manpower manpowerDetail = LoginInfoMapper.getManpowerDetail(manPowerVo);
		if (!isValidManpower(manpowerDetail)) {
			return null;
		}
		return manpowerDetailDAO.createManpower(manpowerDetail);
	}

	@Override
	public Manpower updateManpowerDetail(ManPowerVo manPowerVo) {
		if (manPowerVo == null) {
			return null;
		}
		Manpower manpowerDetail = LoginInfoMapper.getManpowerDetail(manPowerVo);
		if (!isValidManpower(manpowerDetail)) {
			return null;
		}
		return manpowerDetailDAO.updateManpower(manpowerDetail);
	}

	public boolean isValidManpower(Manpower manpowerDetail) {
		if (manpowerDetail == null) {
			System.out.println("Invalid ManpowerDetail");
			return false;
		}

		if (manpowerDetail.getJrf() == null) {
			System.out.println("Invalid ManpowerDetail Jrf");
			return false;
		}

		if (manpowerDetail.getSrf() == null) {
			System.out.println("Invalid ManpowerDetail Srf");
			return false;
		}

		if (manpowerDetail.getMts() == null) {
			System.out.println("Invalid ManpowerDetail Mts");
			return false;
		}

		if (manpowerDetail.getProjectAssinged() == null) {
			System.out.println("Invalid ManpowerDetail ProjectAssinged");
			return false;
		}

		if (manpowerDetail.getRa() == null) {
			System.out.println("Invalid ManpowerDetail Ra");
			return false;
		}
		return true;
	}

	@Override
	public Formation registerFormation(com.work.drdo.executive.entity.UserProfile userProfile,FormationVO formationVO) {
		if (formationVO == null) {
			return null;
		}
		Formation formation = getFormation(formationVO);
		formation.setProfile(userProfile);
		return formationDAO.saveFormation(formation);
	}

	@Override
	public Formation updateFormation(com.work.drdo.executive.entity.UserProfile userProfile,FormationVO formationVO) {
		if (formationVO == null) {
			return null;
		}
		Formation formation = getFormation(formationVO);
		formation.setProfile(userProfile);
		return formationDAO.updateFormation(formation);
	}


	public Formation getFormation(FormationVO formationBean) {
		Formation formation = new Formation();
		if (StringUtils.isNotEmpty(formationBean.getDepartment())) {
			formation.setDepartment(departmentDAO.find(Integer.parseInt(formationBean.getDepartment())));
		}
		if (StringUtils.isNotEmpty(formationBean.getDivisionId())) {
			formation.setDivision(divisionDAO.find(Integer.parseInt(formationBean.getDivisionId())));
		}
		if (StringUtils.isNotEmpty(formationBean.getGroupId())) {
			formation.setGroup(groupDAO.find(Integer.parseInt(formationBean.getGroupId())));
		}
		return formation;
	}
}
