'use strict';

App.controller('SelectController', ['$scope', 'SelectService', function($scope,SelectService,datatables, Flash,$modal) {
          $scope.invite={invitingUser:undefined,invitedId:undefined,status:"invited"};
          $scope.users = [];
          $scope.currentUser="user"
          
          
	         
//          $scope.init = function(name)
//          {
//            $scope.currentUser = name; 
//            console.log('inicjalizacja user',$scope.currentUser); 
//          };
          $scope.getCurrentUser = function(){
        	  SelectService.getCurrentUser()
                  .then(
      					       function(d) {
      					    	 $scope.currentUser = d;
      					    	console.log('aktualny user',$scope.currentUser.username);   
      					       },
            					function(errResponse){
            						console.error('Error while fetching current user');
            					}
      			       );
          };
          
          $scope.getAvailableUsers = function(){
              SelectService.getAvailableUsers($scope.currentUser)
                  .then(
      					       function(d) {
      					    	 $scope.users = d;
      					    	console.log('jestem w kontrolerze po przypisani uczegos z resta rozmiar',$scope.currentUser);   
      					       },
            					function(errResponse){
            						console.error('Error while fetching available users');
            					}
      			       );
          };
          
          
          
          $scope.sendInvite = function(invite){
              SelectService.createInvite(invite)
		              .then(
		            	$scope.getAvailableUsers, 
				              function(errResponse){
					               console.error('Error while creating Invite.');
				              }	
                  );
          };
         // $scope.getCurrentUser();
          $scope.getAvailableUsers();

      }]);
