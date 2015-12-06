package com.project.inz.dao;

import java.util.List;

import com.project.inz.model.UserRole;

public interface UserRoleDao {
	
	public List<UserRole> getAllRole();
	public UserRole getRola(String rola);
	public void saveRole (UserRole role); 
	public UserRole getRole(Integer id);
	public void deleteRole(Integer id);
	 public UserRole getRolaById(Integer id);
}
