package com.work.drdo.service.commissionerate.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.CommissionerateDAO;
import com.work.drdo.dao.ZoneDAO;
import com.work.drdo.domain.questionnaire.CommissionerateVO;
import com.work.drdo.domain.questionnaire.ZoneVO;
import com.work.drdo.executive.entity.Commissionerate;
import com.work.drdo.executive.entity.Zone;
import com.work.drdo.helper.FormationMapper;
import com.work.drdo.helper.ZoneMapper;
import com.work.drdo.service.commissionerate.CommissionerateService;

@Service("commissionerateService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommissionerateServiceImpl implements CommissionerateService {

	@Autowired
	private CommissionerateDAO commissionerateDAO;
	@Autowired
	private ZoneDAO zoneDAO;
	
	@Override
	public String saveCommissionerate(CommissionerateVO commissionerateVO) {
		Commissionerate commissionerateId = null;
		try {
			Commissionerate commissionerate = FormationMapper.commissionerateMappingToDB(commissionerateVO);
			if(null!=commissionerateVO.getZoneId()){
				ZoneVO zone = findZoneDetail(commissionerateVO.getZoneId());
				commissionerate.setZone(ZoneMapper.mapToDB(zone));
			}
			 commissionerateId = commissionerateDAO.save(commissionerate);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return String.valueOf(commissionerateId.getCommissionerateId());
	}
	
	private ZoneVO findZoneDetail(String zoneId){
		Zone zone = zoneDAO.find(Integer.parseInt(zoneId));
		ZoneVO zoneVO = ZoneMapper.mapFromDB(zone);
		return zoneVO;
	}

	@Override
	public CommissionerateVO find(Integer id) {
		return FormationMapper.commissionerateMappingFromDB(commissionerateDAO.find(id));
	}

	@Override
	public List<CommissionerateVO> find(Boolean all, Integer max, Integer first) {
		List<Commissionerate> commissionerateList = commissionerateDAO.find(all, max, first);
		List<CommissionerateVO> CommissionerateVOList = new ArrayList<CommissionerateVO>();
		for (Commissionerate commissionerate : commissionerateList) {
			CommissionerateVO commissionerateVO = FormationMapper.commissionerateMappingFromDB(commissionerate);
			if (null != commissionerate.getZone()) {
				ZoneVO zone = findZoneDetail(String.valueOf(commissionerate.getZone().getZoneId()));
				commissionerateVO.setZoneId(zone.getZoneName());
				commissionerateVO.setDeptId(String.valueOf(zone.getDepartmentId()));
			}
			CommissionerateVOList.add(commissionerateVO);
		}
		return CommissionerateVOList;
	}

	@Override
	public String count() {
		return commissionerateDAO.count();
	}
	
	public List<CommissionerateVO> findCommissionerateList(String zoneId) {
		List<Commissionerate> commissionerateList = commissionerateDAO.findCommissionerateList(zoneId);
		List<CommissionerateVO> CommissionerateVOList = new ArrayList<CommissionerateVO>();
		if (CollectionUtils.isNotEmpty(commissionerateList)) {
			for (Commissionerate commissionerate : commissionerateList) {
				CommissionerateVO commissionerateVO = FormationMapper.commissionerateMappingFromDB(commissionerate);
				if (null != commissionerate.getZone()) {
					ZoneVO zone = findZoneDetail(String.valueOf(commissionerate.getZone().getZoneId()));
					commissionerateVO.setZoneId(zone.getZoneName());
					commissionerateVO.setDeptId(String.valueOf(zone.getDepartmentId()));
				}
				CommissionerateVOList.add(commissionerateVO);
			}
		}
		return CommissionerateVOList;
	}

	@Override
	public void updateCommissionerate(CommissionerateVO commissionerateVO) {
		Commissionerate commissionerate = FormationMapper.commissionerateMappingToDB(commissionerateVO);
		Zone zone = new Zone();
		zone.setZoneId(Integer.parseInt(commissionerateVO.getZoneId()));
		commissionerate.setZone(zone);
		commissionerateDAO.save(commissionerate);
		
	}

	@Override
	public void deleteCommissionerateById(CommissionerateVO commissionerateVO) {
		//commissionerateDAO.remove(FormationMapper.commissionerateMappingToDB(commissionerateVO));
		Commissionerate commissionerate = new Commissionerate();
		commissionerate.setCommissionerateId(commissionerateVO.getCommissionerateId());
		commissionerate.setCommissionerateName(commissionerateVO.getCommissionerateName());
		commissionerate.setComment(commissionerateVO.getCommissionerateComment());
		commissionerateDAO.remove(commissionerate);
	}

}
