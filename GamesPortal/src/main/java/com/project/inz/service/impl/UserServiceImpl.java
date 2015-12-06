package com.project.inz.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.UserDao;
import com.project.inz.model.User;
import com.project.inz.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	@Override
	public User findById(int id) {
		return dao.findById(id);
	}
	@Override
	public void saveUser(User employee) {
		dao.saveUser(employee);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate
	 * update explicitly. Just fetch the entity from db and update it with
	 * proper values within transaction. It will be updated in db once
	 * transaction ends.
	 */
	@Override
	public void updateUser(User user) {
		User entity = dao.findById(user.getId());
//		if (entity != null) {
//			entity.setUsername(user.getUsername());
//			entity.setPassword(user.getPassword());
//			entity.setFirstName(user.getFirstName());
//			entity.setLastName(user.getLastName());
//			entity.setEmail(user.getEmail());
//			entity.setRoles(user.getRoles());
//			entity.setEnabled(user.isEnabled());
//		}
		dao.updateUser(user);
	}
	@Override
	public void deleteUserByLogin(String login) {
		dao.deleteUserByUsername(login);
	}
	@Override
	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}
	@Override
	public User findUserByLogin(String login) {
		return dao.findUserByUsername(login);
	}
	@Override
	public boolean isUserExist(User u) {
		User user = findUserByLogin(u.getUsername());
		return (user != null || ((u.getId() != null) && (user.getId() == u.getId())));
	}
	@Override
	public void deleteUser(Integer id) {
		dao.deleteUser(id);
	}

	@Override
	public List<String> getAllUsernames() {
		List<String> usernames = new ArrayList<>();
		List<User> users = findAllUsers();
		//System.out.println("tyle userow: "+users.size());
		for (User user : users) {
			usernames.add(user.getUsername());
			
		}
		//System.out.println("tyle usernames: "+usernames.size());
		return usernames;
	}

}