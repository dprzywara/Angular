//function myController($scope, $http) {
//
//
//	$scope.getUserDataFromServer = function() {           
//		$http.get('http://localhost:8085/GamesPortal/rest/activeUsers').success(function(data) {
//
//			$scope.users = data;	
//			console.log('Category updated with id ', $scope.users);
//		})
//	};
//}; 
//
//'use strict';
//angular.module("myApp", []).controller("myController", ["$scope", "$http", myController]);

//'use strict';

var App = angular.module('myApp',['flash','datatables']);

//var App =angular.module('myApp', [ 'app.select','flash','datatables']);
//.config(function ($locationProvider) {
//    'use strict';
//    $locationProvider.html5Mode(false);
//})
//.value('config', {
//    contextPath: 'workshop'
//});