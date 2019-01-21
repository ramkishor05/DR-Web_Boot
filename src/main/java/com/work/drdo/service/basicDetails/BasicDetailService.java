package com.work.drdo.service.basicDetails;

import com.work.drdo.domain.questionnaire.BasicDetailsVO;

public interface BasicDetailService {

	public BasicDetailsVO getBasicDetailsById(Integer basicDetailId);

	public void updateBasicDetails(BasicDetailsVO basicDetailsVO);
}
