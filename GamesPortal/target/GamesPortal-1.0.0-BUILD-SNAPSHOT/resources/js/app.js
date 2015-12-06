//function myController($scope, $http) {
//
//
//	$scope.getUserDataFromServer = function() {           
//		$http.get('http://http://localhost:8081/GamesPortal/admin/activeUsers').success(function(data) {
//
//			$scope.users = data;				
//		})
//	};
//}; 

'use strict';
angular.module("myApp", []).controller("myController", ["$scope", "$http", myController]);