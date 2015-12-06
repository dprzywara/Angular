package com.project.inz.dao;
import java.util.List;

import com.project.inz.model.ScoreCard;

 
public interface ScoreCardDao {
 
	ScoreCard findById(Integer id);
	 
    void saveScoreCard(ScoreCard ScoreCard);
    
    void updateScoreCard(ScoreCard ScoreCard);
     
    void deleteScoreCardById(Integer id);
     
    List<ScoreCard> getAllScoreCards();
    
    List<ScoreCard> getTopScoreList();
}