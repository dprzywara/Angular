'use strict';

App.factory('SelectService', ['$http', '$q', function($http, $q, currentContextPath){
	return {
		
		getAvailableUsers: function(username) {
					return $http.get('http://localhost:8085/GamesPortal/rest/activeUsers/'+username)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching users');
										return $q.reject(errResponse);
									}
							);
			},
			getCurrentUser: function() {
				return $http.get('http://localhost:8085/GamesPortal/rest/currentUser')
				.then(
						function(response){
							return response.data;
						}, 
						function(errResponse){
							console.error('Error while fetching current user');
							return $q.reject(errResponse);
						}
				);
			},
		    
		    createInvite: function(invite){
		    	//console.error('invite inviting ',invite.invitating);
		    	
					return $http.post('http://localhost:8085/GamesPortal/rest/invite/', invite)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while creating user');
										return $q.reject(errResponse);
									}
							);
		    },
		
		
	};

}]);
