<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<html>
<head>
<title><spring:message code="user.title" /></title>
<%@include file="../includes/scripts.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<c:url var="actionUrl" value="/admin/saveUser" />
				<div class="centerForm">

					<c:choose>
						<c:when test="${edit eq null}">
							<h2><spring:message code="pageTitle.addUser" /></h2>
						</c:when>
						<c:otherwise>
							<h2><spring:message code="pageTitle.editUser" /></h2>
						</c:otherwise>
					</c:choose>
					<br>
<%-- 					<form:form id="userForm" commandName="user" method="post" action="${actionUrl}"> --%>
<form:form method="POST" modelAttribute="user" class="form-horizontal">
		<form:input type="hidden" path="id" id="id"/>
						<div class="form-group">
							<label for="firstName"><spring:message code="user.firstName" /></label>
							<form:input path="firstName" class="form-control" />
							<form:errors path="firstName" class="error" />
						</div>
						
						<div class="form-group">
							<label for="lastName"><spring:message code="user.lastName" /></label>
							<form:input path="lastName" class="form-control" />
							<form:errors path="lastName" class="error" />
						</div>
						
						<div class="form-group">
							<label for="username"><spring:message code="user.username" /></label>
							<form:input path="username" class="form-control" />
							<form:errors path="username" class="error" />
						</div>
<!-- 						<div class="form-group"> -->
<%-- 							<label for="password"><spring:message code="user.password" /></label> --%>
<%-- 							<form:password path="password" maxlength="10" --%>
<%-- 								class="form-control" /> --%>
<%-- 							<form:errors path="password" class="error" /> --%>
<!-- 						</div> -->
						
						<div class="form-group">
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="col-md-3 control-lable" for="password">Password</label> -->
						<label for="password"><spring:message code="user.password" /></label> 
<!-- 							<div class="col-md-7"> -->
								<form:input type="password" path="password" id="password" class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="password" class="help-inline"/>
								</div>
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					
						
<!-- 							<div class="row"> -->
<!-- 			<div class="form-group col-md-12"> -->
<!-- 				<label class="col-md-3 control-lable" for="email">Email</label> -->
<!-- 				<div class="col-md-7"> -->
<div class="form-group">
<label for="email">Email</label> 
					<form:input type="text" path="email" id="email" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="email" class="help-inline"/>
					</div>
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
						
						<div class="form-group">
							<label for="status"><spring:message code="user.status" /></label>

							<form:radiobutton path="enabled" value="1" />
							<spring:message code="user.active" />
							<form:radiobutton path="enabled" value="0" />
							<spring:message code="user.inactive" />
							<form:errors path="enabled" class="error" />
						</div>
						
						
<!-- 						<div class="form-group"> -->
<%-- 							<label for="roles"><spring:message code="roles" /></label> --%>
<%-- 							<form:select path="roles" multiple="true" class="form-control"> --%>
<%-- 								<form:options items="${roleList}" itemValue="id" itemLabel="role" /> --%>
<%-- 							</form:select> --%>
<%-- 							<form:errors path="roles" class="error" /> --%>
<!-- 						</div> -->
						
					
						
							<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="roles">Roles</label>
				<div class="col-md-7">
					<form:select path="roles" items="${roleList}" multiple="true" itemValue="id" itemLabel="role" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="roles" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-actions floatRight">
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/admin/users' />">Cancel</a>
					</c:when>
					<c:otherwise>
						<input type="submit" value="Register" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/admin/users' />">Cancel</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
						
<!-- 						<div class="btn-group " role="group"> -->
<!-- 							<button type="submit" class="btn btn-default">Save</button> -->
<!-- 							<button type="reset" class="btn btn-default">Reset</button> -->
<%-- 							<a href="<c:url value='/admin/users'/>" class="btn btn-default">Cancel</a> --%>
<!-- 						</div> -->
<%-- 						<form:input path="id" type="hidden" /> --%>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>