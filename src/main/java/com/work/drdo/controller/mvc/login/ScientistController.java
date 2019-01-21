package com.work.drdo.controller.mvc.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.brijframework.util.formatter.PrintUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.ResetPasswordRequest;
import com.work.drdo.domain.beans.WelcomeProfileBean;
import com.work.drdo.domain.questionnaire.BasicDetailsVO;
import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.domain.questionnaire.ProfileForm;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.executive.entity.LoginInfo;
import com.work.drdo.executive.entity.LoginLog;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.framework.exception.ServiceException;
import com.work.drdo.service.UserRoleService;
import com.work.drdo.service.ZoneService;
import com.work.drdo.service.basicDetails.BasicDetailService;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.group.GroupService;
import com.work.drdo.service.login.LoginService;
import com.work.drdo.service.login.RegistrationService;
import com.work.drdo.utils.SecurityUtils;

@Controller
public class ScientistController {

	@Autowired
	RegistrationService registrationService;
	@Autowired
	private UserProfileDAO userProfileDAO;
	@Autowired
	private ZoneService zoneService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	LoginService loginService;
	@Autowired
	private BasicDetailService basicDetailService;
	@Autowired
	private GroupService groupService;
	@Autowired
	DepartmentService departmentService;

	@Value("${attachment.path}")
	private String questionPath;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private static final String SUCCESS = "SUCCESS";

