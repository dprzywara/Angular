package com.project.inz.service;
import java.util.List;

import com.project.inz.model.Invitation;

 
public interface InvitationService {
 
    Invitation findById(Integer id);
     
    void saveInvitation(Invitation invitation);
     
    void updateInvitation(Invitation invitation);
     
    void deleteInvitation(Integer id);
 
    List<Invitation> findAllInvitations(); 
    List<Invitation> getAllUserInvitations(Integer id); 
     
     
}