'use strict';

function myController($scope, $http) {


	$scope.getUserDataFromServer = function() {           
		$http.get('http://localhost:8085/GamesPortal/rest/activeUsers').success(function(data) {

			$scope.users = data;				
		})
	};
};   