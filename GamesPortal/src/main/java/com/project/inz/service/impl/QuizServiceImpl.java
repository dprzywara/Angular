package com.project.inz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.QuizDao;
import com.project.inz.model.Quiz;
import com.project.inz.service.QuizService;

@Service("quizService")
@Transactional
public class QuizServiceImpl implements QuizService {
	
	@Autowired
	private QuizDao quizDao;
	
	
	
	@Override
	public Quiz findById(Integer id) {
		return quizDao.findById(id);
	}

	@Override
	public void saveQuiz(Quiz quiz) {
		quizDao.saveQuiz(quiz);
		
	}

	@Override
	public void updateQuiz(Quiz quiz) {
		quizDao.updateQuiz(quiz);		
	}

	@Override
	public void deleteQuiz(Integer id) {
		quizDao.deleteQuizById(id);		
	}

	@Override
	public List<Quiz> getAllQuizzes() {
		return quizDao.getAllQuizzes();
	}
	
	public List<Quiz> getMostPopularQuizes() {
		return quizDao.getPopularityList();
	}

	
	public HashMap<String, Integer> getCategoryDistribution() {
		
			List<Quiz> quizList = quizDao.getAllQuizzes();
			HashMap<String, Integer> categoryMap = new HashMap<String, Integer>();
			for (int i = 0; i < quizList.size(); i++) {
				String currentCategory = quizList.get(i).getCategory()
						.getName();
				if (categoryMap.containsKey(currentCategory)) {
					categoryMap.put(currentCategory,
							categoryMap.get(currentCategory) + 1);
				} else {
					categoryMap.put(currentCategory, 1);
				}

			}
			return categoryMap;

	}
	public HashMap<String, Integer> getCategoryDistribution2() {
		
		return quizDao.getCountOfQuizzesInCategories();
		
	}

	public Quiz getQuiz(Integer id) {
		return quizDao.findById(id);
	}

	public List<String> getLevelList() {
		List<String> levelList = new ArrayList<String>();
		levelList.add("Level 1");
		levelList.add("Level 2");
		levelList.add("Level 3");
		levelList.add("Level 4");
		levelList.add("Level 5");
		return levelList;
	}
/*
	public List<Questions> getEmptyQuestionList() {
		List<Questions> questionList = new ArrayList<Questions>();
		for (int count = 0; count < 10; count++) {
			Questions newQstn = new Questions();
			newQstn.setQuestion("");
			newQstn.setAnswer(0);
			questionList.add(newQstn);
		}
		return questionList;
	}

	@Transactional
	public Result<Quiz> add(Quiz entity, int QuizId) {
		Result<Quiz> res = new Result<Quiz>();
		try {
			Quiz selectedCat = catImpl.getEntity(QuizId);
			entity.setQuiz(selectedCat);
			res = quizDAO.add(entity);
			return res;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public Result<Quiz> addQuestions(int quizId, List<Questions> questions) {
		Result<Quiz> res = new Result<Quiz>();
		try {
			Set<Questions> newQuestions = new HashSet<Questions>();
			Quiz updatedQuiz = quizDAO.getEntity(quizId);
			for (int count = 0; count < questions.size(); count++) {
				newQuestions.add(questions.get(count));
				Questions newQuestion=questions.get(count);
				newQuestion.setQuiz(updatedQuiz);
				questionImpl.add(newQuestion);
			}		
			res.setEntity(null);
			res.setResultCode(0);
			return res;		
			
		} catch (HibernateException e) {
			e.printStackTrace();
			res.setEntity(null);
			res.setResultCode(-1);
			return res;
		}

	}
	
	*/

}
