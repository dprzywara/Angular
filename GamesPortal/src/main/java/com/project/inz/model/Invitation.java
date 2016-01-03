package com.project.inz.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;



import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="invitations", catalog = "quizgame")
@Setter @Getter @NoArgsConstructor 
@AllArgsConstructor 
public class Invitation implements Serializable{
	
	private static final long serialVersionUID = 1427196595815589686L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id",nullable=false, unique=true)
	private Integer id;
	
	 @ManyToOne
	 @JoinColumn(name = "invitingId")
	 private User inviting; //zapraszajacy

	 @ManyToOne
	 @JoinColumn(name = "invitedId")
	 private User invited;
	 
	 @ManyToOne
	 @JoinColumn(name = "quizId")
	 private Quiz quizId;
	
	@Column(name="status",nullable=false )
	private String status;
}
