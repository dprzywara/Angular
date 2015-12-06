<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:url value="" var="currentUrl"></c:url>


<!DOCTYPE html>
<html>
<head>

		<%@include file="../includes/scripts.jsp"%>
		<title>Users</title>
	
</head>

<body role="document">
		<%@include file="../includes/header2.jsp"%>
<!-- <tiles:insertAttribute name="msg"/> -->


	<div class="admin-photo-background">

	
	
		<div class="container-fluid">
			<div class="row">
				<%@include file="../includes/side_bar.jsp"%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
					<div class="jumbotron">
						<h2 class="sub-header"><spring:message code="sidebar.users" /></h2>
						
						
						<div class="container">
						<a class="btn btn-success" href="<c:url value="${currentUrl}/admin/addUser"/>"> <i
						class="fa fa-plus"></i> <spring:message code="btn.addUser" />
					</a> <a class="btn btn-primary" href="<c:url value="/UserRank"/>"> <i
						class="fa fa-list"> </i> <spring:message code="btn.ranking" />
					</a> <br>
						<br>
						
							<table id="mytable" class="table table-bordered table-striped text-center" aria-describedby="mytable_info">
								<thead>
									<tr class="info">
										<th><spring:message code="user.id" /></th>
										<th><spring:message code="user.firstName" /></th>
										<th><spring:message code="user.lastName" /></th>
										<th><spring:message code="user.username" /></th>
										<th><spring:message code="user.email" /></th>
										<th><spring:message code="user.status" /></th>
										<th><spring:message code="user.options" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${users}" var="user">
										<tr>
											<td>${user.id}</td>
											<td>${user.firstName}</td>
											<td>${user.lastName}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
											<td>
												<c:if test="${user.enabled}"><spring:message code="answer.yes" /></c:if>
												<c:if test="${!user.enabled}"><spring:message code="answer.no" /></c:if>
											</td>
											<td><nobr>
												<a class="btn btn-primary" href="<c:url value="/admin/edit-user-${user.id}"/>"> <i class="fa fa-pencil"></i> <spring:message code="btn.Edit" />
												</a> <a class="btn btn-danger" onclick="return confirm('OK to delete ${user.username} ?');"
													href="deleteUser/${user.id}"> <i class="fa fa-times"></i>
													<spring:message code="btn.Delete" />
												</a>
										</nobr></td>
											
<!-- 											<td> -->
<%-- 											<sec:authorize access="hasRole('ROLE_ADMIN')"> <!-- Tylko dla admina -->			     --%>
<%-- 												<form method="get" action="${contextPath}/editaccount"> --%>
<%-- 													<input type="hidden" value="${user.username}" name="username"> --%>
<!-- 													<input type="submit" class="btn btn-link" value="Edytuj" /> -->
<!-- 												</form> -->
<%-- 												<form method="get" action="${contextPath}/editpassword"> --%>
<%-- 													<input type="hidden" value="${user.username}" name="username"> --%>
<!-- 													<input type="submit" class="btn btn-link" value="Zmień hasło" /> -->
<!-- 												</form> -->
<%-- 												<c:if test="${!user.username.equals(pageContext.request.userPrincipal.name)}"> --%>
<%-- 												<form method="post" action="${contextPath}/deleteuser" onsubmit="return confirm('Jesteś pewien że chcesz usunąć tego użytkownika?')"> --%>
<%-- 													<input type="hidden" value="${user.username}" name="user"> --%>
<%-- 													<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> --%>
<!-- 													<input type="submit" class="btn btn-link" value="Usuń" /> -->
<!-- 												</form> -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${!user.enabled}"> --%>
<%-- 													<form method="post" action="${contextPath}/activateuser" onsubmit="return confirm('Jesteś pewien że chcesz aktywować to konto?')"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="user"> --%>
<%-- 														<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Aktywuj konto" /> -->
<!-- 													</form> -->
<%-- 												</c:if> --%>
<%-- 											</sec:authorize> --%>
<%-- 												<c:forEach items="${user.getUserRole()}" var="role"> --%>
<%-- 													<c:if test="${role.getRole().equals(rolePatient)}"> --%>
<%-- 													<form method="get" action="${contextPath}/patientvisits"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="patientUsername"> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Wizyty pacjenta" /> -->
<!-- 													</form> -->
<%-- 													<form method="get" action="${contextPath}/patientreferrals"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="patientUsername"> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Skierowania" /> -->
<!-- 													</form> -->
<%-- 													<form method="get" action="${contextPath}/historicalvisits"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="patientUsername"> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Historia wizyt" /> -->
<!-- 													</form> -->
<%-- 													</c:if> --%>
<%-- 											<sec:authorize access="hasRole('ROLE_ADMIN')"> <!-- Tylko dla admina -->			    		 --%>
<%-- 													<c:if test="${role.getRole().equals(roleDoctor)}"> --%>
<%-- 													<form method="get" action="${contextPath}/docvisits"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="doctorUsername"> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Wizyty doktora" /> -->
<!-- 													</form> -->
<%-- 													<form method="get" action="${contextPath}/dochistoricalvisits"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="doctorUsername"> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Historia wizyt doktora" /> -->
<!-- 													</form> -->
<%-- 													<form method="get" action="${contextPath}/docleave"> --%>
<%-- 														<input type="hidden" value="${user.username}" name="doctorUsername"> --%>
<!-- 														<input type="submit" class="btn btn-link" value="Wypisz urlop" /> -->
<!-- 													</form> -->
<%-- 													</c:if> --%>
<%-- 											</sec:authorize> --%>
<%-- 												</c:forEach> --%>
<!-- 											</td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<a href="${contextPath}/aregistration">Dodaj użytkownika</a>
						<!-- /table-responsive -->



					</div>
				</div>
				<!-- row -->
			</div>
			<!-- /container-fluid -->
		</div>
		</div>
		<!-- /photo-background -->
	
</body>
</html>