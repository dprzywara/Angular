package com.project.inz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.InvitationDao;
import com.project.inz.model.Invitation;
import com.project.inz.service.InvitationService;

@Service("invitationservice")
@Transactional
public class InvitationServiceImpl implements InvitationService {

	@Autowired
	InvitationDao invitationDao;

	@Override
	public Invitation findById(Integer id) {
		return invitationDao.findById(id);
	}

	@Override
	public void saveInvitation(Invitation invitation) {
		invitationDao.save(invitation);
	}

	@Override
	public void updateInvitation(Invitation invitation) {
		invitationDao.updateInvitation(invitation);
	}

	@Override
	public void deleteInvitation(Integer id) {
		invitationDao.deleteById(id);
	}

	@Override
	public List<Invitation> findAllInvitations() {
		return invitationDao.getAllInvitations();
	}

	@Override
	public List<Invitation> getAllUserInvitations(Integer id) {
		return invitationDao.getInvitationsForUser(id);
	}

}
