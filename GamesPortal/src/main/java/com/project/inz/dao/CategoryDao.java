package com.project.inz.dao;
import java.util.List;

import com.project.inz.model.Category;

 
public interface CategoryDao {
 
	Category findById(Integer id);
 
    void save(Category category);
    
    void updateCategory(Category category);
     
    void deleteById(Integer id);
     
    List<Category> getAllCategories();
    
 
}