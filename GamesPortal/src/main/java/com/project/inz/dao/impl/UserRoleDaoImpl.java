package com.project.inz.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.UserRoleDao;
import com.project.inz.model.UserRole;


@Repository("userRoleDao")
public class UserRoleDaoImpl extends AbstractDao<Integer,UserRole> implements UserRoleDao {

	
	 public UserRole findById(Integer id) {
	        return  getById(id);
	    }

	@SuppressWarnings("unchecked")
	public List<UserRole> getAllRole() {
		
		Criteria criteria = createCriteria();
		Set<UserRole> tempRolesSet = new HashSet<UserRole>(criteria.list());
		List<UserRole> list = new ArrayList<UserRole>(tempRolesSet);
        return list;
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

	@Override
	public void saveRole(UserRole role) {
		persist(role);
		
	}

	@Override
	public UserRole getRole(Integer id) {
		return  findById(id);
	}

	@Override
	public void deleteRole(Integer id) {
delete(findById(id));
	}
}
