package com.project.inz.service;

import java.util.List;
import java.util.Set;

import com.project.inz.model.Comment;

public interface CommentService {

	
	Comment findById(Integer id);
    
    void saveComment(Comment comment);
     
    void updateComment(Comment comment);
     
    void deleteComment(Integer id);
 
    List<Comment> getAllComments(); 


    Comment getComment(Integer id);
    List<Comment> getListForQuiz(int quiz) ;
    List<Comment> getListForUser(int user);
    Comment createComments(int userId, int quizId, String comment);
}
