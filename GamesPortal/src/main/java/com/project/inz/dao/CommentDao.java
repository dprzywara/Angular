package com.project.inz.dao;
import java.util.List;
import java.util.Set;

import com.project.inz.model.Comment;

 
public interface CommentDao {
 
    Comment findById(Integer id);
 
    Comment saveComment(Comment comment);
     
    void deleteCommentById(Integer id);
    void updateComment(Comment comment);
    List<Comment> getAllComments();
    Set<Comment> getCommentsListForQuiz(int quiz) ;
    Set<Comment> getCommentsListForUser(int user);
 
}