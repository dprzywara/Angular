function myController($scope, $http) {


	$scope.getUserDataFromServer = function() {           
		$http.get('http://localhost:8085/GamesPortal/rest/activeUsers').success(function(data) {

			$scope.users = data;	
			
		})
	};
}; 

'use strict';
angular.module("app.select", []).controller("myController", ["$scope", "$http", myController]);
