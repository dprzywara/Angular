
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top">
<div class="row">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/kurierzy/main/admin/home" title="Taxi Wrocław">Kurierzy Wrocław</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/kurierzy/main/admin/home" title="Home"><span
								class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
						</li>
						<li><a id="messages" href="/kurierzy/main/admin/orders" title="Nowe Zlecenia"><span
								class="glyphicon glyphicon-inbox" aria-hidden="true"></span></a>
						</li>
						<li><a href="/kurierzy/main/admin/mails" title="Wiadomości"><span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span></a>
						</li>
						<li><a href="/kurierzy/main/admin/rides_history" title="Historia kursów"><span
								class="glyphicon glyphicon-list" aria-hidden="true"></span></a>
						</li>
						<li><a href="/kurierzy/main/admin/price_list" title="Cennik"><span
								class="glyphicon glyphicon-usd" aria-hidden="true"></span></a>
						</li>
						<li><a href="/kurierzy/main/admin/users" title="Zarządzanie użytkownikami"><span
								class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
						</li>
						<li><a href="/kurierzy/main/admin/working_time" title="Czas pracy"><span
								class="glyphicon glyphicon-time" aria-hidden="true"></span></a>
						</li>
					</ul>
					  <ul class="nav navbar-nav navbar-right ">
<!-- 					<div class="navbar-form navbar-right"> -->
						<li>
						<c:if test="${username != null }">
							<c:url var="logoutUrl" value="/logout"/>
						    <form action="${logoutUrl}" method="post">
						    	<span class="navbar-right-text"><spring:message code="user.logged" /></span> <span
								class="navbar-right-login" id="login"><sec:authentication property="name" /></span>
						      <input class="btn btn-danger" type="submit" value=<spring:message code="user.logout"/> />
						      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						    </form>						
						</c:if>
<!-- 						<div class="navbar-right-text"> -->
						</li>
						<spring:message code="language" />
					: <a href=" ${currentUrl}?language=en">English</a> | <a
						href="${currentUrl}?language=pl">Polski</a>
						
						</ul>
						
<!-- 						</div> -->
					
<!-- 					</div> -->
					
					
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- /.container -->
			</div>
		</nav>