package com.project.inz.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.project.inz.dao.AbstractDao;
import com.project.inz.dao.ScoreCardDao;
import com.project.inz.model.ScoreCard;

@Repository("ScoreCardDao")
public class ScoreCardDaoImpl extends AbstractDao<Integer, ScoreCard> implements ScoreCardDao {


	@Override
	public ScoreCard findById(Integer id) {
		return getById(id);
	}

	@Override
	public void saveScoreCard(ScoreCard ScoreCard) {
		persist(ScoreCard);
		
	}

	@Override
	public void deleteScoreCardById(Integer id) {
		delete(findById(id));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ScoreCard> getAllScoreCards() {
		Criteria criteria = createCriteria();
        return (List<ScoreCard>) criteria.list();
	}

	@Override
	public void updateScoreCard(ScoreCard ScoreCard) {
		update(ScoreCard);
		
	}


	@SuppressWarnings("unchecked")
	public List<ScoreCard> getTopScoreList() {
//		Criteria criteria = createCriteria();
//        criteria.addOrder(Order.desc("score"));
//        criteria.setMaxResults(5);
//        return (List<ScoreCard>) criteria.list();
		
		Session session = getSession();
		@SuppressWarnings("unchecked")
		List<ScoreCard> quizList = session
				.createQuery("select s from  ScoreCard s order by s.score desc")
				.setMaxResults(5).list();
		return quizList;

	}

	

}
