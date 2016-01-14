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
							<a class="btn btn-success"
								href="<c:url value="${currentUrl}/user/selectUser/all"/>"> <i
								class="fa fa-plus"></i> <spring:message code="btn.searchUsers" />
							</a> <a class="btn btn-primary"
								href="<c:url value="${currentUrl}/user/selectUser/friends"/>">
								<i class="fa fa-list"> </i> <spring:message code="btn.friends" />
							</a> <br> <br>


							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<c:url var="actionUrl" value="/save" />
										<div class="centerForm">
							

</div>
</div>


<br>
<br>
<%-- <span id="login"><sec:authentication property="name" /></span>  --%>
<div  id="login">${username}</div>
<br>

                        
                        
                        <table id="mytable" class="table table-bordered table-striped text-center" aria-describedby="mytable_info">
								<thead>
									<tr class="info"> 
									<th width="30%">Aktywni</th>
									<th width="10%"><spring:message code="table.options" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${users}" var="user">
									<c:if test="${user.username ne username}">
										<tr>
											<td>${user.username}</td>
                        <td>
                           <form action="${contextPath}/user/selectChat/${user.id}/" method="post">
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
		<script src="<c:url value="/resources/js/rest-chat-client.js" />"></script>
				
					<script type="text/javascript">
					function openModal() {
						$("#myModal").modal('show');
					}
					</script>
</body>
</html>