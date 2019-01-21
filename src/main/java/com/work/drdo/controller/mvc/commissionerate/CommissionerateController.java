package com.work.drdo.controller.mvc.commissionerate;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.domain.questionnaire.CommissionerateVO;
import com.work.drdo.domain.questionnaire.DepartmentVO;
import com.work.drdo.domain.questionnaire.ZoneVO;
import com.work.drdo.service.ZoneService;
import com.work.drdo.service.commissionerate.CommissionerateService;
import com.work.drdo.service.department.DepartmentService;

@Controller
public class CommissionerateController {

	@Autowired
	private CommissionerateService commissionerateService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
    private ZoneService zoneService;
	private static final String SUCCESS = "SUCCESS";
	
	@RequestMapping(value = "/admin/saveCommissionerate", method = RequestMethod.POST)
	public String saveCommissionerate(@ModelAttribute("commissionerateVO") CommissionerateVO commissionerateVO, RedirectAttributes redir) {
		commissionerateService.saveCommissionerate(commissionerateVO);
		redir.addFlashAttribute("commissionerateUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Commissionerate has been successfully added");
		return "redirect:/admin/getCommissionerateList";
	}

	@RequestMapping(value = "/admin/getCommissionerateList", method = RequestMethod.GET)
	public String getCommissionerateList(@RequestParam(value = "page", required = false) Integer page,
			HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		List<CommissionerateVO> commissionerateVOList = commissionerateService.find(false, 10,
				null != page ? (page * 10) : 0);
		model.put("commissionerateList", commissionerateVOList);
		String commissionerateCount = commissionerateService.count();
		int count = Integer.parseInt(commissionerateCount) / 10;
		float floatCount = Float.valueOf(commissionerateCount) / 10;
		if (null != commissionerateCount && !commissionerateCount.equals("0")) {
			model.put("pages", (floatCount - count > 0.0 ? count + 1 : count));
		}
		model.addAttribute("commissionerateUpdateStatus", model.get("commissionerateUpdateStatus"));
    	model.addAttribute("message", model.get("message"));
		return "admin/commissionerateList";
	}
	
	@RequestMapping(value = "/admin/editCommissionerate/{commissionerateId}", method = RequestMethod.GET)
	public String editCommissionerate(@PathVariable Integer commissionerateId, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		//List<Department> department= 	departmentDAO.findAll();
		List<DepartmentVO> department = departmentService.findAll();
		List<ZoneVO> zoneList = zoneService.findAll();
		List<ZoneVO> gstZones =  zoneService.findZoneByDeptId(1);
		List<ZoneVO> customExZones =  zoneService.findZoneByDeptId(2);
		CommissionerateVO commissionerateVO = commissionerateService.find(commissionerateId);
		model.addAttribute("commissionerateVO", commissionerateVO);
		model.addAttribute("gstZones", gstZones);
		model.addAttribute("customExZones", customExZones);
		model.addAttribute("zoneVO", zoneList);
		model.addAttribute("department", department);
		model.addAttribute("commissionerateId", commissionerateId);
		return "admin/editCommissionerate";
	}
	
	@RequestMapping(value = "/admin/updateCommissionerate", method = RequestMethod.POST)
	public String updateCommissionerate(@ModelAttribute("commissionerateVO") CommissionerateVO commissionerateVO, RedirectAttributes redir) {
		commissionerateService.updateCommissionerate(commissionerateVO);
		redir.addFlashAttribute("commissionerateUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Commissionerate has been successfully updated");
		return "redirect:/admin/getCommissionerateList";
	}
	
	@RequestMapping(value = "/admin/deleteCommissionerate/{commissionerateId}", method = RequestMethod.GET)
	public String deleteCommissionerate(@PathVariable Integer commissionerateId, RedirectAttributes redir) {
		CommissionerateVO commissionerateVO = commissionerateService.find(commissionerateId);
		commissionerateService.deleteCommissionerateById(commissionerateVO);
		redir.addFlashAttribute("commissionerateUpdateStatus", SUCCESS);
    	redir.addFlashAttribute("message", "Commissionerate has been successfully deleted");
		return "redirect:/admin/getCommissionerateList";
	}

}
