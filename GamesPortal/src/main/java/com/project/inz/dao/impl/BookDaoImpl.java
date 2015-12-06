package com.project.inz.dao.impl;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.AuthorDao;
import com.project.inz.model.AuthorEntity;


@Repository("authorDao")
public class BookDaoImpl extends AbstractDao<Integer,AuthorEntity> implements AuthorDao {

	@Override
	public AuthorEntity findById(Integer id) {
		return getById(id);
	}




	

	

	@SuppressWarnings("unchecked")
	@Override
	public Set<AuthorEntity> getAllAuthors() {
		Criteria criteria = createCriteria();
		Set<AuthorEntity> tempRolesSet = new HashSet<AuthorEntity>(criteria.list());
        return tempRolesSet;
	}
}
