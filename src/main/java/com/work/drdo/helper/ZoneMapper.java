package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.ZoneVO;
import com.work.drdo.executive.entity.Zone;

public class ZoneMapper {

    public static Zone mapToDB(ZoneVO zoneVO) {
	Zone zone = new Zone();
	zone.setZoneId(zoneVO.getZoneId());
	zone.setZoneName(zoneVO.getZoneName());
	zone.setComment(zoneVO.getComment());
	
	return zone;
    }

    public static ZoneVO mapFromDB(Zone zoneList) {
	    ZoneVO zoneVOs = new ZoneVO();
	    if(null!=zoneList){
		    zoneVOs.setZoneId(zoneList.getZoneId());
		    zoneVOs.setZoneName(zoneList.getZoneName());
		    zoneVOs.setComment(zoneList.getComment());
		    if(null != zoneList.getDepartment()){
		    	zoneVOs.setDepartmentId(zoneList.getDepartment().getDeptId());
		    	zoneVOs.setDepartmentName(zoneList.getDepartment().getDeptName());
		    }
    	}
	return zoneVOs;
    }
}
