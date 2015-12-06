'use strict';

App.factory('CategoryService', ['$http', '$q', function($http, $q, currentContextPath){
	return {
		
		fetchAllCategories: function() {
					return $http.get('http://localhost:8085/GamesPortal/rest/category')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching categories');
										return $q.reject(errResponse);
									}
							);
			},
		    
		    createCategory: function(category){
					return $http.post(currentContextPath.get()+'category/', category)
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
		    
		    updateCategory: function(category, id){
					return $http.put('http://localhost:8085/GamesPortal/rest/category/'+id, category)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating category');
										return $q.reject(errResponse);
									}
							);
			},
		    
			deleteCategory: function(id){
					return $http.delete('http://localhost:8085/GamesPortal/rest/category/'+id)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while deleting category');
										return $q.reject(errResponse);
									}
							);
			}
		
	};

}]);
