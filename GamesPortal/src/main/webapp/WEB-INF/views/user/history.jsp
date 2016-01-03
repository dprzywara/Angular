<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<meta name="viewport"
			content="width=device-width, initial-scale=0.75, maximum-scale=0.75, user-scalable=no">
	
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
		
		<!-- Custom styles for this template -->
		<link href="<c:url value="/resources/theme/css/theme.css" />" rel="stylesheet">

		<!-- JQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	</head>
	<body role="document">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/kurierzy/main/client/home" title="Taxi Wrocław">Kurierzy Wrocław</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="/kurierzy/main/client/home" title="Home"><span
								class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
						<li><a href="/kurierzy/main/client/contact" title="Zostaw nam wiadomość"><span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span></a></li>
						<li class="active"><a id="messages" href="/kurierzy/main/client/history" title="Historia zleceń"><span
								class="glyphicon glyphicon-list" aria-hidden="true"></span></a></li>
						<li><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false" title="Zgłoś zlecenie"><span
								class="glyphicon glyphicon-edit" aria-hidden="true"></span><span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li class="active"><a href="/kurierzy/main/client/order_now">Natychmiastowe</a></li>
								<li><a href="/kurierzy/main/client/order">Na określony termin</a></li>
								<li><a href="/kurierzy/main/client/standing_order">Stałe</a></li>
							</ul>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false" title="Nasi kierowcy"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span><span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<c:forEach var="kierowca" items="${taxiList}">
									<li>
										<a href="/kurierzy/main/client/driver.do?id=${kierowca.id}">
											<span class="glyphicon glyphicon-map-marker"></span><c:out value="${kierowca.username}"></c:out> 
											<span class="glyphicon glyphicon-earphone"></span><c:out value="${kierowca.email}"></c:out>
										</a>
									</li>
								</c:forEach>
							</ul>
						</li>
						<c:if test="${userRole eq '[ROLE_USER]'}">
							<li><a href="/kurierzy/main/client/details" title="Zarządzaj swoimi danymi"><span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></li>
						</c:if>							
					</ul>
					<div class="navbar-form navbar-right">
						<c:if test="${not empty userLogin}">
							<c:url var="logoutUrl" value="/logout"/>
						    <form action="${logoutUrl}" method="post">
						    	<span class="navbar-right-text">Jesteś zalogowany jako:</span> <span
								class="navbar-right-login" id="login">${userLogin}</span>
						      <input class="btn btn-danger" type="submit" value="Wyloguj" />
						      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						    </form>						
						</c:if>
					</div>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- /.container -->
		</nav>
		<div class="taxi-photo-background">
			<div class="container theme-showcase" role="main">
				<div class="jumbotron">
					<h2 class="sub-header">Historia zleceń</h2>
          			<div class="table-responsive">
            			
          			</div> <!-- /table-responsive -->
				</div>
			</div><!-- /container -->
		</div>
		
		<!-- Rest-client -->
		<script src="<c:url value="/resources/theme/js/rest-client.js" />"></script>
	</body>
</html>
