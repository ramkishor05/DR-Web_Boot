package com.work.drdo.helper;

import com.work.drdo.domain.questionnaire.DivisionVO;
import com.work.drdo.executive.entity.Division;

public class DivisionMapper {
	
	public static DivisionVO mapFromDB(Division division){
		DivisionVO divisionVO = new DivisionVO();
		divisionVO.setDivisionId(division.getDivisionId());
		divisionVO.setDivisionName(division.getDivisionName());
		divisionVO.setDivisionComment(division.getDivisionComment());
		return divisionVO;
	}

	public static Division mapToDB(DivisionVO divisionVO){
		Division division = new Division();
		division.setDivisionId(divisionVO.getDivisionId());
		division.setDivisionName(divisionVO.getDivisionName());
		division.setDivisionComment(divisionVO.getDivisionComment());
		return division;
	}
}
