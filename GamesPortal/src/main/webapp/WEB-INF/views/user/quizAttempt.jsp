<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="../includes/scripts.jsp"%>
		<title>User Page</title>
<!--custom CSS  -->
<link href="../../../resources/css/dashboard.css" rel="stylesheet">


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

						<label>Number of questions: ${quiz.questions.size()}</label></br> <label>Total
							credit: ${quiz.questions.size()*10}</label>
						<form:form action="${contextPath}/user/quiz/play" method="POST">
							<input type="hidden" name="count" value="0"> <input
								type="hidden" name="quizId" value="${quiz.id }"> <input
								type="submit" value="Start quiz" class="btn btn-info">
						</form:form>

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