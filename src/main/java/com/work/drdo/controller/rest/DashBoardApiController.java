package com.work.drdo.controller.rest;

import java.sql.Timestamp;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.CommissionerateVO;
import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.domain.questionnaire.DivisionVO;
import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.domain.questionnaire.UserDetailVO;
import com.work.drdo.executive.entity.Thought;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.service.UserRoleService;
import com.work.drdo.service.ZoneService;
import com.work.drdo.service.attachmentdetail.AttachmentDetailService;
import com.work.drdo.service.commissionerate.CommissionerateService;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.diary.ThoughtService;
import com.work.drdo.service.division.DivisionService;
import com.work.drdo.service.group.GroupService;
import com.work.drdo.service.login.LoginService;
import com.work.drdo.utils.SecurityUtils;

@RestController
@RequestMapping(value = "/dashboard")
public class DashBoardApiController {
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ZoneService zoneService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private CommissionerateService commissionerateService;
	
	@Autowired
	private DivisionService divisionService;
	
	@Autowired
	private UserProfileDAO profileDao;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private AttachmentDetailService attachmentDetailService;
	
	@Autowired
	private ThoughtService thoughtService;

	private static final Logger logger = LoggerFactory.getLogger(DashBoardApiController.class);

	@RequestMapping(value = "/getProfilePic", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getProfilePic() {
		UserProfile user = profileDao.getReference(SecurityUtils.getUserProfile().getProfileId());
		if (null != user) {
			return user.getProfilePic();
		}
		return null;
	}

	@RequestMapping(value = "/getCommissionerateListByZone/{zoneId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getCommissionerateListByZone(@PathVariable String zoneId) {
		logger.info("getCommissionerateListByZone");
		List<CommissionerateVO> commissionerateList = commissionerateService.findCommissionerateList(zoneId);
		return commissionerateList;
	}

	@RequestMapping(value = "/getDivisionList/{commissionerateId}/{divisionId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getDivisionList(@PathVariable String commissionerateId, @PathVariable String divisionId) {
		List<DivisionVO> divisionList = divisionService.findDivisionList(commissionerateId, divisionId);
		return divisionList;
	}

	@RequestMapping(value = "/zones", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getZones() {
		if (null != zoneService.findAll()) {
			return zoneService.findAll();
		}
		return null;

	}

	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getRoles() {
		if (null != userRoleService.findAll()) {
			return userRoleService.findAll();
		}
		return null;

	}

	@RequestMapping(value = "/getGroupById/{groupId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getGroupById(@PathVariable Integer groupId) {
		GroupVO group = groupService.findById(groupId);
		return group;
	}

	@RequestMapping(value = "/getDeptById/{deptId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getDeptIdById(@PathVariable Integer deptId) {
		DepartmentVO department = departmentService.find(deptId);
		return department;
	}

	@RequestMapping(value = "/getGroupMember/{groupId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getGroupMember(@PathVariable Integer groupId) {
		List<UserDetailVO> profile = loginService.getUserProfileByGroupId(groupId);
		return profile;
	}

	@RequestMapping(value = "/getDeptMember/{deptId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getDeptMember(@PathVariable Integer deptId) {
		List<UserDetailVO> profile = loginService.getUserProfileByDeptId(deptId);
		return profile;
	}

	@RequestMapping(value = "/getDeptMemberCount/{deptId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getDeptMemberCount(@PathVariable Integer deptId) {
		String count = loginService.departmentMemberCount(deptId);
		return count;
	}

	@RequestMapping(value = "/getGroupMemberCount/{groupId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getGroupMemberCount(@PathVariable Integer groupId) {
		String count = loginService.groupMemberCount(groupId);
		return count;
	}

	@RequestMapping(value = "/getDeptByDivisionId/{divisionId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getDeptByDivisionId(@PathVariable Integer divisionId) {
		List<DepartmentVO> deptVO = departmentService.getDeptByDivisionId(divisionId);
		return deptVO;
	}

	@RequestMapping(value = "/getGroupByDeptId/{deptId}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public Object getGroupByDeptId(@PathVariable Integer deptId) {
		List<GroupVO> deptVO = groupService.getGroupByDeptId(deptId);
		return deptVO;
	}

	@RequestMapping(value = "/delete/{docId}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void getDeleteDocument(@PathVariable int docId) {
		try {
			attachmentDetailService.deleteById(docId);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@RequestMapping(value = "/currentThought", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody Thought getCurrentThought() {
		return thoughtService.getCurrentThought();
	}

	@RequestMapping(value = "/addThought", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public String addThought(@RequestBody Thought thought) {
		if (thought == null) {
			return "";
		}
		Timestamp currentDate = new Timestamp(new java.util.Date().getTime());
		thought.setModifyAt(currentDate);
		thought.setCreatedAt(currentDate);
		return thoughtService.saveThought(thought);
	}

	@RequestMapping(value = "/updateThought", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String updateThought(@RequestBody Thought thought) {
		Thought dbthoght = thoughtService.find(thought.getThoughtId());
		dbthoght.setDesciption(thought.getDesciption());
		dbthoght.setModifyAt(new Timestamp(new java.util.Date().getTime()));
		thoughtService.updateThought(dbthoght);
		return "{\"success\":1}";
	}
}
