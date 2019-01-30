package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.CommissionerateVO;
import com.work.drdo.domain.questionnaire.DivisionVO;
import com.work.drdo.executive.entity.Commissionerate;
import com.work.drdo.executive.entity.Division;

public class FormationMapper {
	
	public static Commissionerate commissionerateMappingToDB(CommissionerateVO commissionerateVO){		
		Commissionerate commissionerate = new Commissionerate();
		commissionerate.setCommissionerateId(commissionerateVO.getCommissionerateId());
		commissionerate.setCommissionerateName(commissionerateVO.getCommissionerateName());
		commissionerate.setComment(commissionerateVO.getCommissionerateComment());
		return commissionerate;
	}
	
	public static CommissionerateVO commissionerateMappingFromDB(Commissionerate commissionerate){
		CommissionerateVO commissionerateVO = new CommissionerateVO();
		commissionerateVO.setCommissionerateId(commissionerate.getCommissionerateId());
		commissionerateVO.setCommissionerateName(commissionerate.getCommissionerateName());
		commissionerateVO.setCommissionerateComment(commissionerate.getComment());
		commissionerateVO.setZoneId(ZoneMapper.mapFromDB(commissionerate.getZone()).getZoneName());
		commissionerateVO.setDeptId(null != commissionerate.getZone().getDepartment() ? 
				String.valueOf(commissionerate.getZone().getDepartment().getDeptId()): null);
		return commissionerateVO;
	}
	
	public static Division divisionMappingToDB(DivisionVO divisionVO){
		Division division = new Division();
		division.setDivisionId(divisionVO.getDivisionId());
		division.setDivisionName(divisionVO.getDivisionName());
		return division;
	}
	
	public static DivisionVO divisionMappingFromDB(Division division){
		DivisionVO divisionVO = new DivisionVO();
		divisionVO.setDivisionId(division.getDivisionId());
		divisionVO.setDivisionName(division.getDivisionName());
		return divisionVO;
	}
}
