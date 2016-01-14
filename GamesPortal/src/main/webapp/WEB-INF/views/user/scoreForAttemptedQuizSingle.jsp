<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="../includes/scripts.jsp"%>
		<title>Play guiz</title>
<!--custom CSS  -->
<link href="../../resources/css/dashboard.css" rel="stylesheet">
<link href="../../resources/css/custom/stylesheet.css" rel="stylesheet">

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
					
<%-- 					<div id="roomId" style="display:none" >${room}</div> --%>
					
					

						
						<label>Congratulations on completing the quiz!</label></br> 
						<label>Your score for the quiz: ${myScore} / ${maxPoints}</label></br>
						<label>Highest score till now: ${highestScore}</label></br>
<%-- 						<a href="${contextPath}/user/home" class="btn btn-primary" id="end">End</a> --%>
						<a class="btn btn-warning" href="<c:url value='${currentUrl}/user/home' />">End</a>
						
<form class="loginForm">
					<input type="hidden" id="yourName" value="${username}" /><br/>
					<input type="hidden" id="yourEmail" value="${email}"  /><br/>
					<input type="hidden" id="myScore" value="${myScore}"  /><br/>
<%-- 					<input type="hidden" id="roomId" value="${room}" /><br/> --%>
						</form>
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
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</body>
</html>