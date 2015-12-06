package com.project.inz.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

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
@Table(name="users", catalog = "quizgame") 
@Setter @Getter @NoArgsConstructor 
@AllArgsConstructor  
public class User implements Serializable{
	
	private static final long serialVersionUID = 7432048726231294654L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable=false, unique=true, name="user_id")
	private Integer id;
	
	@Column(name = "firstName", nullable = false)
	private String firstName;

	@Column(name = "lastName", nullable = false)
	private String lastName;
	
	@Column(name = "USERNAME", unique = true, nullable = false, length = 50)
	private String username;
	
	@Column(name = "PASSWORD", unique = true, nullable = false, length = 50)
	private String password;
	
	@Column(name = "ENABLED", nullable = false)
	private boolean enabled;
	
	@Column(name="EMAIL", nullable = false, length = 45)
	private String email;
//	
//	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
//	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
	@Transient
	private String confirmPassword;	
	
	@OneToMany(mappedBy="user",fetch=FetchType.EAGER)
	@JsonIgnore
	private Set<ScoreCard> cards= new HashSet<ScoreCard>();	

	@OneToMany(mappedBy="user",fetch=FetchType.EAGER)
	@JsonIgnore
	private Set<Comment> comments= new HashSet<Comment>();
	
//	,cascade = CascadeType.PERSIST
	@ManyToMany(fetch=FetchType.EAGER) 
	//@Fetch(FetchMode.SUBSELECT)
	@JoinTable(name="UsersAndRoles", catalog = "quizgame", joinColumns=@JoinColumn(name="user_id"), inverseJoinColumns=@JoinColumn(name="role_id"))
	@JsonBackReference
	private Set <UserRole> roles = new HashSet<UserRole>();
	//z kurierow
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name="role_id", unique=false, nullable=false)
//	private UserRole userRole;
//	
	
	//moje stare
	//@ManyToOne()
	//@JoinColumn(name="user_role_id", unique=false, nullable=false)
	//private UserRole userRole;
	
	
//	@ManyToMany(fetch=FetchType.EAGER)
//	@JoinTable(name="users_friends",catalog = "quizgame",
//	 joinColumns=@JoinColumn(name="user_id"),
//	 inverseJoinColumns=@JoinColumn(name="friend_id")
//	)
//	private List<User> friends;
//
//	@ManyToMany
//	@JoinTable(name="users_friends",catalog = "quizgame",
//	 joinColumns=@JoinColumn(name="friend_id"),
//	 inverseJoinColumns=@JoinColumn(name="user_id")
//	)
//	private List<User> friendOf;

}
