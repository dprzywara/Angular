package com.project.inz.model;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter @NoArgsConstructor 
@AllArgsConstructor @EqualsAndHashCode
public class InvitationTo {
	
	private String invitingUser; //zapraszajacy
	
	private Integer invitedId; //zaproszony
	
	private String status;
}