	@RequestMapping(value = "/scientist/welcomeScientist", method = RequestMethod.GET)
	public String adminSuccess(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		try {
			UserProfile profile = userProfileDAO
					.find(Integer.valueOf(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId()));
			Integer basicDetailId = profile.getBasicDetail() != null ? profile.getBasicDetail().getBasicDetailId()
					: null;
			String columnFlag = "false";
			if (basicDetailId != null) {
				BasicDetailsVO basicDetail = basicDetailService.getBasicDetailsById(basicDetailId);
				if (StringUtils.isBlank(basicDetail.getDesignation())
						|| StringUtils.isBlank(basicDetail.getJoiningDate())
						|| StringUtils.isBlank(basicDetail.getResearchArea())
						|| StringUtils.isBlank(basicDetail.getInterestedResearchArea())
						|| StringUtils.isBlank(basicDetail.getQualification())
						|| StringUtils.isBlank(basicDetail.getResearchArea())
						|| StringUtils.isBlank(basicDetail.getPatent())) {
					columnFlag = "false";
				} else {
					columnFlag = "true";
				}
			}
			model.addAttribute("columnFlag", columnFlag);
			LoginLog log = new LoginLog();
			log.setLoginAt(new Date());
			log.setSessionId(request.getSession().getId());
			log.setLoginInfo(SecurityUtils.getUserProfile().getLoginInfo());
			loginService.saveLoginLog(log);
			SecurityUtils.setSessionAttrib("userName", SecurityUtils.getLoggedInUser().getUserProfile().getFirstName());
			model.addAttribute("profile", profile);
			model.addAttribute("department", departmentService.getAllDept());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "scientist/welcomeScientistPage";
	}

	@RequestMapping(value = "/scientist/userManagement", method = RequestMethod.GET)
	public String userManagement(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		try{
		UserProfile userProfile = userProfileDAO.selectByUserId(SecurityUtils.getLoggedInUser().getUsername());
		System.out.println("userProfile="+userProfile);
		model.addAttribute("userProfile", userProfile);
		model.put("zones", zoneService.findAll());
		model.put("roles", userRoleService.findAll());
		List<GroupVO> groupList = groupService.findAll();
		List<Department> dept = departmentService.getAllDept();
		model.addAttribute("department", dept);
		model.addAttribute("groupList", groupList);
		if (null != userProfile.getProfilePic()) {
			try {
				byte[] encodeBase64 = Base64.getEncoder().encode(userProfile.getProfilePic());
				String base64DataString = new String(encodeBase64, "UTF-8");
				model.addAttribute("pic", base64DataString);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return "scientist/userManagementPage";
	}

	@RequestMapping(value = "/scientist/deleteUser", method = RequestMethod.POST)
	public String deleteUser(ModelMap model, @ModelAttribute("deleteUserForm") ProfileForm deleteUserForm,
			HttpServletRequest request, HttpServletResponse response) {
		UserProfile userProfile = userProfileDAO.find(Integer.valueOf(deleteUserForm.getProfileId()));
		loginService.updateLoginInfo(userProfile);
		return "redirect:/scientist/getUserList";
	}

	@RequestMapping(value = "/scientist/updateInfo", method = RequestMethod.POST)
	public String updateInfo(@ModelAttribute("document") UserDetailVO userDetailVO,
			@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		try {
			registrationService.updateProfile(userDetailVO, file.isEmpty() ? null : file.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "scientist/registrationUpdateSuccess";
	}

	@RequestMapping(value = "/scientist/getUserList", method = RequestMethod.GET)
	public String getUserList(@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {

		model.put("users", loginService.findUser(false, 10, null != page ? (page * 10) : 0));
		int count = Integer.parseInt(loginService.count()) / 10;
		float floatCount = Float.valueOf(loginService.count()) / 10;

		if (null != loginService.count() && !loginService.count().equals("0")) {
			model.put("pages", (floatCount - count > 0.0 ? count + 1 : count));
		}
		model.addAttribute("userUpdateStatus", model.get("userUpdatedSuccessfully"));
		return "scientist/userList";

	}

	@RequestMapping(value = "/scientist/userManagement", method = RequestMethod.POST)
	public String userManagementAll(ModelMap model, @ModelAttribute("profileForm") ProfileForm profileForm,
			HttpServletRequest request, HttpServletResponse response) {
		UserProfile userProfile = userProfileDAO.find(Integer.valueOf(profileForm.getProfileId()));
		model.addAttribute("userProfile", userProfile);

		UserProfile profile = userProfileDAO.getReference(Integer.valueOf(profileForm.getProfileId()));
		model.put("roles", userRoleService
				.getUserRole(profile.getLoginInfo().getRole().getUserRoleId()));
		if (null != userProfile.getProfilePic()) {
			try {
				byte[] encodeBase64 = Base64.getEncoder().encode(userProfile.getProfilePic());
				String base64DataString = new String(encodeBase64, "UTF-8");
				model.addAttribute("pic", base64DataString);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "scientist/userManagementZonePage";
	}

	@RequestMapping(value = "/scientist/updateInfoZone", method = RequestMethod.POST)
	public String updateInfoAdmin(@ModelAttribute("document") UserDetailVO userDetailVO,
			@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redir) {
		try {
			registrationService.updateProfile(userDetailVO, SecurityUtils.getLoggedInUser(),
					file.isEmpty() ? null : file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		redir.addFlashAttribute("userUpdatedSuccessfully", SUCCESS);
		return "redirect:/scientist/welcomeDeptHead";
	}

	@RequestMapping(value = "/scientist/resetPasswordSubmit", method = RequestMethod.POST)
	public String resetPassword(ModelMap model,
			@ModelAttribute("resetPasswordFormFinal") @Valid ResetPasswordRequest resetRequest, BindingResult binder,
			HttpServletRequest req) {
		registrationService.resetPasswordAfterLogin(resetRequest);
		model.addAttribute("message", "forgot.password.complete");
		// Reset complete
		return "scientist/resetPasswordComplete";
	}

	@RequestMapping(value = "/scientist/registerUser", method = RequestMethod.GET)
	public String registerUser(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		model.put("roles", userRoleService.findAll());
		model.addAttribute("formationMsg", model.get("formationMsg"));
		return "scientist/registerExecutive";
	}

	@RequestMapping(value = "/scientist/executive.html", method = RequestMethod.POST, consumes = {
			"multipart/form-data" })
	public String save(@ModelAttribute("document") UserDetailVO userDetailVO, @RequestParam("file") MultipartFile file,
			RedirectAttributes redir) {
		try {
			registrationService.registerUser(userDetailVO, SecurityUtils.getLoggedInUser(),
					file.isEmpty() ? null : file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "registrationWelcome";
	}

	@SuppressWarnings("unused")
	private void setFileData(byte[] fileData, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			FileCopyUtils.copy(fileData, response.getOutputStream());
			response.flushBuffer();
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
			throw new ServiceException("Unable to download Report.");
		}
	}

	@RequestMapping(value = "/scientist/updateBasicDetails", method = RequestMethod.POST)
	public String updateBasicDetails(@ModelAttribute("welcomeProfileBean") WelcomeProfileBean profileBean, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside scientist updateBasicDetails "+PrintUtil.getObjectInfo(profileBean));
		try {
			registrationService.updateProfile(profileBean);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/scientist/welcomeScientist";
	}
}