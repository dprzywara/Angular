package com.project.inz.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "quizscore", catalog = "quizgame")
@Setter @Getter @NoArgsConstructor 
@AllArgsConstructor  
public class QuizScore implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4591454443933017040L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="player1Id")
	private User player1;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="player2Id")
	private User player2;
	
//	@ManyToOne(fetch=FetchType.EAGER)
//	@JoinColumn(name="quizId")
//	private Quiz quiz;
//	
	@Column(name = "player1score", nullable = false)
	private Integer player1Score;
	
	@Column(name = "player2score", nullable = false)
	private Integer player2Score;
	
	
	
	
}
