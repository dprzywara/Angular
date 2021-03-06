<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>

<%@include file="../includes/scripts.jsp"%>
<title>User Page</title>

<script type="text/javascript" src='<c:url value="/resources/js/lib/jquery.min.js"/>'></script>

 <script type="text/javascript" src='<c:url value="/resources/js/lib/angular.min.js"/>'></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.js' />"></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/jquery.dataTables.min.js' />"></script>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-datatables/dist/angular-datatables.min.js' />"></script>
<%--  <script src="<c:url value='/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.js' />"></script> --%>
 <script src="<c:url value='/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.min.js' />"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
 
 <link rel="stylesheet" href='<c:url value="/resources/js/angular/bower_components/angular-flash-alert/dist/angular-flash.min.css'"/>'>
 
</head>
<body role="document">
	<%@include file="../includes/header2.jsp"%>
	<div class=" client-photo-background">


		<div class="container-fluid">
			<div class="row">
				<%@include file="../includes/side_bar.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
					<div class="jumbotron">
						<h2 class="sub-header">
							Select Category
						</h2>


						<div class="container">
<!-- 							<br> <br> -->


							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<c:url var="actionUrl" value="/save" />
<!-- 										<div class="centerForm"> -->

											

 
<form:form method="POST" modelAttribute="category" class="form-horizontal">
<%-- <form:input type="hidden" path="id" id="id"/> --%>



<div class="sss">Category: <form:select path="id">
	<form:options items="${categoryList}" itemLabel="name" itemValue="id" />
</form:select>
<form:errors path="id" cssClass="error" /><input class="btn btn-success" type="submit" value="Next"> <a class="btn btn-warning" href="<c:url value='${currentUrl}/user/home' />">Cancel</a></div>
</form:form>

<!-- < -->
<!-- <table> -->

<!-- <tr > -->

<!-- <td>Category:  </td> -->
<!-- <td> -->
<%-- <form:select path="id" > --%>
<%-- 	<form:options items="${categoryList}" itemLabel="name" itemValue="id" /> --%>
<%-- </form:select> --%>
 <!-- </td> --> 
<%-- <td><form:errors path="id" cssClass="error" /></td> --%>
<!-- <td> -->
<%-- <input type="submit" value="Dalej">  or <a href="<c:url value='${currentUrl}/user/home' />">Cancel</a> --%>
<!-- </td> -->

<!-- </tr> -->
<!-- </table> -->
<!-- </div> -->


<%-- <form:select path="category"> --%>
<%-- 								<form:options items="${categoryList}" itemValue="id" /> --%>
<%-- 							</form:select> --%>
<%-- 							<form:errors path="category" cssClass="error" /> --%>
							
<!-- 							<input type="submit" value="Next" -->
<!-- 											class="btn btn-primary btn-sm" /> or <a -->
<%-- 											href="<c:url value='/user/home' />">Cancel</a> --%>

</div>
</div>
<!-- </div> -->
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>