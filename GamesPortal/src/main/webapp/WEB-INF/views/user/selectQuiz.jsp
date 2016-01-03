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

											

Select quiz:  
<%-- <form:form method="POST" modelAttribute="quiz" class="form-horizontal"> --%>
<%-- <form:form method="POST" action="/user/home/selectUser" class="form-horizontal"> --%>
<%-- <form:input type="hidden" path="id" id="id"/> --%>
<%-- <form:input type="hidden" path="level" id="level"/> --%>
<%-- <form:input type="hidden" path="popularity" id="popularity"/> --%>
<%-- <form:input type="hidden" path="category" id="category"/> --%>

<form:form method="POST" modelAttribute="myform" action="${contextPath}/user/selectQuiz/"> 
<table>

<tr>
<td>Quiz : </td>
<td>
<form:select path="quizId">
	<form:options items="${quizList}" itemLabel="name" itemValue="id"  />
</form:select>
</td>
<td><form:errors path="quizId" cssClass="error" /></td>
<td>
<input type="submit" value="Dalej">  or <a href="<c:url value='${currentUrl}/user/home' />">Cancel</a>
</td>
</tr>
</table>

</form:form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>