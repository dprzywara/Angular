<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>

<html>
<head>
<title><spring:message code="user.list" /></title>
<%@include file="../includes/scripts.jsp"%>
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
<%-- 						<h2 class="sub-header"><spring:message code="sidebar.users" /></h2> --%>
						
						
						<div class="container">
					<h1><spring:message code="questions.list" /></h1>
					<br>
						<div class="row" data-ng-app="myApp">
						
							
							<div class="pull-left" data-ng-controller="myController">
        						<a class="btn btn-success"  href="<c:url value="${currentUrl}/admin/addQuestion"/>"> <i
								class="fa fa-plus"></i> <spring:message code="btn.addQuestion" /></a> 
								
								
							</div>								
					</div>
					<br>
					<div class="table-responsive row">
						<table id="mytable" class="table table-striped table-bordered table-condensed text-center" aria-describedby="mytable_info">
							<thead>
								<tr class="info">
									<th width="40%"><spring:message code="question.question" /></th>
									<th width="10%"><spring:message code="question.answera" /></th>
									<th width="10%"><spring:message code="question.answerb" /></th>
									<th width="10%"><spring:message code="question.answerc" /></th>
									<th width="10%"><spring:message code="question.answerd" /></th>
									<th width="5%"><spring:message code="question.correct" /></th>
									<th width="5%"><spring:message code="question.category" /></th>
									<th width="10%"><spring:message code="user.options" /></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${questions}" var="question" varStatus="loopCounter">
									<tr>
		
											<td>${question.question}</td>
											<td>${question.answera}</td>
											<td>${question.answerb}</td>
											<td>${question.answerc}</td>
											<td>${question.answerd}</td>
											<td>${question.correct}</td>
											<td>${question.category}</td>
										<td><nobr>
												<a class="btn btn-primary" href="<c:url value="/admin/edit-question-${question.id}"/>"> <i class="fa fa-pencil"></i> <spring:message code="btn.Edit" />
												</a> <a class="btn btn-danger" onclick="return confirm('OK to delete ${question.id} ?');"
													href="deleteQuestion/${question.id}"> <i class="fa fa-times"></i>
													<spring:message code="btn.Delete" />
												</a>
										</nobr></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br>
				</div>
			</div>
			</div>
			</div>
			</div>
			
		</div>
</body>
</html>