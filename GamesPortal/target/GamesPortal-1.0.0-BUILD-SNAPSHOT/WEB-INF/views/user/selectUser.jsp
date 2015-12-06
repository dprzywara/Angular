<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<%@include file="../includes/scripts.jsp"%>
<title>User Page</title>

</head>

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
							<spring:message code="sidebar.users" />
						</h2>


						<div class="container">
							<a class="btn btn-success"
								href="<c:url value="${currentUrl}/user/selectUser/all"/>"> <i
								class="fa fa-plus"></i> <spring:message code="btn.searchUsers" />
							</a> <a class="btn btn-primary"
								href="<c:url value="${currentUrl}/user/selectUser/friends"/>">
								<i class="fa fa-list"> </i> <spring:message code="btn.friends" />
							</a> <br> <br>


							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<c:url var="actionUrl" value="/save" />
										<div class="centerForm">

											<c:choose>
												<c:when test="${edit eq null}">
													<h2>
														<spring:message code="pageTitle.addMovie" />
													</h2>
												</c:when>
												<c:otherwise>
													<h2>
														<spring:message code="pageTitle.editMovie" />
													</h2>
												</c:otherwise>
											</c:choose>

Select phone:  
<form:form method="POST" modelAttribute="user" class="form-horizontal">
<%-- <form:input type="hidden" path="id" id="id"/> --%>

<table>

<tr>
<td>Country : </td>
<td>
<form:select path="username">
	<form:option value="NONE" label="--- Select ---"/>
	<form:options items="${phoneList}" />
</form:select>
</td>
<td><form:errors path="username" cssClass="error" /></td>
</tr>
</table>

</form:form>
<%-- <form:form method="POST" commandname="smartphone" action="phone-result.html">   --%>
<!-- <table>   -->
<!--     <tbody><tr>   -->
<!--     <td>   -->
<!--         <ul>   -->
<%--             <form:select path="phone">   --%>
<%--                 <form:option value="-" label="--Select phone"></form:option> --%>
<%--                 <form:options items="${phonesMap}"/>   --%>
<%-- <%--                 </form:options> --%> 
<%--             </form:select>   --%>
<!--         </ul>   -->
<!--     </td>   -->
<!--     </tr>   -->
<!--     <tr>   -->
<!--         <td>   -->
<!--             <input type="submit" value="Submit">   -->
<!--         </td>   -->
<!--     </tr>   -->
<!-- </tbody></table>    -->
<%-- </form:form> --%>



<%-- <form:form method="POST" modelAttribute="smartphone" action="phone-result.html">   --%>
<!-- <table>   -->
<!--     <tbody><tr>   -->
<!--     <td>   -->
<!--         <ul>   -->
<%--             <form:select path="phone" items="${phonesMap}">   --%>
<%--         </form:select></ul>   --%>
<!--     </td>   -->
<!--     </tr>   -->
<!--     <tr>   -->
<!--         <td>   -->
<!--             <input type="submit" value="Submit">   -->
<!--         </td>   -->
<!--     </tr>   -->
<!-- </tbody></table>     -->
<%-- </form:form>   --%>


									<a class="btn btn-primary"
										href="<c:url value="/user/selectCategory"/>"> <i
										class="fa fa-pencil"></i> <spring:message code="btn.Edit" />
									</a>Next</a>
									<!-- /table-responsive -->

</div>
</div>
</div>
</div>
</div>

								</div>
							</div>
							<!-- row -->
						</div>
						<!-- /container-fluid -->
					</div>
				</div>
				<!-- /photo-background -->
				<!-- JQuery -->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

				<!-- Latest compiled and minified JavaScript -->
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</body>
</html>