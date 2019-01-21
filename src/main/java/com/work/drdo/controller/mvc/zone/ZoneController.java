package com.work.drdo.controller.mvc.zone;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.work.drdo.dao.DepartmentDAO;
import com.work.drdo.dao.ZoneDAO;
import com.work.drdo.domain.questionnaire.ZoneVO;
import com.work.drdo.executive.entity.Department;
import com.work.drdo.service.ZoneService;

@Controller
public class ZoneController {
	private static final Logger logger = LoggerFactory.getLogger(ZoneController.class);
	private static final String SUCCESS = "SUCCESS";

	@Autowired
	private ZoneService zoneService;
	@Autowired
	private ZoneDAO zoneDAO;
	@Autowired
	DepartmentDAO departmentDAO;

	@RequestMapping(value = "/admin/createZone", method = RequestMethod.GET)
	public String createZone(ZoneVO zoneVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		logger.info("admin/createZone");
		List<Department> department = departmentDAO.findAll();
		List<ZoneVO> zoneList = zoneService.findAll();
		List<ZoneVO> gstZones = zoneService.findZoneByDeptId(1);
		List<ZoneVO> customExZones = zoneService.findZoneByDeptId(2);
		model.addAttribute("gstZones", gstZones);
		model.addAttribute("customExZones", customExZones);
		model.addAttribute("zoneVO", zoneList);
		model.addAttribute("department", department);
		return "admin/zoneView";
	}

	@RequestMapping(value = "/admin/getZoneList", method = RequestMethod.GET)
	public String getZoneList(@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		model.put("zones", zoneDAO.find(false, 10, null != page ? (page * 10) : 0));
		int count = Integer.parseInt(zoneDAO.count()) / 10;
		float floatCount = Float.valueOf(zoneDAO.count()) / 10;

		if (null != zoneDAO.count() && !zoneDAO.count().equals("0")) {
			model.put("pages", (floatCount - count > 0.0 ? count + 1 : count));
		}
		model.addAttribute("zoneUpdateStatus", model.get("zoneUpdateStatus"));
		model.addAttribute("message", model.get("message"));
		return "admin/zoneList";
	}

	@RequestMapping(value = "/admin/saveZone", method = RequestMethod.POST)
	public String saveZone(@ModelAttribute("zoneVO") ZoneVO zoneVO, RedirectAttributes redir) {
		zoneService.saveZone(zoneVO);
		redir.addFlashAttribute("zoneUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Zone has been successfully added/updated");
		return "redirect:/admin/getZoneList";
	}

	@RequestMapping(value = { "/admin/delete-zone-{zoneId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int zoneId, RedirectAttributes redir) {
		zoneService.deleteZoneById(zoneId);
		redir.addFlashAttribute("zoneUpdateStatus", SUCCESS);
		redir.addFlashAttribute("message", "Zone has been successfully deleted");
		return "redirect:/admin/getZoneList";
	}

	@RequestMapping(value = "/admin/editZone/{zoneId}", method = RequestMethod.GET)
	public String editZone(HttpServletRequest request, HttpServletResponse response, @PathVariable int zoneId,
			ModelMap model) {
		ZoneVO vo = zoneService.findById(zoneId);
		model.addAttribute("zoneId", vo.getZoneId());
		model.addAttribute("zoneName", vo.getZoneName());
		model.addAttribute("deptName", vo.getDepartmentName());
		model.addAttribute("departmentId", vo.getDepartmentId());
		model.addAttribute("comment", vo.getComment());
		return "admin/editZone";
	}

}
