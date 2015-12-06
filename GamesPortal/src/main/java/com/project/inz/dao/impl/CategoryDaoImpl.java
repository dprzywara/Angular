package com.project.inz.dao.impl;
import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.CategoryDao;
import com.project.inz.model.Category;
 
@Repository("categoryDao")
public class CategoryDaoImpl extends AbstractDao<Integer, Category> implements CategoryDao {

 

	@Override
	public Category findById(Integer id) {
		return getById(id);
	}


	@Override
	public void save(Category cat) {
		persist(cat);
		
		//merge(cat);
		//saveOrUpdate(cat);
		
	}

	@Override
	public void updateCategory(Category category) {
		update(category);
	}

	@Override
	public void deleteById(Integer id) {
		delete(findById(id));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getAllCategories() {
		Criteria criteria = createCriteria();
        return (List<Category>) criteria.list();
	}


	
}