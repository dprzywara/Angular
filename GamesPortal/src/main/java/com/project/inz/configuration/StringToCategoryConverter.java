package com.project.inz.configuration;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.project.inz.model.Category;
import com.project.inz.model.UserRole;
import com.project.inz.service.CategoryService;
import com.project.inz.service.RoleService;

/**
 * A converter class used in views to map id's to actual userProfile objects.
 */
@Component
public class StringToCategoryConverter implements Converter<String, Category>{

	@Autowired
	CategoryService categoryService;
	
	public StringToCategoryConverter(){}

	public Category convert(String element) {
		Integer id = Integer.parseInt((String)element);
		Category cat= categoryService.findById(id);
		System.out.println("convert to : "+cat);
		return cat;
	}
	
}