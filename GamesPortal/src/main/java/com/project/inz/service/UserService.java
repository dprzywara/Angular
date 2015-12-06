package com.project.inz.service;
import java.util.List;

import com.project.inz.model.User;

 
public interface UserService {
 
    User findById(int id);
     
    void saveUser(User user);
     
    void updateUser(User user);
     
    void deleteUserByLogin(String login);
    void deleteUser(Integer id);
    
 
    List<User> findAllUsers(); 
    List<String> getAllUsernames();
    User findUserByLogin(String login);
 
    boolean isUserExist(User u);
     
}