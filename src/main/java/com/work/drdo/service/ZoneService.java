package com.work.drdo.service;

import java.util.List;

import com.work.drdo.domain.questionnaire.ZoneVO;

public interface ZoneService {
    
    public String saveZone(ZoneVO zoneVO);
    public List<ZoneVO> findAll();
    public ZoneVO findById(Integer id);
    public void deleteZoneById(int id);
    public List<ZoneVO> findZoneByDeptId(Integer deptId);
}
