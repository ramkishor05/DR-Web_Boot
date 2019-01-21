package com.work.drdo.controller.mvc.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.controller.mvc.zone.ZoneController;
import com.work.drdo.dao.UserProfileDAO;
import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.domain.questionnaire.DivisionVO;
import com.work.drdo.domain.questionnaire.GroupVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.executive.entity.Drdogroup;
import com.work.drdo.executive.entity.UserProfile;
import com.work.drdo.service.department.DepartmentService;
import com.work.drdo.service.division.DivisionService;
import com.work.drdo.service.group.GroupService;

@Controller
public class GroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(ZoneController.class);
	private static final String SUCCESS = "SUCCESS";
	
    @Autowired
    private GroupService groupService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private UserProfileDAO profileDao;
    @Autowired
    private DivisionService divisionService;
    
    //@RequestMapping(value = "/admin/createGroup", method = RequestMethod.GET)
    @RequestMapping(value = "/admin/getGroupList", method = RequestMethod.GET)
	public String getGroupList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {	
    	logger.info("GroupController /admin/getGroupList");
    	List<Drdogroup> groupList = groupService.getAllGroup();
    	model.addAttribute("groupList", groupList);
    	model.addAttribute("confirmGroupStatus", model.get("confirmGroupStatus"));
		return "admin/groupListPage";
	}
    
    @RequestMapping(value = "/admin/createGroup", method = RequestMethod.GET)
	public String createGroup(ModelMap model, HttpServletRequest request, HttpServletResponse response) {	
	  	List<UserProfile> profile = profileDao.find(true,null,null);
    	model.addAttribute("profile", profile);
    	model.addAttribute("division", divisionService.findAll());
    	model.addAttribute("dept", departmentService.findAll());
		return "admin/createNewGroup";
	}
    
    @RequestMapping(value = "/admin/getDeptList", method = RequestMethod.GET)
	public String deptManagement(ModelMap model, HttpServletRequest request, HttpServletResponse response) {	
    	List<Department> deptList = departmentService.getAllDept();
    	model.addAttribute("deptList", deptList);
    	model.addAttribute("deptUpdateStatus", model.get("deptUpdateStatus"));
		return "admin/deptList";
	}
    
    @RequestMapping(value = "/admin/createDepartment", method = RequestMethod.GET)
   	public String createDepartment(ModelMap model, HttpServletRequest request, HttpServletResponse response) {	
   	  	List<UserProfile> profile = profileDao.find(true,null,null);
       	model.addAttribute("profile", profile);
    	model.addAttribute("division", divisionService.findAll());
   		return "admin/createNewDept";
   	}
    
    @RequestMapping(value = "/admin/getDivisionList", method = RequestMethod.GET)
	public String getDivisionList(ModelMap model, HttpServletRequest request, HttpServletResponse response) {	
    	List<DivisionVO> divisionList = divisionService.findAll();
    	model.addAttribute("divisionList", divisionList);
    	model.addAttribute("deptUpdateStatus", model.get("deptUpdateStatus"));
		return "admin/divisionList";
	}
    
    @RequestMapping(value = "/admin/createDivision", method = RequestMethod.GET)
   	public String createDivision(ModelMap model, HttpServletRequest request, HttpServletResponse response) {	
   	  	List<UserProfile> profile = profileDao.find(true,null,null);
       	model.addAttribute("profile", profile);
   		return "admin/createNewDivision";
   	}
    
    @RequestMapping(value = "/admin/saveDivision", method = RequestMethod.POST)
    public String saveDivision(@ModelAttribute("divisionVO") DivisionVO divisionVO, RedirectAttributes redir) {
	    divisionService.saveDivision(divisionVO);
		redir.addFlashAttribute("deptUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Division has been successfully added");
		return "redirect:/admin/getDivisionList";
    }
    
	@RequestMapping(value = "/admin/editDivision/{divisionId}", method = RequestMethod.GET)
	public String editDivision(HttpServletRequest request, HttpServletResponse response, @PathVariable int divisionId,
			ModelMap model) {
		DivisionVO division = divisionService.find(divisionId);
		model.addAttribute("division",division);
		return "admin/editDivisionPage";
	}
    
    @RequestMapping(value = "/admin/updateDivision", method = RequestMethod.POST)
    public String updateDivision(@ModelAttribute("divisionVO") DivisionVO divisionVO, RedirectAttributes redir) {
    	divisionService.updateDivision(divisionVO);
	    redir.addFlashAttribute("deptUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Division has been successfully updated");
		return "redirect:/admin/getDivisionList";
    }
    
    @RequestMapping(value = "/admin/saveGroup", method = RequestMethod.POST)    
    public String saveDept(@ModelAttribute("groupVO") GroupVO groupVO, RedirectAttributes redir) {
		groupService.saveGroup(groupVO);
		redir.addFlashAttribute("confirmGroupStatus", SUCCESS);
		redir.addFlashAttribute("message", "Group has been successfully added");
		return "redirect:/admin/getGroupList";
    }
    
    @RequestMapping(value = "/admin/updateGroup", method = RequestMethod.POST)
    public String updateGroup(@ModelAttribute("groupVO") GroupVO groupVO,  RedirectAttributes redir) {
    	groupService.updateGroup(groupVO);
    	redir.addFlashAttribute("confirmGroupStatus", SUCCESS);
		redir.addFlashAttribute("message", "Group has been successfully updated");
		return "redirect:/admin/getGroupList";
    }
    
    @RequestMapping(value = "/admin/saveDept", method = RequestMethod.POST)
    public String saveGroup(@ModelAttribute("departmentVO") DepartmentVO departmentVO, RedirectAttributes redir) {
	    departmentService.saveDept(departmentVO);
		redir.addFlashAttribute("deptUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Department has been successfully added");
		return "redirect:/admin/getDeptList";
    }
    
    @RequestMapping(value = "/admin/updateDept", method = RequestMethod.POST)
    public String updateDept(@ModelAttribute("departmentVO") DepartmentVO departmentVO, RedirectAttributes redir) {
	    departmentService.updateDepartment(departmentVO);
	    redir.addFlashAttribute("deptUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Department has been successfully updated");
		return "redirect:/admin/getDeptList";
    }
    
    @RequestMapping(value = { "/admin/delete-group-{groupId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int groupId, RedirectAttributes redir) {
    	groupService.deleteGroupById(groupId);
    	redir.addFlashAttribute("confirmGroupStatus", SUCCESS);
		redir.addFlashAttribute("message", "Group is successfully deleted");
		return "redirect:/admin/getGroupList";
	}
    
	@RequestMapping(value = "/admin/editGroup/{groupId}", method = RequestMethod.GET)
	public String editZone(HttpServletRequest request, HttpServletResponse response, @PathVariable int groupId,
			ModelMap model) {
		GroupVO group = groupService.findById(groupId);
		List<UserProfile> user = profileDao.getUserProfileByGroupId(groupId);
		List<UserProfile> profile = profileDao.find(true,null,null);
    	model.addAttribute("profile", profile);
		model.addAttribute("groupId",group);
		model.addAttribute("userList",user);
		return "admin/editGroupPage";
	}

	@RequestMapping(value = { "/admin/delete-dept-{deptId}" }, method = RequestMethod.GET)
	public String deleteDept(@PathVariable int deptId, RedirectAttributes redir) {
		departmentService.deleteDeptById(deptId);
		redir.addFlashAttribute("deptUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Department is successfully deleted");
		return "redirect:/admin/getDeptList";
	}

	@RequestMapping(value = "/admin/editDept/{deptId}", method = RequestMethod.GET)
	public String editDepartment(HttpServletRequest request, HttpServletResponse response, @PathVariable int deptId,RedirectAttributes redir,
			ModelMap model) {
		DepartmentVO department = departmentService.find(deptId);
		List<UserProfile> user = profileDao.getUserProfileByDeptId(deptId);
		List<UserProfile> profile = profileDao.find(true,null,null);
    	model.addAttribute("profile", profile);
		model.addAttribute("deptId",department);
		model.addAttribute("userList",user);
		return "admin/editDeptPage";
	}
	
}
