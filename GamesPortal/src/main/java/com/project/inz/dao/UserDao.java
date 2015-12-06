package com.project.inz.dao;
import java.util.List;

import com.project.inz.model.User;

 
public interface UserDao {
 
    User findById(Integer id);
 
    void saveUser(User user);
     
    void deleteUserByUsername(String username);
     
    List<User> findAllUsers();
    void deleteUser(Integer id);
    void updateUser(User user);
    User findUserByUsername(String username);
}