package com.project.inz.service;


import java.util.List;

import com.project.inz.model.UserRole;

public interface RoleService {

	public void saveRole(UserRole role);

	public List<UserRole> listRoles();
	public UserRole getRole(Integer id);

	public void deleteRole(Integer id);
}
