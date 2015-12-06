package com.project.inz.dao;

import java.util.Set;

import com.project.inz.model.AuthorEntity;
import com.project.inz.model.BookEntity;

public interface AuthorDao {
	
	AuthorEntity findById(Integer id);
	Set<AuthorEntity> getAllAuthors();

}
