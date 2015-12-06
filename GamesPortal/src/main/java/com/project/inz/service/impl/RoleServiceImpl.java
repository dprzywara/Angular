package com.project.inz.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.UserRoleDao;
import com.project.inz.model.UserRole;
import com.project.inz.service.RoleService;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private UserRoleDao roleDao;


	public void saveRole(UserRole role) {
		roleDao.saveRole(role);
	}

	
	public List<UserRole> listRoles() {
		return roleDao.getAllRole();
	}


	public UserRole getRole(Integer id) {
		return roleDao.getRole(id);
	}

	public void deleteRole(Integer id) {
		roleDao.deleteRole(id);
	}

}
