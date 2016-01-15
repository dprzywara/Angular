<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
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
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
				<div class="panel panel-default">
					<div class="panel-heading">${quiz.name}</div>
					<div class="panel-body">
						<label>Comments:</label></br>
						<table id="example" class="table table-striped table-bordered"
							cellspacing="0" width="100%">
							<c:if test="${quiz.comments.size()==0}">
								<tr>
									<td>Be the first to comment on this quiz.</td>
								</tr>
							</c:if>
							<tr>
							<th>Posted</th>
							<th>Comment</th>
							</tr>
							<c:forEach items="${quiz.comments}" var="comment">
								<tr>
									<td>${comment.user}</td>
							
								
									<td>${comment.comment}</td>
								</tr>
							</c:forEach>

						</table>
						<form:form action="${contextPath}/user/quiz/comment" method="POST"
							modelAttribute="comment">
							<input type="hidden" name="quizId" value="${quiz.id}"></input>
							<form:input type="text" name="comment" path="comment"
								placeholder="Write your comment here"
								style="  width: 366px;
  height: 55px;  margin-bottom: 2%;"></form:input></br>
							<button type="submit" class="btn btn-info">Post</button>
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

	<script
		src="http://cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
	<script
		src="http://cdn.datatables.net/plug-ins/1.10.6/integration/bootstrap/3/dataTables.bootstrap.js"></script>
	<script>
		
	</script>
</body>
</html>