package com.project.inz.service;

import java.util.HashMap;
import java.util.List;

import com.project.inz.model.Quiz;

public interface QuizService {

	
	Quiz findById(Integer id);
    
    void saveQuiz(Quiz Quiz);
     
    void updateQuiz(Quiz Quiz);
     
    void deleteQuiz(Integer id);
 
    List<Quiz> getAllQuizzes(); 
	
	List<Quiz> getMostPopularQuizes();

	HashMap<String, Integer> getCategoryDistribution();
	HashMap<String, Integer> getCategoryDistribution2();

	Quiz getQuiz(Integer id);

	List<String> getLevelList();

}
