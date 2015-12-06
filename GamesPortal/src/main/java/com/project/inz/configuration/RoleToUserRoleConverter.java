package com.project.inz.configuration;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.project.inz.model.UserRole;
import com.project.inz.service.RoleService;

/**
 * A converter class used in views to map id's to actual userProfile objects.
 */
@Component
public class RoleToUserRoleConverter implements Converter<Object, UserRole>{

	@Autowired
	RoleService roleService;

	public UserRole convert(Object element) {
		Integer id = Integer.parseInt((String)element);
		UserRole profile= roleService.getRole(id);
		System.out.println("Role : "+profile);
		return profile;
	}
	
}