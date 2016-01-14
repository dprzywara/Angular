<%@ include file="taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:url value="" var="currentUrl"></c:url>
<spring:message code="date" var="date" />


<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Strona Główna</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${contextPath}/" title="Home"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><spring:message code="language" /> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href=" ${currentUrl}?language=en">English</a></li>
            <li><a href="${currentUrl}?language=pl">Polski</a></li>
            
          </ul>
        </li>
       <li><a id="messages" href="${contextPath}/user/invitations" title="Zaproszenia"><span
								class="glyphicon glyphicon-inbox" aria-hidden="true"></span></a>
						</li>
						<li><a id="chatInvitations" href="${contextPath}/user/chat/invitations" title="Wiadomości"><span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span></a>
						</li>
<!-- 						<li><a href="/kurierzy/main/admin/rides_history" title="Historia kursów"><span -->
<!-- 								class="glyphicon glyphicon-list" aria-hidden="true"></span></a> -->
<!-- 						</li> -->
<!-- 						<li><a href="/kurierzy/main/admin/price_list" title="Cennik"><span -->
<!-- 								class="glyphicon glyphicon-usd" aria-hidden="true"></span></a> -->
<!-- 						</li> -->
<!-- 						<li><a href="/kurierzy/main/admin/users" title="Zarządzanie użytkownikami"><span -->
<!-- 								class="glyphicon glyphicon-user" aria-hidden="true"></span></a> -->
<!-- 						</li> -->
<!-- 						<li><a href="/kurierzy/main/admin/working_time" title="Czas pracy"><span -->
<!-- 								class="glyphicon glyphicon-time" aria-hidden="true"></span></a> -->
<!-- 						</li> -->
						
						
					</ul>
      </ul>
      <ul class="nav navbar-nav navbar-right navbar-right-text">
      
      						<li><c:if test="${username != null }">
<%-- 							<c:url var="logoutUrl" value="/logout" /> --%>
<%-- 								<form action="${logoutUrl}" method="post"> --%>
						    	<span class="navbar-right-text"><span id="customDateTag"><date:displayDate prefix="${date}" /> | </span><spring:message code="user.logged" /></span> <span
								class="navbar-right-login" id="login"><sec:authentication property="name" /></span>
<!-- 						      <input class="btn btn-danger " type="submit" value=<spring:message code="user.logout"/> /> -->
<%-- 						      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
<!-- 						    </form>						 -->
						</c:if></li>
						<spring:message code="language" />: <a href=" ${currentUrl}?language=en">English</a> | <a href="${currentUrl}?language=pl">Polski</a>
						<div></div>
<!--         <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
						
<!--         <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Login</a></li> -->
       
      </ul>
    </div>
  </div>
</nav>