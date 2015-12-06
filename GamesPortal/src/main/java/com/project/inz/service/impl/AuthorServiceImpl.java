package com.project.inz.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.AuthorDao;
import com.project.inz.model.AuthorEntity;
import com.project.inz.service.AuthorService;


@Service
@Transactional(readOnly = true)
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorDao authorRepository;

	@Override
	public Set<AuthorEntity> getAllAuthors() {
		return new HashSet<AuthorEntity>(authorRepository.getAllAuthors());
	}

}
