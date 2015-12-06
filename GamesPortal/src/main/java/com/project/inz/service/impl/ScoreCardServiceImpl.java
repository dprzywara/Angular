package com.project.inz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.QuizDao;
import com.project.inz.dao.ScoreCardDao;
import com.project.inz.model.Question;
import com.project.inz.model.Quiz;
import com.project.inz.model.ScoreCard;
import com.project.inz.model.User;
import com.project.inz.service.ScoreCardService;

@Service("ScoreCardService")
@Transactional
public class ScoreCardServiceImpl implements ScoreCardService {

	@Autowired
	private ScoreCardDao scoreDao;


	@Autowired
	private QuizDao quizDao;
	
	
	
	@Override
	public List<ScoreCard> getTopScores() {
		return scoreDao.getTopScoreList();
	
}
	@Override
	public ScoreCard attemptQuiz(Quiz attemptedQuiz,
			User attemptingUser, List<Question> answeredQuestions) {
			int score = 0;

			if (attemptedQuiz != null) {
				if (attemptedQuiz.getQuestions().size() > 0) {
					Set<Question> questions = attemptedQuiz.getQuestions();
					for (Question question : questions) {
						String answerByUser = getUserAnswer(question.getId(),answeredQuestions);
						
						if (question.getCorrect().equalsIgnoreCase(answerByUser)) {
							score = score + 1;
						}
					}

					ScoreCard newScoreCard = new ScoreCard();
					newScoreCard.setQuiz(attemptedQuiz);
					newScoreCard.setScore(score);
					newScoreCard.setUser(attemptingUser);
					if (!attemptingUser.getCards().contains(newScoreCard)) {
						scoreDao.saveScoreCard(newScoreCard);
						quizDao.incresePopularity(newScoreCard.getQuiz());
					}
//					res.setEntity(newScoreCard);
//					res.setResultCode(0);
					return newScoreCard;
				}
			}
				return null;

				

	}
	
	
	
	@Override
	public String getUserAnswer(Integer questionId,
			List<Question> answeredQuestions) {
		for (int i = 0; i < answeredQuestions.size(); i++) {
			if (answeredQuestions.get(i).getId()==questionId) {
				return answeredQuestions.get(i).getSelectedAnswer();
			}
		}
		return null;
	}

	//aktualizuje najwyszy wynik w guizach gracza
	@Override
	public List<ScoreCard> updateHighestScore(Set<ScoreCard> attemptedQuizzes) {
		try {
			List<ScoreCard> updatedScoreList = new ArrayList<ScoreCard>();
			for (ScoreCard scoreCard : attemptedQuizzes) {
				scoreCard.setHighestScore(findHighestScore(scoreCard.getQuiz().getScores()));
				updatedScoreList.add(scoreCard);

			}
			if (updatedScoreList.size() < 5) {
				return updatedScoreList;
			}
			
			return updatedScoreList.subList(0, 5);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	//zliczam ile w jakie kategorie gral gracz
	@Override
	public HashMap<String, Integer> getCategoryCountForPlayedQuizzes(Set<ScoreCard> attemptedQuizzes) {
		try {
			HashMap<String, Integer> categoryMap = new HashMap<String, Integer>();		
				for (ScoreCard scoreCard : attemptedQuizzes) {
					String currentCategory = scoreCard.getQuiz().getCategory().getName();
				if (categoryMap.containsKey(currentCategory)) {
					categoryMap.put(currentCategory,categoryMap.get(currentCategory) + 1);
				} else {
					categoryMap.put(currentCategory, 1);
				}

				}
			return categoryMap;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Integer findHighestScore(Set<ScoreCard> list) {
		int highestScore = 0;
		for (ScoreCard scoreCard : list) {
			
			if (scoreCard.getScore() > highestScore)
				highestScore = scoreCard.getScore();
		}

		return highestScore;
	}



	@Override
	public boolean checkIfUserHasPlayedQuiz(User currentUser, int quizId) {
		Set<ScoreCard> scoreCards = currentUser.getCards();
	for (ScoreCard scoreCard : scoreCards) {
			if (scoreCard.getQuiz().getId() == quizId
					&& scoreCard.getUser().getId() == currentUser.getId())
				return true;

		}
		return false;

	}
	

}
