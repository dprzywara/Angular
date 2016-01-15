<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="includes/scripts.jsp"%>
<title>List Quizzes</title>
<!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->

<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->

<!-- <!-- data_tables --> 
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->


<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.datatables.net/plug-ins/1.10.6/integration/bootstrap/3/dataTables.bootstrap.css"> -->
	
	
	
<!-- <!--custom CSS  --> 
<!-- <link href="../../resources/css/dashboard.css" rel="stylesheet"> -->

</head>
<body role="document">
		<%@include file="includes/header2.jsp"%>
		<div class=" client-photo-background">
			<div class="container-fluid">
				<div class="row">
					<%@include file="includes/side_bar.jsp"%>
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
<!-- 			<div class="col-sm-9col-sm-offset-3 col-md-10 main" -->
<!-- 				style="margin-left: 17%; margin-top: 0%; width: 80%;"> -->

				<div class="span12">
					<h2>List Of Quizzes</h2>
				</div>
			
				</br>
				<table id="example" class="table table-striped table-bordered text-center"
					cellspacing="0" width="100%">
					<thead>
						<tr class="info">
							<th>Quiz Name</th>
							<th>Category</th>
							<th>Difficulty Level</th>
							<th>Popularity</th>
							<th width="30%"><spring:message code="user.options" /></th>
						</tr>
					</thead>
					<tfoot >
						<tr class="info">
							<th>Quiz Name</th>
							<th>Category</th>
							<th>Difficulty Level</th>
							<th>Popularity</th>
							<th width="30%"><spring:message code="user.options" /></th>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${quizList.size()==0}">
							<tr>
								<td>There are no quizzes.</td>
							</tr>
						</c:if>
						<c:forEach items="${quizList}" var="quizzes">
							<tr>
								<td>${quizzes.name}</td>
								<td>${quizzes.category.name}</td>
								<td align="center">${quizzes.level}</td>
								<td align="center">${quizzes.popularity}</td>
								<td align="center"><a
									href="${contextPath}/user/quiz/comment/${quizzes.id}"
									class="btn btn-primary" role="button"><spring:message code="btn.comment" /></a>&nbsp;&nbsp;
<!-- 									<a -->
<%-- 									href="/quizzme/quizzes/recommend/${quizzes.id}" --%>
<!-- 									class="btn btn-info" role="button">Recommend</a> -->
									</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
<!-- </div> -->
</div>
</div>

		</div>
	</div>

	<script
		src="http://cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
	<script
		src="http://cdn.datatables.net/plug-ins/1.10.6/integration/bootstrap/3/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').dataTable();
		});
	</script>
</body>
</html>