'use strict';

App.controller('CategoryController', ['$scope', 'CategoryService', function($scope, CategoryService,datatables, Flash,$modal) {
          var self = this;
          self.category={id:null,name:''};
          self.categories=[];
         // $scope.categories = [];
          
          
          self.fetchAllCategories = function(){
              CategoryService.fetchAllCategories()
                  .then(
      					       function(d) {
      						        self.categories = d;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };
           
          self.createCategory = function(category){
              CategoryService.createCategory(category)
		              .then(
                      self.fetchAllCategories, 
				              function(errResponse){
					               console.error('Error while creating Category.');
				              }	
                  );
          };

         self.updateCategory = function(category, id){
              CategoryService.updateCategory(category, id)
		              .then(
				              self.fetchAllCategories, 
				              function(errResponse){
					               console.error('Error while updating Category.');
				              }	
                  );
          };

         self.deleteCategory = function(id){
              CategoryService.deleteCategory(id)
		              .then(function () {
		            	  
				              self.fetchAllCategories;
				              self.remove(id);
				              //removeBookById(id);
			                 // Flash.create('success', 'Kategoria została usunięta.', 'custom-class');
			                  },
				              function(errResponse){
					            	   console.error('Error while deleting Category.');
					                  // Flash.create('danger', 'Wyjątek usuwanie', 'custom-class');
					               });
				              
				              
          		};
          		
//          	  var removeBookById = function (categoryId) {
//                  for (var i = 0; i < $scope.categories.length; i = i + 1) {
//                      if ($scope.categories[i].id === categoryId) {
//                          $scope.categories.splice(i, 1);
//                          break;
//                      }
//                  }
//              };
          
          $scope.deleteBook = function (bookId) {
              bookService.deleteBook(bookId).then(function () {
                  removeBookById(bookId);
                  Flash.create('success', 'Książka została usunięta.', 'custom-class');
              });
          };

          self.fetchAllCategories();

          self.submit = function() {
              if(self.category.id==null){
                  console.log('Saving New Category', self.category);    
                  self.createCategory(self.category);
              }else{
                  self.updateCategory(self.category, self.category.id);
                  console.log('Category updated with id ', self.category.id);
              }
              self.reset();
          };
              
          self.edit = function(id){
              console.log('id to be edited', id);
              for(var i = 0; i < self.categories.length; i++){
                  if(self.categories[i].id == id) {
                     self.category = angular.copy(self.categories[i]);
                     break;
                  }
              }
          };
              
          self.remove = function(id){
              console.log('id to be deleted', id);
              for(var i = 0; i < self.categories.length; i++){
                  if(self.categories[i].id == id) {
                     self.reset();
                     break;
                  }
              }
              self.deleteCategory(id);
          };

          
          self.reset = function(){
              self.category={id:null,name:''};
             // $scope.myForm.$setPristine(); //reset Form
          };

      }]);
