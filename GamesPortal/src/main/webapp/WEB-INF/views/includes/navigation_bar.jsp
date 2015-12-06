<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:url value="" var="currentUrl"></c:url>
<spring:message code="date" var="date" />

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
			<a class="navbar-brand" href="${contextPath}/" title="Strona Główna">Strona
				Główna</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${contextPath}/" title="Home"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
				<li><a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-expanded="false" title="Menu"><span
						class="glyphicon glyphicon-list" aria-hidden="true"></span><span
						class="caret"></span></a> <sec:authorize
						access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
						<ul class="dropdown-menu" role="menu">
							<sec:authorize access="hasRole('ROLE_ADMIN')">

								<li><a href="${contextPath}/users">Użytkownicy</a></li>
								<li><a href="${contextPath}/visitstypes">Rodzaje wizyt</a></li>
								<li><a href="${contextPath}/docspecs">Specjalizacje
										lekarskie</a></li>
								<li><a href="${contextPath}/editcontact">Edytuj dane
										kliniki</a></li>

							</sec:authorize>

							<sec:authorize access="hasRole('ROLE_USER')">

								<li><a href="${contextPath}/patientvisits">Zaplanowane
										wizyty</a></li>
								<li><a href="${contextPath}/historicalvisits">Historia
										wizyt</a></li>
								<li><a href="${contextPath}/editaccount">Edytuj swoje
										dane</a></li>
								<li><a href="${contextPath}/editpassword">Zmień hasło</a></li>
								<li><a href="${contextPath}/patientvisits/new">Dodaj
										nową wizytę</a></li>

							</sec:authorize>
					</sec:authorize></li>

			</ul>
			<ul class="navbar-form navbar-right">
						<li><c:if test="${username != null }">
							<c:url var="logoutUrl" value="/logout" />
								<form action="${logoutUrl}" method="post">
						    	<span class="navbar-right-text"><span id="customDateTag"><date:displayDate prefix="${date}" /> | </span><spring:message code="user.logged" /></span> <span
								class="navbar-right-login" id="login"><sec:authentication property="name" /></span>
						      <input class="btn btn-danger" type="submit" value=<spring:message code="user.logout"/> />
						      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						    </form>						
						</c:if>
						</li>
						<li>
						<div class="navbar-right-text">
						<spring:message code="language" />
					: <a href=" ${currentUrl}?language=en">English</a> | <a
						href="${currentUrl}?language=pl">Polski</a>
						</div>
						</li>
						
					</ul>	
		</div>
		<!--/.nav-collapse -->
	</div>
	<!-- /.container -->
</nav>

