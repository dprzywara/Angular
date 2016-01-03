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
						
						<div id="roomId" style="display:none" >${room}</div>
						
				<div class="panel panel-default">
					<div class="panel-heading">${quiz.name}</div>
					<div class="panel-body">
					
					
					
					<div class="question">


						<form:form class="answerForm" action="${contextPath}/user/quiz/postAnswer" method="POST"
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
						
						<section class="section">
						
						<div class="waiting">

						<h2>Waiting for opponent answer</h2>

						</div>
						
<!-- 						<div class="left"> -->

<!-- 			<img src="../../../../resources/images/unnamed.jpg" id="leftImage" /> -->

<!-- 			<div class="info"> -->
<!-- 				<h2><span class="nickname-left"></span> has left this quiz.</h2> -->
<!-- 				<h5>You win this game!.</h5> -->
<!-- 			</div> -->

<!-- 		</div> -->
						</section>
						
						
<!-- 						======================== -->


<div class="connected">

			<img src="../../../../resources/images/unnamed.jpg" id="creatorImage" />

			<div class="infoConnected">
				<h2>Who are you?</h2>
				<br/>

				<form class="loginForm">
					<input type="hidden" id="yourName" value="${username}" /><br/>
					<input type="hidden" id="yourEmail" value="${email}"  /><br/>
					<input type="submit" id="yourEnter" value=" Rozpocznij czat " />
				</form>

			</div>

		</div>

		<div class="personinside">

			<img src="../../../../resources/images/unnamed.jpg" id="ownerImage" />

			<div class="infoInside">
				<h2>Play with <span class="nickname-chat"></span></h2>
				<br/>

				<form class="loginForm">
					<input type="text" id="hisName" placeholder="Your nick name" /><br/>
					<input type="text" id="hisEmail" placeholder="Your email address" /><br/>
					<input type="submit" id="hisEnter" value="CHAT" />
				</form>

			</div>

		</div>

		

		

		<div class="toomanypeople">

			<h2>Oops, you can not join this chat!</h2>
			<h5>There are already two people in it. Would you like to create a <a title="New Room" href="/create" id="room">new room</a>?</h5>

		</div>

		

		<div class="chatscreen">

			<ul class="chats">
				<!-- The chat messages will go here -->
			</ul>

		</div>

<!-- section -->

	<footer>

		<form id="chatform">

			<textarea id="message" placeholder="Write something.."></textarea>
			<input type="submit" id="submit" value="SEND"/>

		</form>

	</footer>

<!-- ------------------------------- -->

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
	<script src="<c:url value="/resources/js/angular/chat/socket.io.js" />"></script>
	<script src="<c:url value="/resources/js/angular/chat/chatQuestion.js" />"></script>
	<script src="<c:url value="/resources/js/angular/chat/moment.min.js" />"></script>		
	</script>
</body>
</html>