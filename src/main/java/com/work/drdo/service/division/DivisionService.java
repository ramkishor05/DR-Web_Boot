package com.work.drdo.service.division;

import java.util.List;

import com.work.drdo.domain.questionnaire.DivisionVO;
import com.work.drdo.executive.entity.Division;

public interface DivisionService {
	public String saveDivision(DivisionVO divisionVO);
    public DivisionVO find(Integer id);
    public Division findById(Integer id);
    public List<DivisionVO> findAll();
    public List<DivisionVO> find(Boolean all, Integer max, Integer first);
    public String count();
    public void updateDivision(DivisionVO divisionVO);
    public void deleteDivisionById(DivisionVO divisionVO);
    public List<DivisionVO> findDivisionList(String commissionerateId, String divisionId);
}
