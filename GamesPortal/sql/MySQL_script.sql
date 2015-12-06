CREATE DATABASE IF NOT EXISTS `QuizGame`;
USE `QuizGame`;  
  
  
CREATE TABLE IF NOT EXISTS `users` (  
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,  
  `enabled` int(1) NOT NULL,  
  `password` varchar(60) NOT NULL, 
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;  
   
INSERT INTO `users` (`username`, `enabled`, `password`,`email`) VALUES  
 ('admin','1','admin', 'admin@123'),  
 ('user2','1','user2', 'admi2n@123'),  
 ('user', '1','user', 'user@123');  

  
  

CREATE TABLE IF NOT EXISTS `user_roles` (  
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,  
  `role` varchar(45) NOT NULL,  
  `user_id` int(11) NOT NULL,  
  PRIMARY KEY (`user_role_id`),  
  UNIQUE KEY uni_username_role (role,user_id),
  KEY fk_userid (user_id),
  CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users (user_id)
  )ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  
  

INSERT INTO `user_roles` (`user_role_id`, `role`, `user_id`) VALUES  
 (1, 'ROLE_ADMIN', '1'),  
 (2, 'ROLE_USER', '2'), 
 (3, 'ROLE_USER', '3'),  
 (4, 'ROLE_USER', '1');  

