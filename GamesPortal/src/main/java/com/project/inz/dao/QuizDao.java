package com.project.inz.dao;
import java.util.HashMap;
import java.util.List;

import com.project.inz.model.Quiz;

 
public interface QuizDao {
 
    Quiz findById(Integer id);
 
    void saveQuiz(Quiz quiz);
     
    void deleteQuizById(Integer id);
    List<Quiz> getQuizzesFromLevel(Integer level);
    void updateQuiz(Quiz quiz);
    List<Quiz> getAllQuizzes();
    List<Quiz> getPopularityList();
    void incresePopularity(Quiz quiz);
    
    HashMap<String,Integer> getCountOfQuizzesInCategories();
 
   // Quiz findQuizByName(String username);
}