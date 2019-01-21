package com.work.drdo.service;

import java.util.List;

import com.work.drdo.domain.questionnaire.UserRoleVO;

public interface UserRoleService {
    public List<UserRoleVO> findAll();
    
    public UserRoleVO getUserRole(Integer id);
}
