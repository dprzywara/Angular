package com.project.inz.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.BookDao;
import com.project.inz.dao.UserRoleDao;
import com.project.inz.model.BookEntity;
import com.project.inz.model.Category;
import com.project.inz.model.Quiz;
import com.project.inz.model.UserRole;


@Repository("bookDao")
public class AuthorDaoImpl extends AbstractDao<Integer,BookEntity> implements BookDao {

	@Override
	public BookEntity findById(Integer id) {
		return getById(id);
	}


	@SuppressWarnings("unchecked")
	public UserRole getRola(String rola) {
		Criteria c = super.createCriteria();
		c.add(Restrictions.like("rola", rola));
		List<UserRole> res = c.list();
		
		if(!res.isEmpty()){
			return res.get(0);
		} 		
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public UserRole getRolaById(Integer id) {
		Criteria c = super.createCriteria();
		c.add(Restrictions.like("id", id));
		List<UserRole> res = c.list();
		
		if(!res.isEmpty()){
			return res.get(0);
		} 		
		
		return null;
	}

	

	

	

	@SuppressWarnings("unchecked")
	@Override
	public List<BookEntity> findAllBooks() {
		Criteria criteria = createCriteria();
		Set<BookEntity> tempRolesSet = new HashSet<BookEntity>(criteria.list());
		List<BookEntity> list = new ArrayList<BookEntity>(tempRolesSet);
        return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookEntity> findBooksByTitle(String title) {
		Criteria criteria = createCriteria();
		criteria.add(Restrictions.eq("title", title));
		return (List<BookEntity>) criteria.list();
	}


	@Override
	public BookEntity saveBook(BookEntity book) {
		persist(book);
		return null;
	}

	@Override
	public void deleteBook(Integer id) {
		delete(findById(id));
		
	}
}
