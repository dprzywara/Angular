package com.project.inz.dao;
import java.util.List;

import com.project.inz.model.Question;

 
public interface QuestionDao {
 
    Question findById(Integer id);
 
    void saveQuestion(Question question);
    
    void updateQuestion(Question question);
     
    void deleteQuestionById(Integer id);
     
    List<Question> getAllQuestions();
    
    List<Question> getAllQuestionsFromCategory(String category);
    
    String getCorrectAnswer(Integer id);
    
    List<Integer> getAllQuestionsIdsInCategory(String category);
 
}