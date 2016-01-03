package com.project.inz.model;


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "quiz",catalog="quizgame")
@Setter @Getter @NoArgsConstructor 
@AllArgsConstructor 
public class Quiz implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8656598077124693499L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "quizzName", nullable = false)
	private String name;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryId")//tu chyba one to many one po stronie kategprii
	//@JsonBackReference
	private Category category;
	
	@Column(name = "level")
	private int level;
	
	@Column(name = "popularity")
	private int popularity;
	
	@OneToMany(mappedBy="quiz",fetch=FetchType.EAGER)
	@Fetch (FetchMode.SELECT)
	@JsonIgnore
	private Set<Question> questions= new HashSet<Question>();
	
	@OneToMany(mappedBy="quiz",fetch=FetchType.EAGER)
	@Fetch (FetchMode.SELECT)
	@JsonIgnore
	private Set<Comment> comments= new HashSet<Comment>();
	
	@OneToMany(mappedBy="quiz",fetch=FetchType.EAGER)
	@Fetch (FetchMode.SELECT)
	@JsonIgnore
	private Set<ScoreCard> scores= new HashSet<ScoreCard>();
	
	
//	@Override
//	public String toString() {
//		return name;
//	}
	
	
}
