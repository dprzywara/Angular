<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>

<%@include file="../includes/scripts.jsp"%>
<title>User Page</title>

<script type="text/javascript" src='<c:url value="/resources/js/lib/jquery.min.js"/>'></script>

 <script type="text/javascript" src='<c:url value="/resources/js/lib/angular.min.js"/>'></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.js' />"></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/jquery.dataTables.min.js' />"></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.min.js' />"></script>
<%--  <script src="<c:url value='/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.js' />"></script> --%>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.min.js' />"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
 
 <link rel="stylesheet" href='<c:url value="/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.min.css'"/>'>
 
</head>
<body role="document">
	<%@include file="../includes/header2.jsp"%>
	<div class=" client-photo-background">


		<div class="container-fluid">
			<div class="row">
				<%@include file="../includes/side_bar.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
					<div class="jumbotron">
						<h2 class="sub-header">
							<spring:message code="sidebar.users" />
						</h2>


						<div class="container">
<!-- 							<br> <br>  -->


							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<c:url var="actionUrl" value="/save" />
										
										
<!-- 										<div class="centerForm"> -->

											

<!-- Select category:   -->
<%-- <form:form method="POST" modelAttribute="category" class="form-horizontal"> --%>
<%-- <%-- <form:input type="hidden" path="id" id="id"/> --%>

<!-- <table> -->

<!-- <tr> -->
<!-- <td>Category : </td> -->
<!-- <td> -->
<%-- <form:select path="name"> --%>
<%-- <%-- 	<form:option value="NONE" label="--- Select ---"/> --%>
<%-- 	<form:options items="${categoryList}" /> --%>
<%-- </form:select> --%>
<!-- </td> -->
<!-- <td> -->
<!-- <input type="submit" value="Dalej"> -->
<!-- </td> -->
<%-- <td><form:errors path="name" cssClass="error" /></td> --%>
<!-- </tr> -->
<!-- </table> -->

<%-- </form:form> --%>
<%-- <form:form method="POST" commandname="smartphone" action="phone-result.html">   --%>
<!-- <table>   -->
<!--     <tbody><tr>   -->
<!--     <td>   -->
<!--         <ul>   -->
<%--             <form:select path="phone">   --%>
<%--                 <form:option value="-" label="--Select phone"></form:option> --%>
<%--                 <form:options items="${phonesMap}"/>   --%>
<%-- <%--                 </form:options> --%> 
<%--             </form:select>   --%>
<!--         </ul>   -->
<!--     </td>   -->
<!--     </tr>   -->
<!--     <tr>   -->
<!--         <td>   -->
<!--             <input type="submit" value="Submit">   -->
<!--         </td>   -->
<!--     </tr>   -->
<!-- </tbody></table>    -->
<%-- </form:form> --%>



<%-- <form:form method="POST" modelAttribute="smartphone" action="phone-result.html">   --%>
<!-- <table>   -->
<!--     <tbody><tr>   -->
<!--     <td>   -->
<!--         <ul>   -->
<%--             <form:select path="phone" items="${phonesMap}">   --%>
<%--         </form:select></ul>   --%>
<!--     </td>   -->
<!--     </tr>   -->
<!--     <tr>   -->
<!--         <td>   -->
<!--             <input type="submit" value="Submit">   -->
<!--         </td>   -->
<!--     </tr>   -->
<!-- </tbody></table>     -->
<%-- </form:form>   --%>


<!-- 									<a class="btn btn-primary" -->
<%-- 										href="<c:url value="/"/>"> <i --%>
<%-- 										class="fa fa-pencil"></i> <spring:message code="btn.Edit" /> --%>
<!-- 									</a>Next</a> -->
									
									
									
									
									<!-- /table-responsive -->



<!-- <div class="row" data-ng-app="myApp"> -->
<!-- <div data-ng-controller="myController"> -->
<%-- 	<button type="button" class="btn btn-default" onclick="openModal();" data-ng-click="getUserDataFromServer()"><spring:message code="btn.loggedInUsers" /></button> --%>
<!-- 			             		<div id="myModal" class="modal fade"> -->
<!-- 			    					<div class="modal-dialog"> -->
<!-- 			        					<div class="modal-content"> -->
<!-- 			            					<div class="modal-header"> -->
<!-- 			                					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<%-- 			                					<h4 class="modal-title"><spring:message code="btn.loggedInUsers" /></h4> --%>
<!-- 			            					</div> -->
<!-- 			            					<div class="modal-body"> -->
<!-- 			                					<ol > -->
<!-- 			    									<li data-ng-repeat="user in users">{{ user }}</li> -->
<!-- 												</ol> -->
<!-- 			            					</div> -->
<!-- 			            					<div class="modal-footer"> -->
<!-- 			                					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!-- 			               					</div> -->
<!-- 			        					</div> -->
<!-- 			   					 	</div> -->
<!-- 								</div> -->
								
