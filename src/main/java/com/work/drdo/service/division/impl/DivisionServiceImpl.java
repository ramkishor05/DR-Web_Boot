package com.work.drdo.service.division.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.work.drdo.dao.DivisionDAO;
import com.work.drdo.domain.questionnaire.DivisionVO;
import com.work.drdo.executive.entity.Division;
import com.work.drdo.helper.DivisionMapper;
import com.work.drdo.helper.FormationMapper;
import com.work.drdo.service.division.DivisionService;

@Service("divisionService")
@Transactional(propagation = Propagation.REQUIRED)
public class DivisionServiceImpl implements DivisionService {

	@Autowired
	private DivisionDAO divisionDAO;
	
	@Override
	public String saveDivision(DivisionVO divisionVO) {
		Division divisionId = null;
		try {
			Division division = DivisionMapper.mapToDB(divisionVO);
			divisionId = divisionDAO.save(division);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return String.valueOf(divisionId.getDivisionId());
	}

	@Override
	public DivisionVO find(Integer id) {
		return DivisionMapper.mapFromDB(divisionDAO.find(id));
	}
	
	@Override
	public Division findById(Integer id) {
		return divisionDAO.find(id);
	}

	@Override
	 public List<DivisionVO> findAll() {
		List<Division> divisions = divisionDAO.findAll();
		List<DivisionVO>  divisionList = new ArrayList<>();
		for(Division division : divisions){
			DivisionVO divisionVO = DivisionMapper.mapFromDB(division);
			divisionList.add(divisionVO);
		}
	        return divisionList;
	    }
	@Override
	public List<DivisionVO> find(Boolean all, Integer max, Integer first) {
	
		return null;
	}

	@Override
	public String count() {
		return divisionDAO.count();
	}

	public void updateDivision(DivisionVO divisionVO){
		Division division = DivisionMapper.mapToDB(divisionVO);
		divisionDAO.merge(division);
	}

	@Override
	public void deleteDivisionById(DivisionVO divisionVO) {
		divisionDAO.remove(FormationMapper.divisionMappingToDB(divisionVO));
	}
	
	@Override
	public List<DivisionVO> findDivisionList(String commissionerateId,String divisionId){
		return null;
	}
}
