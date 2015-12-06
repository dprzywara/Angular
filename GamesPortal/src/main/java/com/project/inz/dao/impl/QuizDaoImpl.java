package com.project.inz.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.QuizDao;
import com.project.inz.model.Quiz;

@Repository("quizDao")
public class QuizDaoImpl extends AbstractDao<Integer, Quiz> implements QuizDao {

	@SuppressWarnings("unchecked")
	public List<Quiz> getQuizzesFromCategory(String category) {
		Criteria criteria = createCriteria();
		criteria.add(Restrictions.eq("category", category));
		return (List<Quiz>) criteria.list();
	}

	@Override
	public Quiz findById(Integer id) {
		return getById(id);
	}

	@Override
	public void saveQuiz(Quiz Quiz) {
		persist(Quiz);

	}

	@Override
	public void deleteQuizById(Integer id) {
		delete(findById(id));

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Quiz> getAllQuizzes() {
		Criteria criteria = createCriteria();
		return (List<Quiz>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Quiz> getPopularityList() {
		Criteria criteria = createCriteria();
		criteria.addOrder(Order.desc("popularity"));
		criteria.setMaxResults(5);
		return (List<Quiz>) criteria.list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Quiz> getQuizzesFromLevel(Integer level) {
		Criteria criteria = createCriteria();
		criteria.add(Restrictions.eq("level", level));

		return (List<Quiz>) criteria.list();
	}

	@Override
	public void updateQuiz(Quiz quiz) {
		update(quiz);

	}

	@Override
	public void incresePopularity(Quiz quiz) {
		int increasedPopularity = quiz.getPopularity() + 1;
		quiz.setPopularity(increasedPopularity);
		update(quiz);

	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Integer> getCountOfQuizzesInCategories() {

		HashMap<String, Integer> categoryMap = new HashMap<String, Integer>();
		Criteria criteria = createCriteria();
		ProjectionList projectionList = Projections.projectionList();
		projectionList.add(Projections.groupProperty("category"));
		projectionList.add(Projections.rowCount());
		criteria.setProjection(projectionList);
		// List results = criteria.list();
		// for (Object[] obj : results) {
		// categoryMap.put((String) obj[0], (Integer) obj[1]);
		// }
		// return categoryMap;
		return (HashMap<String, Integer>) criteria.list();
	}

}
