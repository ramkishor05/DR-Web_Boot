package com.work.drdo.service.basicDetails;

import com.work.drdo.executive.entity.UserProject;

public interface UserProjectService {

	UserProject addProject(UserProject userProject);

	UserProject updateProject(UserProject userProject);

	UserProject deleteProject(UserProject userProject);

	UserProject getProject(UserProject userProject);


}
