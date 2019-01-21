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
		    if(null != zoneList.getDepartmentId()){
		    	zoneVOs.setDepartmentId(zoneList.getDepartmentId().getDeptId());
		    	zoneVOs.setDepartmentName(zoneList.getDepartmentId().getDeptName());
		    }
    	}
	return zoneVOs;
    }
}
