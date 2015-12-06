package com.project.inz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.CategoryDao;
import com.project.inz.model.Category;
import com.project.inz.service.CategoryService;

@Service("categoryservice")
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public Category findById(Integer id) {
		return categoryDao.findById(id);
	}

	@Override
	public void saveCategory(Category category) {
		categoryDao.save(category);
		
	}

	@Override
	public void updateCategory(Category category) {
		categoryDao.updateCategory(category);		
	}

	@Override
	public void deleteCategory(Integer id) {
		categoryDao.deleteById(id);		
	}

	@Override
	public List<Category> findAllCategories() {
		return categoryDao.getAllCategories();
	}

}