<!-- 								<button type="button" class="btn btn-default" onclick="getchat();" >testy</button> -->

</div>
</div>


<br>
<br>
<%-- <span id="login"><sec:authentication property="name" /></span>  --%>
<div  id="login" style="display:none" >${username}</div>
<br>
<%-- <div  ng-app="myApp"  ng-controller="SelectController as ctr" ng-init="init('<sec:authentication property="name" />')">	 --%>

<ol >
<!-- 			    									<li data-ng-repeat="user in users">{{ user.username }}</li> -->
<!-- 												</ol> -->
		
<!-- 					  <table  datatable="ng"  class="table table-striped table-bordered table-condensed text-center" aria-describedby="mytable_info"> -->
<!-- 						// id="mytable" -->
<!-- //datatable="ng" -->
<!--                       <thead> -->
<!--                          <tr class="info"> -->
<!-- 									<th width="30%">Aktywni</th> -->
<%-- 									<th width="10%"><spring:message code="table.options" /></th> --%>
<!-- 								</tr> -->
<!--                       </thead> -->
<!--                       <tbody> -->
                      
                      
  
<!--     <button >Send</button> -->

                      
<!--                           <tr ng-repeat="c in users"> -->
                          
<!--                               <td><span ng-bind="c.username"></span></td> -->

<%-- 						<c:forEach items="${users}" var="user"> --%>
<!-- 										<tr> -->
<%-- 											<td>${user.id}</td> --%>
                              <td>
<!--                               <form name="InviteForm" novalidate class="form-inline"> -->
<%--                           <input type="hidden" class="form-control input-sm" placeholder="title" ng-model="invite.invitingUser" ng-value="<sec:authentication property="name" />" ng-required="true"> --%>
<!--                           <input type="hidden" class="form-control input-sm" placeholder="title" ng-model="invite.invitedId" ng-value="c.id" ng-required="true"> -->
<%--                           <input type="hidden" name="invitingUser" ng-model="invite.invitingUser" value="{{<sec:authentication property="name" />}}" style="display: none;"/> --%>
<!--                           <input type="hidden" name="invitedId" ng-model="invite.invitedId" ng-value="c.id" /> -->
<!--                             <input type="text" name="ctr.invite.invited"  name="invite" ng-value="c.id"/> -->
<!--                             <input type="text" name="invited" "/> -->
<!--                               <button class="btn btn-primary btn-sm" ng-click="sendInvite(invite)">Invite</button>  -->
                        
                         <a class="btn btn-warning" href="<c:url value='${currentUrl}/user/home' />">Cancel</a> 
                             
							 <a class="btn btn-primary" href="<c:url value='${currentUrl}/user/selectCategory' />">Back</a>
                        <table id="mytable" class="table table-bordered table-striped text-center" aria-describedby="mytable_info">
								<thead>
									<tr class="info"> 
									<th width="30%">Aktywni</th>
									<th width="10%"><spring:message code="table.options" /></th>
									</tr>
								</thead>
								<tbody >
									<c:forEach items="${users}" var="user">
									<c:if test="${user.username ne username}">
										<tr>
											<td  style="vertical-align: middle;">${user.username}</td>
                        <td style="vertical-align: middle;">
                           <form style="margin-bottom:0px" action="${contextPath}/user/select/${user.id}/${quizName}" method="post">
                            <input type="submit" value="Invite"
											class="btn btn-primary btn-sm" /> 
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                             </form>
                              </td>
                         	 </tr>
                         	 </c:if>
                             </c:forEach>
                      </tbody>
                  </table>
<!--                       </div> -->

</div>
</div>
</div>
</div>
</div>

								</div>
							</div>
							<!-- row -->
						</div>
						<!-- /container-fluid -->
					</div>
				</div>
				<!-- /photo-background -->
				<!-- JQuery -->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

				<!-- Latest compiled and minified JavaScript -->
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
					
		<script src="<c:url value='/resources/js/angular/app.js' />"></script>
      <script src="<c:url value='/resources/js/angular/categories/select_service.js' />"></script>
      <script src="<c:url value='/resources/js/angular/categories/select_controller.js' />"></script>
			<!-- Rest-client -->
		<script src="<c:url value="/resources/js/rest-client.js" />"></script>
				
					<script type="text/javascript">
					function openModal() {
						$("#myModal").modal('show');
					}
					</script>
</body>
</html>