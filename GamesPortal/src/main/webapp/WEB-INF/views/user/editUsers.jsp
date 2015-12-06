<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>

<html>
<head>
<title><spring:message code="user.list" /></title>
<%@include file="../includes/scripts.jsp"%>
</head>
<body role="document">
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
					<h1><spring:message code="user.list" /></h1>
					
						<div class="row" data-ng-app="myApp">
						
							<c:if test="${username != null }">
							
							<div class="pull-left" data-ng-controller="myController">
        						<a class="btn btn-success"  href="<c:url value="${currentUrl}/admin/addUser"/>"> <i
								class="fa fa-plus"></i> <spring:message code="btn.addUser" /></a> 
								<a class="btn btn-primary" href="<c:url value="/UserRank"/>">  <i
								class="fa fa-list-ol"></i> <spring:message code="btn.ranking" /></a>
								
            					<button type="button" class="btn btn-default" onclick="openModal();" data-ng-click="getUserDataFromServer()"><spring:message code="btn.loggedInUsers" /></button>
			             		<div id="myModal" class="modal fade">
			    					<div class="modal-dialog">
			        					<div class="modal-content">
			            					<div class="modal-header">
			                					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                					<h4 class="modal-title"><spring:message code="btn.loggedInUsers" /></h4>
			            					</div>
			            					<div class="modal-body">
			                					<ol >
			    									<li data-ng-repeat="user in users">{{ user.username }}</li>
												</ol>
			            					</div>
			            					<div class="modal-footer">
			                					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			               					</div>
			        					</div>
			   					 	</div>
								</div>
							</div>								
						</c:if>							
					</div>
					<br>
					<div class="table-responsive row">
						<table id="mytable" class="table table-striped table-bordered table-condensed text-center" aria-describedby="mytable_info">
							<thead>
								<tr class="info">
									<th width="10%"><spring:message code="user.firstName" /></th>
									<th width="10%"><spring:message code="user.lastName" /></th>
									<th width="10%"><spring:message code="user.username" /></th>
									<th width="10%"><spring:message code="user.email" /></th>
									<th width="10%"><spring:message code="user.roles" /></th>
									<th width="10%"><spring:message code="user.status" /></th>
									<th width="15%"><spring:message code="user.options" /></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${users}" var="user" varStatus="loopCounter">
									<tr>
		
											<td>${user.firstName}</td>
											<td>${user.lastName}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
										<td><c:forEach items="${user.roles}" var="role">
												<c:out value="${role.role} " />
											</c:forEach>
										<td>
												<c:if test="${user.enabled}"><spring:message code="answer.yes" /></c:if>
												<c:if test="${!user.enabled}"><spring:message code="answer.no" /></c:if>
											</td>
										<td><nobr>
												<a class="btn btn-primary" href="<c:url value="/admin/edit-user-${user.id}"/>"> <i class="fa fa-pencil"></i> <spring:message code="btn.Edit" />
												</a> <a class="btn btn-danger" onclick="return confirm('OK to delete ${user.username} ?');"
													href="deleteUser/${user.id}"> <i class="fa fa-times"></i>
													<spring:message code="btn.Delete" />
												</a>
										</nobr></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
				</div>
			</div>
			</div>
			</div>
			</div>
			
		</div>
</body>
</html>