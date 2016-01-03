<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<%@ page session="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="../includes/scripts.jsp"%>
		<title>Chat</title>
<link href="../../resources/css/custom/stylesheet.css" rel="stylesheet">




</head>

	<body role="document" >
		<%@include file="../includes/header2.jsp"%>
		<div class=" client-photo-background">
			<div class="container-fluid">
				<div class="row">
					<%@include file="../includes/side_bar.jsp"%>
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
	
				</br>
<div  id="login">${username}</div>				



	<section class="section">

		<!-- These elements are displayed as white info cards in the middle of the screen -->

		<div class="connected">

			<img src="../../resources/images/unnamed.jpg" id="creatorImage" />

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

			<img src="../../resources/images/unnamed.jpg" id="ownerImage" />

			<div class="infoInside">
				<h2>Chat with <span class="nickname-chat"></span></h2>
				<br/>

				<form class="loginForm">
					<input type="text" id="hisName" placeholder="Your nick name" /><br/>
					<input type="text" id="hisEmail" placeholder="Your email address" /><br/>
					<input type="submit" id="hisEnter" value="CHAT" />
				</form>

			</div>

		</div>

		<div class="invite-textfield">

			<h2>Waiting for user</h2>
			<h5>Invite a friend by sending them this URL</h5>

			<div class="link">
				<a title="Invite a friend" href="" id="link"></a>
			</div>

		</div>

		<div class="left">

			<img src="../../resources/images/unnamed.jpg" id="leftImage" />

			<div class="info">
				<h2><span class="nickname-left"></span> has left this chat.</h2>
				<h5>Invite somebody else by sending them this page.</h5>
			</div>

		</div>

		<div class="toomanypeople">

			<h2>Oops, you can not join this chat!</h2>
			<h5>There are already two people in it. Would you like to create a <a title="New Room" href="/create" id="room">new room</a>?</h5>

		</div>

		<div class="nomessages">

			<img src="../../resources/images/unnamed.jpg" id="noMessagesImage" />

			<div class="info">
				<h2>You are chatting with <span class="nickname-chat"></span>.</h2>
				<h5>Send them a message from the form below!</h5>
			</div>

		</div>

		<div class="chatscreen">

			<ul class="chats">
				<!-- The chat messages will go here -->
			</ul>

		</div>

	</section>

	<footer>

		<form id="chatform">

			<textarea id="message" placeholder="Write something.."></textarea>
			<input type="submit" id="submit" value="SEND"/>

		</form>

	</footer>

	





			</div>
			
</div>
</div>

		</div>
	</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="<c:url value="/resources/js/angular/chat/socket.io.js" />"></script>
<script src="<c:url value="/resources/js/angular/chat/chat.js" />"></script>
<script src="<c:url value="/resources/js/angular/chat/moment.min.js" />"></script>
</body>
</html>
