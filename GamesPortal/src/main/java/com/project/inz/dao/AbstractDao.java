package com.project.inz.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public abstract class AbstractDao<PK extends Serializable, T>{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Class<T> persistentClass;

	 @SuppressWarnings("unchecked")
	public AbstractDao() {
		 this.persistentClass =(Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	}

	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public T getById(Integer id) {
		return (T) getSession().get(persistentClass, id);
	}

	protected Criteria createCriteria() {
		return getSession().createCriteria(persistentClass);
	}
	

	protected Query createQuery(String query) {
		return getSession().createQuery(query);
	}

	public void save(T object) {
		getSession().save(object);
	}

	public void saveOrUpdate(T object) {
		getSession().saveOrUpdate(object);
	}

	public void update(T object) {
		getSession().update(object);
	}

	public void delete(T object) {
		getSession().delete(object);
	}
	
	public void persist(T entity) {
	       getSession().persist(entity);
	    }
	
	
	
//	public void update(Object entity) {
//        getSession().merge(entity);
//    }

}