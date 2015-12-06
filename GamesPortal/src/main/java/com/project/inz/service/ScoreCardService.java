package com.project.inz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.project.inz.model.Question;
import com.project.inz.model.Quiz;
import com.project.inz.model.ScoreCard;
import com.project.inz.model.User;

public interface ScoreCardService {

	List<ScoreCard> getTopScores();
	HashMap<String, Integer> getCategoryCountForPlayedQuizzes(Set<ScoreCard> attemptedQuizzes);
	List<ScoreCard> updateHighestScore(Set<ScoreCard> attemptedQuizzes);
	boolean checkIfUserHasPlayedQuiz(User currentUser, int quizId);
	String getUserAnswer(Integer questionId,List<Question> answeredQuestions);
	ScoreCard attemptQuiz(Quiz attemptedQuiz,
			User attemptingUser, List<Question> answeredQuestions);
	
	Integer findHighestScore(Set<ScoreCard> list);
}
