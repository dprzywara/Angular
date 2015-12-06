<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<html>
<head>
<title><spring:message code="movieEditPage.title" /></title>
<%@include file="../includes/scripts.jsp"%>
<script type="text/javascript" src='<c:url value="/resources/js/js-movieForm.js"/>'></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="center">
					<br>

					<%@include file="../includes/header.jsp"%>
					<h1><spring:message code="movieEditPage.title" /></h1>

					<a class="btn btn-success" href="<c:url value="/addMovie"/>"> <i
						class="fa fa-plus"></i> <spring:message code="btn.addMovie" />
					</a> <a class="btn btn-primary" href="<c:url value="/rank"/>"> <i
						class="fa fa-list"> </i> <spring:message code="btn.ranking" />
					</a> <br>
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-condensed text-center">
							<thead>
								<tr class="success">
									<th width="30%"><spring:message code="category.id" /></th>
									<th width="70%"><spring:message code="category.name" /></th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${categoryList}" var="category"	varStatus="loopCounter">
									<tr>
										<td><c:out value="${category.id}" /></td>
										<td><c:out value="${category.name}" /></td>
										<td><nobr>
												<a class="btn btn-primary"
													href="<c:url value="/getMovie/${movie.id}"/>"> <i
													class="fa fa-pencil"></i> <spring:message code="btn.categoryEdit" />
												</a> <a class="btn btn-danger" onclick="return confirm('OK to delete ${category.name} ?');"
													href="deleteMovie/${category.id}"> <i class="fa fa-times"></i>
													<spring:message code="btn.movieDelete" />
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
</body>
</html>