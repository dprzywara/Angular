package com.project.inz.service;
import java.util.List;

import com.project.inz.model.Category;

 
public interface CategoryService {
 
    Category findById(Integer id);
     
    void saveCategory(Category category);
     
    void updateCategory(Category category);
     
    void deleteCategory(Integer id);
 
    List<Category> findAllCategories(); 
     
     
}