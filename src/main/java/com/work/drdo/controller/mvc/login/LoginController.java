
package com.work.drdo.controller.mvc.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.brijframework.util.formatter.PrintUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.beans.RegisterLoginBean;
import com.work.drdo.domain.login.LoggedInUser;
import com.work.drdo.domain.questionnaire.ByDateVO;
import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.domain.questionnaire.LoginLogVO;
import com.work.drdo.domain.questionnaire.ProfileForm;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.LoginLog;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.service.UserRoleService;
import com.work.drdo.service.commissionerate.CommissionerateService;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.division.DivisionService;
import com.work.drdo.service.group.GroupService;
import com.work.drdo.service.login.LoginService;
import com.work.drdo.service.login.RegistrationService;
import com.work.drdo.utils.SecurityUtils;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	RegistrationService registrationService;
	
	@Autowired
	UserProfileDAO profileDao;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	CommissionerateService commissionerateService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private DivisionService divisionService;

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private static final String SUCCESS = "SUCCESS";

	@RequestMapping(value = "/admin/welcomeAdmin", method = RequestMethod.GET)
	public String adminSuccess(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside admin welcome.");
		UserProfile profile = profileDao
				.find(Integer.valueOf(SecurityUtils.getLoggedInUser().getUserProfile().getProfileId()));
		LoginLog log = new LoginLog();
		log.setLoginAt(new Date());
		log.setSessionId(request.getSession().getId());
		log.setLoginInfo(SecurityUtils.getUserProfile().getLoginInfo());
		SecurityUtils.setSessionAttrib("userName", SecurityUtils.getLoggedInUser().getUserProfile().getFirstName());
		loginService.saveLoginLog(log);
		model.addAttribute("profile", profile);
		return "admin/welcomeAdmin";
	}

	@RequestMapping(value = "/admin/userManagement", method = RequestMethod.POST)
	public String userManagementAll(ModelMap model, @ModelAttribute("profileForm") ProfileForm profileForm,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside admin userManagement. for : "+profileForm.getProfileId());
		try {
			UserProfile userProfile = profileDao.find(Integer.valueOf(profileForm.getProfileId()));
			logger.info("userProfile="+userProfile);
			List<DepartmentVO> department = departmentService.findAll();
			List<GroupVO> groupList = groupService.findAll();
			model.addAttribute("groupList", groupList);
			model.addAttribute("userProfile", userProfile);
			model.put("roles", userRoleService.findAll());
			model.addAttribute("department", department);
			if (null != userProfile.getProfilePic()) {
				try {
					byte[] encodeBase64 = Base64.getEncoder().encode(userProfile.getProfilePic());
					String base64DataString = new String(encodeBase64, "UTF-8");
					model.addAttribute("pic", base64DataString);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "admin/userManagementAdminPage";
	}

	@RequestMapping(value = "/admin/deleteUser", method = RequestMethod.POST)
	public String deleteUser(ModelMap model, @ModelAttribute("deleteUserForm") ProfileForm deleteUserForm,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside admin deleteUser.");
		UserProfile userProfile = profileDao.find(Integer.valueOf(deleteUserForm.getProfileId()));
		loginService.updateLoginInfo(userProfile);
		return "redirect:/admin/getUserList";
	}

	@RequestMapping(value = "/admin/getUserList", method = RequestMethod.GET)
	public String getUserList(@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		logger.info("Inside admin getUserList.");
		model.put("users", loginService.findUser(false, 10, null != page ? (page * 10) : 0));
		int count = Integer.parseInt(loginService.count()) / 10;
		float floatCount = Float.valueOf(loginService.count()) / 10;

		if (null != loginService.count() && !loginService.count().equals("0")) {
			model.put("pages", (floatCount - count > 0.0 ? count + 1 : count));
		}
		model.addAttribute("userUpdateStatus", model.get("userUpdatedSuccessfully"));
		return "admin/userList";
	}

	@RequestMapping(value = "/admin/updateInfoAdmin", method = RequestMethod.POST)
	public String updateInfoAdmin(@ModelAttribute("document") UserDetailVO userDetailVO,
			@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redir) {
		logger.info("Inside admin updateInfoAdmin.");
		try {
			registrationService.updateProfile(userDetailVO, file.isEmpty()? null: file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		redir.addFlashAttribute("userUpdatedSuccessfully", SUCCESS);
		return "redirect:/admin/getUserList";
	}

	@RequestMapping(value = "/admin/registerUser", method = RequestMethod.GET)
	public String registerUser(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("Inside admin registerUser.");
		model.addAttribute("groupList", groupService.findAll());
		model.addAttribute("role", userRoleService.findAll());
		model.addAttribute("dept", departmentService.findAll());
		model.addAttribute("division", divisionService.findAll());
		return "admin/registerExecutive";
	}

	@RequestMapping(value = "/admin/getLoginLog", method = { RequestMethod.GET, RequestMethod.POST })
	public String getLoginLog(@ModelAttribute("byDateVO") ByDateVO byDateVO, ModelMap model,
			@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("Inside admin registerUser.");
		List<LoginLogVO> loginLog = loginService.getLoginLogByDate(byDateVO.getFilterByDate(), false, 50,
				null != page ? (page * 50) : 0);

		int count = Integer.parseInt(loginService.loginLogCount()) / 50;
		float floatCount = Float.valueOf(loginService.loginLogCount()) / 50;

		if (null != loginService.loginLogCount() && !loginService.loginLogCount().equals("0")) {
			model.put("pages", (floatCount - count > 0.0 ? count + 1 : count));
		}

		Collections.sort(loginLog, new Comparator<LoginLogVO>() {
			public int compare(LoginLogVO obj1, LoginLogVO obj2) {
				return obj2.getLoginAt().compareTo(obj1.getLoginAt());
			}
		});
		model.addAttribute("loginDate", byDateVO.getFilterByDate());
		model.addAttribute("loginLog", loginLog);
		return "admin/getLoginLogPage";
	}

	@RequestMapping(value = "/admin/executive.html", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public String registerUser(ModelMap model, @ModelAttribute("registerLoginBean") RegisterLoginBean registerLoginBean,
			@RequestParam("file") MultipartFile file, RedirectAttributes redir) {
		logger.info("Inside admin registerUser."+PrintUtil.getObjectInfo(registerLoginBean.getProfile().getFormation()));
		System.out.println("Inside admin registerUser."+PrintUtil.getObjectInfo(registerLoginBean.getProfile().getFormation()));
		LoggedInUser createdBy = SecurityUtils.getLoggedInUser();
		try {
			registrationService.registerUserFromAdmin(registerLoginBean, createdBy,file.isEmpty()? null: file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "registrationWelcome";
	}

	@RequestMapping(value = "/admin/updateInfo", method = RequestMethod.POST)
	public String updateInfo(@ModelAttribute("document") UserDetailVO userDetailVO,
			@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		try {
			registrationService.updateProfile(userDetailVO, file.isEmpty()? null: file.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "registrationWelcome";
	}
}
