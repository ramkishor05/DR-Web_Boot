package com.work.drdo.service.basicDetails;

import com.work.drdo.executive.entity.UserProjectDetail;

public interface UserProjectDetailService {

	UserProjectDetail addProjectDetail(UserProjectDetail projectDetail);

	UserProjectDetail updateProjectDetail(UserProjectDetail projectDetail);

	UserProjectDetail deleteProjectDetail(UserProjectDetail projectDetail);

	UserProjectDetail getProjectDetail(UserProjectDetail projectDetail);

}
