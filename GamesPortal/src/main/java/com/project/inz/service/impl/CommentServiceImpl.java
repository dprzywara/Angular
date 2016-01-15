package com.project.inz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.CommentDao;
import com.project.inz.dao.QuizDao;
import com.project.inz.dao.UserDao;
import com.project.inz.model.Comment;
import com.project.inz.model.Quiz;
import com.project.inz.model.User;
import com.project.inz.service.CommentService;
import com.project.inz.service.QuizService;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private QuizDao quizDao;
	
	
	
	@Override
	public Comment findById(Integer id) {
		return commentDao.findById(id);
	}

	@Override
	public void saveComment(Comment quiz) {
		commentDao.saveComment(quiz);
		
	}

	@Override
	public void updateComment(Comment quiz) {
		commentDao.updateComment(quiz);		
	}

	@Override
	public void deleteComment(Integer id) {
		commentDao.deleteCommentById(id);		
	}

	@Override
	public List<Comment> getAllComments() {
		return commentDao.getAllComments();
	}
	@Transactional
	public Comment createComments(int userId, int quizId, String comment){
		
		//get hibernate objects for user and quiz
		User commenter = userDao.findById(userId);
		Quiz commentedQuiz = quizDao.findById(quizId);
		
		Comment userComment = new Comment();
		userComment.setUser(commenter);
		userComment.setQuiz(commentedQuiz);
		userComment.setComment(comment);
		Comment comments = commentDao.saveComment(userComment);
		return comments;
		
	}
	
	@Transactional
	public List<Comment> getListForUser(int user) {
		try {
	        List<Comment> comments =new ArrayList<Comment>();
	        Set<Comment> commentsByUser=commentDao.getCommentsListForUser(user);
	    	for (Iterator<Comment> it = commentsByUser.iterator(); it
					.hasNext();) {
	    		Comment f = it.next();
	    		comments.add(f);
	    	}
	        if(comments==null || comments.size()==0) {
	            return null;
	        }
	        
	        return comments;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//Get comments made on specific quiz
	@Transactional
	public List<Comment> getListForQuiz(int quiz) {
		try {
	        List<Comment> comments =new ArrayList<Comment>();
	        Set<Comment> commentsByUser=commentDao.getCommentsListForQuiz(quiz);
	    	for (Iterator<Comment> it = commentsByUser.iterator(); it
					.hasNext();) {
	    		Comment f = it.next();
	    		comments.add(f);
	    	}
	        if(comments==null || comments.size()==0) {
	            return null;
	        }
	        return comments;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Comment getComment(Integer id) {
		return commentDao.findById(id);
	}


	

}
