package com.work.drdo.service.zone.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.DepartmentDAO;
import com.work.drdo.dao.ZoneDAO;
import com.work.drdo.domain.questionnaire.ZoneVO;
import com.work.drdo.executive.entity.Zone;
import com.work.drdo.helper.ZoneMapper;
import com.work.drdo.service.ZoneService;

@Service("zoneService")
@Transactional(propagation = Propagation.REQUIRED)
public class ZoneServiceImpl implements ZoneService {

    @Autowired
    public ZoneDAO zoneDAO;
    @Autowired 
    public DepartmentDAO departmentDAO;
    @Override
    public String saveZone(ZoneVO zoneVO) {
	String zoneId = null;
	try {
	    Zone zone = ZoneMapper.mapToDB(zoneVO);
			if (null != zoneVO.zoneId) {
				zone.setDepartment(departmentDAO.find(zoneVO.getDepartmentId()));
				zoneDAO.merge(zone);
			} else {
				zone.setDepartment(departmentDAO.find(zoneVO.getDepartmentId()));
				zoneId = zoneDAO.saveZone(zone);
			}
	} catch (Exception ex) {
	    ex.printStackTrace();
	}
	return zoneId;
    }
    
    public List<ZoneVO> findAll() {
	List<Zone> zones = zoneDAO.findAll();
	List<ZoneVO>  zones1 = new ArrayList<>();
	for(Zone zone : zones){
	   ZoneVO zoneVO = ZoneMapper.mapFromDB(zone);
	   zones1.add(zoneVO);
	}
        return zones1;
    }

	@Override
	public ZoneVO findById(Integer id) {
    	Zone zone = zoneDAO.find(id);
    	ZoneVO zoneVO = ZoneMapper.mapFromDB(zone);
    	return zoneVO;
    }
	
	@Override
	 public List<ZoneVO> findZoneByDeptId(Integer deptId){
		List<Zone> zones = zoneDAO.findZoneByDeptId(deptId);
		List<ZoneVO>  zones1 = new ArrayList<>();
		for(Zone zone : zones){
			   ZoneVO zoneVO = ZoneMapper.mapFromDB(zone);
			   zones1.add(zoneVO);
			}
		return zones1;
	 }
	
	@Override
	public void deleteZoneById(int id) {
		zoneDAO.remove(zoneDAO.getZone(id));
	}
    
}
