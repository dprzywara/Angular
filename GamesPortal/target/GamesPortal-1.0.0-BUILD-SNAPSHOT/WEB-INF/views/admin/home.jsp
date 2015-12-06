<%@page session="true"%>
<%-- <%@ page language="java" contentType="text/html; charset=utf-8" --%>
<%-- 	pageEncoding="utf-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=0.75, maximum-scale=0.75, user-scalable=no">
<title><spring:message code="admin.title" /></title>
<%@include file="../includes/scripts.jsp"%>

</head>
 <body role="document"> 
<%@include file="../includes/header2.jsp"%>
<%-- <%@include file="../includes/navigation_bar.jsp"%> --%>
	<div class="container-fluid">
		<div class="row">
		<div class="sidebar-fixed-top">
			<%@include file="../includes/side_bar.jsp"%>
		</div>

		</div>
	</div>


<!-- <body role="document"> -->
<%-- 		<%@include file="../includes/header2.jsp"%> --%>
		
					
<!-- 		<div class=" admin-photo-background"> -->
		
<!-- 			<div class="container-fluid"> -->
			
<!-- 				<div class="row"> -->
<%-- 					<%@include file="../includes/side_bar.jsp"%> --%>
<!-- 					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2"> -->
<!-- 						<div class="jumbotron"> -->
<!-- 							<h1>Panel dla Administratora</h1> -->
<!-- 							<p>Na Stronie możliwa jest edycja wszystkich danych dotyczących użytkowników i przychodni.</p> -->
							
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div>row -->
<!-- 			</div>/container-fluid -->
<!-- 		</div>/photo-background			 -->



	


<!-- 	trzecia wersja -->
<%-- 	<c:url var="logoutUrl" value="/logout" /> --%>
<%-- 	<form action="${logoutUrl}" method="post"> --%>
<!-- 		<input type="submit" value="Log out" /> <input type="hidden" -->
<%-- 			name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
<!-- 	</form> -->



</body>
</html>