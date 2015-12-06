package com.project.inz.service.impl;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.QuestionDao;
import com.project.inz.model.Question;
import com.project.inz.service.QuestionService;

 
@Service("questionService")
@Transactional
public class QuestionServiceImpl implements QuestionService {
 
    @Autowired
    private QuestionDao dao;
     

	@Override
	public Question findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public void saveQuestion(Question question) {
		dao.saveQuestion(question);
		
	}

	@Override
	public void updateQuestion(Question question) {
		dao.updateQuestion(question);
		
	}

	@Override
	public void deleteQuestion(Integer id) {
		dao.deleteQuestionById(id);
		
	}

	@Override
	public List<Question> findAllQuestions() {
		return dao.getAllQuestions();
	}

	@Override
	public boolean isUserAnswerCorrect(Integer id, String userAnsw) {
		return (userAnsw.equals(dao.getCorrectAnswer(id)));
	}

	@Override
	public List<Question> randQuestion4Game(String category) {
		
		List<Integer> listOfIds = dao.getAllQuestionsIdsInCategory(category);
		Set<Integer> randedIds = new HashSet<Integer>();
		
		List<Question> choosenQuestions =new  LinkedList<Question>();
		
		int numberOfQuestion=3;
		
		Random rand=new Random();
		while(randedIds.size()<numberOfQuestion){
			randedIds.add(rand.nextInt(listOfIds.size()));
		}
		
		
		
		for (Integer id : randedIds) {
			choosenQuestions.add(dao.findById(listOfIds.get(id)));
		}
		
		return choosenQuestions;
	}
	
	
	
     
}