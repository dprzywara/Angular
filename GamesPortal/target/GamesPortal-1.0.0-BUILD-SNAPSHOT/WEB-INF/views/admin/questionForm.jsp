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
							<h2><spring:message code="pageTitle.editQuestion" /></h2>
						</c:when>
						<c:otherwise>
							<h2><spring:message code="pageTitle.addQuestion" /></h2>
						</c:otherwise>
					</c:choose>
					<br>
<%-- 					<form:form id="userForm" commandName="user" method="post" action="${actionUrl}"> --%>
<form:form method="POST" modelAttribute="question" class="form-horizontal">
		<form:input type="hidden" path="id" id="id"/>
						<div class="form-group">
							<label for="question"><spring:message code="question.question" /></label>
							<form:textarea path="question" class="form-control" />
							<form:errors path="question" class="error" />
						</div>
						
						<div class="form-group">
							<label for="answera"><spring:message code="question.answera" /></label>
							<form:input path="answera" class="form-control" />
							<form:errors path="answera" class="error" />
						</div>
						<div class="form-group">
							<label for="answerb"><spring:message code="question.answerb" /></label>
							<form:input path="answerb" class="form-control" />
							<form:errors path="answerb" class="error" />
						</div>
						<div class="form-group">
							<label for="answerc"><spring:message code="question.answerc" /></label>
							<form:input path="answerc" class="form-control" />
							<form:errors path="answerc" class="error" />
						</div>
						<div class="form-group">
							<label for="answerd"><spring:message code="question.answerd" /></label>
							<form:input path="answerd" class="form-control" />
							<form:errors path="answerd" class="error" />
						</div>
						
						<div class="form-group">
						<label for="correct"><spring:message code="question.correct" /></label>
						<br>
							<label class="radio-inline">
							<form:radiobutton path="correct" value="a"/>A
		
							</label>
							<label class="radio-inline">
							 <form:radiobutton path="correct" value="b"/> B
							</label>
							<label class="radio-inline">
							<form:radiobutton path="correct"  value="c"/> C
					 </label>
							<label class="radio-inline">
							 <form:radiobutton path="correct"  value="d"/> D
					 </label>
					 </div>
					 
					 <div class="form-group">
						<label for="category"><spring:message code="question.category" /></label>
						<form:select path="category">
	<form:options items="${categoryList}" itemValue="id"/>
</form:select>
<form:errors path="category" cssClass="error" />
</div>

		<div class="row">
			<div class="form-actions floatRight">
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/admin/questions' />">Cancel</a>
					</c:when>
					<c:otherwise>
						<input type="submit" value="Add" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/admin/questions' />">Cancel</a>
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