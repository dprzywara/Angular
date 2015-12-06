<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="../includes/scripts.jsp"%>
		<title>Admin Page</title>
	
	</head>
		
	</head>
	<body role="document">
		<%@include file="../includes/header2.jsp"%>
		<div class=" admin-photo-background">
			<div class="container-fluid">
				<div class="row">
					<%@include file="../includes/side_bar.jsp"%>
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
						
						<h1><spring:message code="admin.title" /></h1>
					
					<%@include file="../includes/menu.jsp"%>
					<br>
						<br>		
						<div class="table-responsive">					
						<table class="table table-striped table-bordered table-condensed text-center">
							<thead>
								<tr class="success">
									<th width="30% text-center"><spring:message code="category.id" /></th>
									<th width="70%"><spring:message code="category.name" /></th>
									
								</tr>

	
							<tbody>
								<c:forEach items="${categoryList}" var="category"	varStatus="loopCounter">
									<tr>
										<td><c:out value="${category.id}" /></td>
										<td><c:out value="${category.name}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						</div>
					</div>
				</div><!-- row -->
			</div><!-- /container-fluid -->
		</div><!-- /photo-background -->		
		<!-- JQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	</body>
</html>