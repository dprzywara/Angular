<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="user.list" /></title>
<%@include file="../includes/scripts.jsp"%>


   <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }

      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }

    </style>

<!--  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script> -->
<!--  <script src="/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.js"></script> -->
<script type="text/javascript" src='<c:url value="/resources/js/lib/jquery.min.js"/>'></script>

 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.js' />"></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/jquery.dataTables.min.js' />"></script>
 <script type="text/javascript" src='<c:url value="/resources/js/lib/angular.min.js"/>'></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.min.js' />"></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.js' />"></script>
<%-- <script type="text/javascript" src='<c:url value="/resources/js/lib/jquery.js"/>'></script> --%>

<!-- <link data-require="bootstrap-css@2.3.2" data-semver="2.3.2" rel="stylesheet" href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" /> -->
<!--     <link data-require="datatable-css@1.10.7" data-semver="1.10.7" rel="stylesheet" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" /> -->
    
<!--     <script data-require="jquery.js@1.11.3" data-semver="1.11.3" src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!--     <script data-require="datatable.js@1.10.7" data-semver="1.10.7" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script> -->
    
<!--     <script data-require="angular.js@1.1.5" data-semver="1.1.5" src="http://code.angularjs.org/1.1.5/angular.min.js"></script> -->
<!--     <script data-require="angular-datatable.js@1.1.5" data-semver="1.1.5" src="angular-datatables.min.js"></script> -->
  
    
<!--     <link rel="stylesheet" href="style.css" /> -->
<!--     <script src="script.js"></script> -->
<!--   </head> -->
</head>
<body role="document"  >
		<%@include file="../includes/header2.jsp"%>
<!-- <tiles:insertAttribute name="msg"/> -->


	<div class="admin-photo-background">

	
	
		<div class="container-fluid">
			<div class="row">
				<%@include file="../includes/side_bar.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
					<div class="jumbotron">
<%-- 						<h2 class="sub-header"><spring:message code="sidebar.users" /></h2> --%>
						
						
						<div class="container">
					<h1><spring:message code="categories.list" /></h1>
					<br>
						<div class="row" data-ng-app="myApp">
						
							
							<div class="pull-left" data-ng-controller="myController">
        						<a class="btn btn-success"  href="<c:url value="${currentUrl}/admin/addCategory"/>"> <i
								class="fa fa-plus"></i> <spring:message code="btn.addCategory" /></a> 
								
								
							</div>								
					</div>
					<br>
					
<!-- 					<div ng-app> -->

<!--     Write some text in textbox: -->
<!--     <input type="text" ng-model="sometext" /> -->
 
<!--     <h1>Hello {{ sometext }}</h1> -->
     
<!-- </div> -->
					<div class="table-responsive row">
<!-- 						<table id="mytable" class="table table-striped table-bordered table-condensed text-center" aria-describedby="mytable_info"> -->
<!-- 							<thead> -->
<!-- 								<tr class="info"> -->
<%-- 									<th width="30%"><spring:message code="category.name" /></th> --%>
<%-- 									<th width="10%"><spring:message code="table.options" /></th> --%>
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<%-- 								<c:forEach items="${categories}" var="category" varStatus="loopCounter"> --%>
<!-- 									<tr> -->
		
<%-- 											<td>${category.name}</td> --%>
											
<!-- 										<td><nobr> -->
<%-- 												<a class="btn btn-primary" href="<c:url value="/admin/edit-category-${category.id}"/>"> <i class="fa fa-pencil"></i> <spring:message code="btn.Edit" /> --%>
<%-- 												</a> <a class="btn btn-danger" onclick="return confirm('OK to delete ${category.name} ?');" --%>
<%-- 													href="deleteCategory/${category.id}"> <i class="fa fa-times"></i> --%>
<%-- 													<spring:message code="btn.Delete" /> --%>
<!-- 												</a> -->
<!-- 										</nobr></td> -->
<!-- 									</tr> -->
<%-- 								</c:forEach> --%>
<!-- 							</tbody> -->
<!-- 						</table> -->
					</div>
					<br>
					
					
		<div  ng-app="myApp"  ng-controller="CategoryController as ctrl">			
					  <table  datatable="ng"  class="table table-striped table-bordered table-condensed text-center" aria-describedby="mytable_info">
<!-- 						// id="mytable" -->
<!-- //datatable="ng" -->
                      <thead>
                         <tr class="info">
									<th width="30%"><spring:message code="category.name" /></th>
									<th width="10%"><spring:message code="table.options" /></th>
								</tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="c in ctrl.categories">
                              <td><span ng-bind="c.name"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(c.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.deleteCategory(c.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
                      </div>
					
						
					
					
				</div>
			</div>
			</div>
			</div>
			</div>
			</div>
			
<!-- 		</div> -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
		<script src="<c:url value='/resources/js/angular/app.js' />"></script>
      <script src="<c:url value='/resources/js/angular/categories/category_service.js' />"></script>
      <script src="<c:url value='/resources/js/angular/categories/category_controller.js' />"></script>
      
      <script type="text/javascript">
      $(function () {
        $("#myyytable").dataTable({
            
        });
      });
    </script>
    
		
</body>
</html>