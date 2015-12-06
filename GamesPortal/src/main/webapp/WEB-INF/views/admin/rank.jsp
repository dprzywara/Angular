<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code="index.title" /></title>
<%@include file="../includes/scripts.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="center">
					<br>
					<%@include file="../includes/header.jsp"%>

					<h1><spring:message code="index.title" /></h1>
					
					<%@include file="../includes/menu.jsp"%>
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
<%-- 										<td><strong><c:out value="${loopCounter.count}" /></strong></td> --%>
<%-- 										<td><font color="red"><c:out value="${movie.votes}" /></font></td> --%>
										<td><c:out value="${category.id}" /></td>
										<td><c:out value="${category.name}" /></td>
<%-- 										<c:if test="${username != null}"> --%>
<%-- 											<td><form:form id="vote" action="vote" method="post"> --%>
<%-- 													<button name="movieId" value="${category.id}" --%>
<!-- 														class="btn btn-primary" -->
<%-- 														<c:out value="${hasVoted == true ? 'disabled' : ''}"/> --%>
<!-- 														onclick="voteMovie();"> -->
<!-- 														<i class="fa fa-thumbs-up"></i> -->
<!-- 													</button> -->
<%-- 											</form:form></td> --%>
<%-- 										</c:if> --%>
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