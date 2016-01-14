<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="../includes/scripts.jsp"%>
		<title>User Page</title>
<!--custom CSS  -->
<link href="../../../../resources/css/dashboard.css" rel="stylesheet">
<!-- <link href="../../../../resources/css/custom/stylesheet.css" rel="stylesheet"> -->


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
<!-- 					<section class="section"> -->
<!-- 									<div class="graa"> -->
									
<!-- 									<img src="../../../../resources/images/unnamed.jpg" id="noMessagesImage" /> -->
<!-- 									<br/> -->
<!-- 									<br/> -->

<!-- 			<div class="info"> -->
				<h3>Now you can start quiz ${quiz.name}</h3>
			

										<label>Number of questions: ${quiz.questions.size()}</label>
<%-- 										<h5>Total credit: ${quiz.questions.size()*10}</h5> --%>
										
										<form:form action="${contextPath}/user/quiz/play/single"
											method="POST">
											<input type="hidden" name="count" value="0">
											<input type="hidden" name="quizId" value="${quiz.id }">
<%-- 											<input type="hidden" name="room" value="${room}"> --%>
											<input id="ttt" type="submit" value="Start quiz"
												class="btn btn-info">
												<a class="btn btn-warning" href="<c:url value='${currentUrl}/user/home' />">Cancel</a>
												<a class="btn btn-primary" href="<c:url value='${currentUrl}/user/chooseQuiz' />">Back</a>
										</form:form>
<!-- 										</div> -->
<!-- 									</div> -->

									<form class="loginForm">
					<input type="hidden" id="yourName" value="${username}" /><br/>
					<input type="hidden" id="yourEmail" value="${email}"  /><br/>
<!-- 					<input type="submit" id="yourEnter" value=" Rozpocznij czat " /> -->
						</form>
						
<%-- 						<div id="yourName" >${username}</div> --%>
<%-- 						<div id="yourEmail"   >${email}</div> --%>
						

<!-- 					<div class="invite-textfield"> -->

<!-- 			<h2>Waiting for opponent</h2> -->

<!-- 				</div> -->
<!-- 					<div class="waiting"> -->

<!-- 			<h2>Waiting for opponent</h2> -->

<!-- 				</div> -->
		
<!-- 		<div class="nomessages"> -->

<!-- 			<img src="../../../../resources/images/unnamed.jpg" id="noMessagesImage" /> -->

<!-- 			<div class="info"> -->
<!-- 				<h2>You can start play with <span class="nickname-chat"></span>.</h2> -->
<!-- 			</div> -->
			
			

<!-- 		</div> -->
		
<!-- 		<div class="left"> -->

<!-- 			<img src="../../../../resources/images/unnamed.jpg" id="leftImage" /> -->

<!-- 			<div class="info"> -->
<!-- 				<h2><span class="nickname-left"></span> has left this quiz.</h2> -->
<!-- 				<h5>You win this game!.</h5> -->
<!-- 			</div> -->

<!-- 		</div> -->
		
		
<!-- 				</section> -->

		</div>

					</div>
				</div>
<!-- 	----------------------------			 -->
				

		<!-- These elements are displayed as white info cards in the middle of the screen -->

		
		
		
<!-- 		==================================== -->
 </div>
<!--  jambotron  --> 
</div>

			</div>


		</div>
	</div>

	<script
		src="http://cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
	<script
		src="http://cdn.datatables.net/plug-ins/1.10.6/integration/bootstrap/3/dataTables.bootstrap.js"></script>
	
	
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<%-- 	<script src="<c:url value="/resources/js/angular/chat/socket.io.js" />"></script> --%>
<%-- 	<script src="<c:url value="/resources/js/angular/chat/chatQuiz.js" />"></script> --%>
<%-- 	<script src="<c:url value="/resources/js/angular/chat/moment.min.js" />"></script> --%>
		
	</script>
</body>
</html>