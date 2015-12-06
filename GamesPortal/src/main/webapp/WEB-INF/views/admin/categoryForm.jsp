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
						<c:when test="${edit}">
							<h2><spring:message code="pageTitle.editCategory" /></h2>
						</c:when>
						<c:otherwise>
							<h2><spring:message code="pageTitle.addCategory" /></h2>
						</c:otherwise>
					</c:choose>
					<br>
					<form:form method="POST" modelAttribute="category" class="form-horizontal">
					<form:input type="hidden" path="id" id="id"/>
						<div class="form-group">
							<label for="name"><spring:message code="category.name" /></label>
							<form:input path="name" class="form-control" />
							<form:errors path="name" class="error" />
						</div>

					<div class="row">
						<div class="form-actions floatRight">
							<c:choose>
								<c:when test="${edit}">
										<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/admin/categories' />">Cancel</a>
								</c:when>
								<c:otherwise>
									<input type="submit" value="Add" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/admin/categories' />">Cancel</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
						
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>