package com.project.inz.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.CommentDao;
import com.project.inz.model.Comment;
import com.project.inz.model.Quiz;

@Repository("commentDao")
public class CommentDaoImpl extends AbstractDao<Integer, Comment> implements CommentDao {

	

	@Override
	public Comment findById(Integer id) {
		return getById(id);
	}

	@Override
	public Comment saveComment(Comment com) {
		persist(com);
		return com;

	}

	@Override
	public void deleteCommentById(Integer id) {
		delete(findById(id));

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getAllComments() {
		Criteria criteria = createCriteria();
		return (List<Comment>) criteria.list();
	}




	@Override
	public void updateComment(Comment quiz) {
		update(quiz);

	}

	// comments for a quiz

	public Set<Comment> getCommentsListForQuiz(int quiz) {
		Session session = getSession();
		Quiz desiredQuiz = (Quiz) session.get(Quiz.class, new Integer(quiz));
		Set<Comment> commentsForQuiz = desiredQuiz.getComments();
		return commentsForQuiz;
	}

	// Get comments for a user
	public Set<Comment> getCommentsListForUser(int user) {
		Session session = getSession();
		Quiz desiredQuiz = (Quiz) session.get(Quiz.class, new Integer(user));
		Set<Comment> commentsForUser = desiredQuiz.getComments();
		return commentsForUser;
	}


}
