<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="../includes/scripts.jsp"%>
		<title>Play guiz</title>
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
						
						<div id="roomId" style="display:none" >${room}</div>
						
				<div class="panel panel-default">
					<div class="panel-heading">${quiz.name}</div>
					<div class="panel-body">
					
					
					
					<div class="question">


						<form:form class="answerForm" action="${contextPath}/user/quiz/postAnswer/single" method="POST"
							modelAttribute="question">
							<form:label path="question">${currentCount}. ${question.question}</form:label>
							</br>
							<form:hidden path="question" value="${question.question}" />
							<form:hidden path="id" value="${question.id}"></form:hidden>
							<form:radiobutton path="selectedAnswer" value="a" />A. ${question.answera}</br>
							<form:radiobutton path="selectedAnswer" value="b" />B. ${question.answerb}</br>
							<form:radiobutton path="selectedAnswer" value="c" />C. ${question.answerc}</br>
							<form:radiobutton path="selectedAnswer" value="d" />D. ${question.answerd}
							
							
							
							<br><br>
							<input type="hidden" name="isLastQuestion"
								value="${isLastQuestion}">
							<input type="hidden" name="count" value="${currentCount}">
							<input type="hidden" name="room" value="${room}">
							<c:if test="${isLastQuestion==0}">
								<button type="submit" class="btn btn-info">Next</button>
							</c:if>
							<c:if test="${isLastQuestion==1}">
								<button type="submit" class="btn btn-info">Submit</button>
							</c:if>

						</form:form>
						
						</div>
						
						<form class="loginForm">
					<input type="hidden" id="yourName" value="${username}" /><br/>
					<input type="hidden" id="yourEmail" value="${email}"  /><br/>
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