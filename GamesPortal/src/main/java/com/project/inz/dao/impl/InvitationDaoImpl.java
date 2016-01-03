package com.project.inz.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.InvitationDao;
import com.project.inz.model.Invitation;

@Repository("invitationdao")
public class InvitationDaoImpl extends AbstractDao<Integer, Invitation> implements InvitationDao {

	@Override
	public Invitation findById(Integer id) {
		return getById(id);
	}

	@Override
	public void save(Invitation invitation) {
		persist(invitation);
		
	}

	@Override
	public void updateInvitation(Invitation invitation) {
		update(invitation);
		
	}

	@Override
	public void deleteById(Integer id) {
		delete(findById(id));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Invitation> getAllInvitations() {
		Criteria criteria = createCriteria();
        return (List<Invitation>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Invitation> getInvitationsForUser(Integer id) {
		Criteria criteria = createCriteria();
        criteria.add(Restrictions.eq("invited.id", id));
        criteria.add(Restrictions.eq("status", "invited"));
        return (List<Invitation>) criteria.list();
	}

}
