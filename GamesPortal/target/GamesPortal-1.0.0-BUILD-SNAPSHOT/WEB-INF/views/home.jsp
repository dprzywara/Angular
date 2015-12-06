<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/taglibs.jsp"%>
<%@ page session="false"%>
<html ng-app>
    <head>
        <title>Hello World</title>
        <%@include file="includes/scripts.jsp"%>
    </head>
     
    <body>
        <label>Name :</label><input type="text" ng-model="name" placeholder="Enter your name"/>
        <h1>Hello <span ng-bind="name"></span></h1>
             
        <h1>Hey {{name}}</h1>
<!--         <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.min.js"> -->
        </script>
    </body>
</html>















<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!-- <html> -->
<!-- <head> -->
<!-- <title>Home Page | Beingjavaguys.com</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- 		<br /> <br /> <br /> -->
<!-- 		<h1>Default Logged in User page !!!</h1> -->
<%-- 		<c:url var="logoutUrl" value="/logout" /> --%>
<%-- 		<form action="${logoutUrl}" method="post"> --%>
<!-- 			<input type="submit" value="Log out" /> <input type="hidden" -->
<%-- 				name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
<!-- 		</form> -->
	

<!-- </body> -->
<!-- </html> -->