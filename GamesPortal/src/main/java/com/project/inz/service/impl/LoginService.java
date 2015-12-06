package com.project.inz.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.core.userdetails.User;

import com.project.inz.dao.UserDao;
import com.project.inz.model.UserRole;

@Service("loginService")
public class LoginService implements UserDetailsService {

	// get user from the database, via Hibernate
	@Autowired
	private UserDao userDao;

	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {

		com.project.inz.model.User user = userDao.findUserByUsername(username);
		//Set<UserRole> roles =new HashSet<UserRole>();
		//roles.add(user.getUserRole());
		System.out.println("User :" + user.getUsername()+"ile rol uzytkownika "+user.getRoles().size());
		List<GrantedAuthority> authorities = buildUserAuthority(user.getRoles());//tu musi byc set
		return buildUserForAuthentication(user, authorities);

	}

	// Converts model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(com.project.inz.model.User user, List<GrantedAuthority> authorities) {
		return new User(user.getUsername(), user.getPassword(), user.isEnabled(), true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (UserRole userRole : userRoles) {
			System.out.println("takie role: "+userRole.toString());
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}

}