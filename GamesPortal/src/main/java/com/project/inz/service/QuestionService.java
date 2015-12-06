package com.project.inz.service;
import java.util.List;

import com.project.inz.model.Question;

 
public interface QuestionService {
 
    Question findById(Integer id);
     
    void saveQuestion(Question question);
     
    void updateQuestion(Question question);
     
    void deleteQuestion(Integer id);
 
    List<Question> findAllQuestions(); 
     
 
    boolean isUserAnswerCorrect(Integer id, String userAnsw);
    List<Question> randQuestion4Game(String category);
     
}