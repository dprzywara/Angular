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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="questions", catalog = "quizgame") 
@Setter @Getter @NoArgsConstructor 
@AllArgsConstructor  
public class Question implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3870990443950950960L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable=false, unique=true, name="id")
	private Integer id;
	
	@Column(name = "question", unique = true, nullable = false)
	private String question;
	
	@Column(name = "answera", nullable = false)
	private String answera;
	
	@Column(name = "answerb", nullable = false)
	private String answerb;
	
	@Column(name = "answerc", nullable = false)
	private String answerc;
	
	@Column(name = "answerd", nullable = false)
	private String answerd;
	
	@Column(name = "correct", nullable = false)
	private String correct;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryId")
	//@JsonBackReference
	private Category category;
	
	
	@Transient
	private String selectedAnswer="a";	
	
	@ManyToOne
	@JoinColumn(name="quizId")
	//@JsonManagedReference
	private Quiz quiz;
	

}
