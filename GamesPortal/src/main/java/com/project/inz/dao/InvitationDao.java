package com.project.inz.dao;
import java.util.List;

import com.project.inz.model.Invitation;

 
public interface InvitationDao {
 
	Invitation findById(Integer id);
 
    void save(Invitation invitation);
    
    void updateInvitation(Invitation invitation);
     
    void deleteById(Integer id);
     
    List<Invitation> getAllInvitations();
    List<Invitation> getInvitationsForUser(Integer id);
    
 
}