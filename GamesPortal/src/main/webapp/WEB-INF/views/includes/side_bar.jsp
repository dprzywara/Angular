<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>				
<c:url value="" var="currentUrl"></c:url>
				
				<sec:authorize access="hasRole('ROLE_USER')">
				<div class="col-sm-3 col-md-2 sidebar">
					<ul class="nav nav-sidebar">
					<li class="active"><a href="${contextPath}/user/home"><b>User Panel</b></a></li>
					<li><a href="${contextPath}/user/home"><span
							class="glyphicon glyphicon-stats"></span> Dashboard</a></li>
				</ul>
					<ul class="nav nav-sidebar">
						<li><a href="${contextPath}/user/chooseQuiz"><span
							class="glyphicon glyphicon-search"></span><spring:message code="sidebar.playQuiz" /></a></li>
							<li><a href="${contextPath}/user/selectCategory"><span
							class="glyphicon glyphicon-play-circle"></span><spring:message code="sidebar.playQuizDirect" /></a></li>
						<li><a href="${contextPath}/user/messages"><span
							class="glyphicon glyphicon-envelope"></span><spring:message code="sidebar.messages" /></a></li>
						<li><a href="${contextPath}/user/updateUser"><span class="glyphicon glyphicon-user"></span><spring:message code="sidebar.editAccount" /></a></li>
						<li><a href="${contextPath}/user/changePassword"><span
							class="glyphicon glyphicon-lock"></span><spring:message code="sidebar.changePassword" /></a></li>
					<li><a href="${contextPath}/user/chooseQuizComment"><span
							class="glyphicon glyphicon-pencil"></span> <spring:message code="sidebar.comment" /></a></li>
					
					</ul>

				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="/GamesPortal/logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
							
							
				</ul>
				</div>
				
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="col-xs-3 col-md-2 sidebar">
						<h3><spring:message code="admin.title" /></h3>
						<ul class="nav nav-sidebar">
						<li><a href="${contextPath}/admin/users"><span class="glyphicon glyphicon-user "><spring:message code="sidebar.users" /></a></li>
						<li><a href="${contextPath}/admin/categories"><span class="glyphicon glyphicon-list-alt "><spring:message code="sidebar.categories" /></a></li>
						<li><a href="${contextPath}/admin/questions"><span class="glyphicon glyphicon-folder-open "><spring:message code="sidebar.questions" /></a></li>
						<li><a href="${contextPath}/admin/quizes"><span class="glyphicon glyphicon-play "><spring:message code="sidebar.quizes" /></a></li>
						<li><a href="/quizzme/quiz/create "><span
							class="glyphicon glyphicon-plus"></span> Create Quizzes</a></li>
						<li><a href="${contextPath}/admin/games"><span class="glyphicon glyphicon-align-justify "><spring:message code="sidebar.games" /></a></li>
						</ul>
						
							<ul class="nav nav-sidebar">
					<li><a href="/GamesPortal/logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
							
							
				</ul>
						
					</div>
				</sec:authorize>
				
				