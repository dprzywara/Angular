package com.project.inz.dao.impl;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.QuestionDao;
import com.project.inz.model.Question;
 
@Repository("questionDao")
public class QuestionDaoImpl extends AbstractDao<Integer, Question> implements QuestionDao {

 

	@Override
	public Question findById(Integer id) {
		return getById(id);
	}

	@Override
	public void saveQuestion(Question question) {
		persist(question);
		
	}

	@Override
	public void deleteQuestionById(Integer id) {
		delete(findById(id));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getAllQuestions() {
		Criteria criteria = createCriteria();
        return (List<Question>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getAllQuestionsIdsInCategory(String category) {
		Criteria criteria = createCriteria();
        criteria.add(Restrictions.eq("category", category));
        criteria.setProjection(Projections.property("id"));
        criteria.addOrder(Order.asc("id"));
        return (List<Integer>) criteria.list();
	}

	@Override
	public String getCorrectAnswer(Integer id) {
		Criteria criteria = createCriteria();
		 criteria.add(Restrictions.eq("id", id));
		criteria.setProjection(Projections.property("correct"));
        return (String) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getAllQuestionsFromCategory(String category) {
		Criteria criteria = createCriteria();
        criteria.add(Restrictions.eq("category", category));
        return (List<Question>) criteria.list();
	}

	@Override
	public void updateQuestion(Question question) {
		update(question);
		
	}


	
}