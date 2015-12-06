package com.project.inz.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "user_roles", catalog = "quizgame")
//, uniqueConstraints = @UniqueConstraint(
	//	columnNames = { "role", "user_id" }))
@Setter @Getter @NoArgsConstructor
@AllArgsConstructor @ToString
public class UserRole implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "role_id", unique = true, nullable = false)
	private Integer id;
	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "user_id", nullable = false)
//	private User user;
	
	@Column(name = "role", nullable = false, length = 45)
	private String role=UserProfileType.USER.getUserProfileType();

//	@Column
//	@ManyToMany(fetch=FetchType.EAGER,mappedBy = "roles")
//	private List<User> users;
}
