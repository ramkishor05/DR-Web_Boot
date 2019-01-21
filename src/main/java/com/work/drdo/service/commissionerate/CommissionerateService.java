package com.work.drdo.service.commissionerate;

import java.util.List;

import com.work.drdo.domain.questionnaire.CommissionerateVO;

public interface CommissionerateService {
	public String saveCommissionerate(CommissionerateVO commissionerateVO);
    public CommissionerateVO find(Integer id);
    public List<CommissionerateVO> find(Boolean all, Integer max, Integer first);
    public String count();
    public List<CommissionerateVO> findCommissionerateList(String zoneId);
    public void updateCommissionerate(CommissionerateVO commissionerateVO);
    public void deleteCommissionerateById(CommissionerateVO commissionerateVO);
    /*public CommissionerateVO findById(Integer id);
    public void deleteCommissionerateById(int id);
    public List<CommissionerateVO> findCommissionerateByDeptId(Integer deptId);*/
}
