<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<%@ page session="false"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@include file="../includes/scripts.jsp"%>
		<title>User Page</title>
<!-- <title>QuizMe Dashboard</title> -->
<!-- <meta charset="UTF-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <!-- Optional theme --> 
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->

<!-- <!-- Bootstrap core CSS --> 
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- <!-- Custom styles for this template --> 
<!-- <link href="../resources/css/dashboard.css" rel="stylesheet"> -->
<!-- <script type="text/javascript" src="../resources/js/lib/canvasjs.min.js"></script> -->
<%-- <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-theme.min.css"/>'> --%>

 <style>
        #content { padding:5px; background:#ddd; border-radius:5px; overflow-y: scroll;
                   border:1px solid #CCC; margin-top:10px; height: 160px; }
        #input { border-radius:2px; border:1px solid #ccc;
                 margin-top:10px; padding:5px; width:400px;  }
        #status { width:88px; display:block; float:left; margin-top:15px; }
        </style>

</head>

	<body role="document">
		<%@include file="../includes/header2.jsp"%>
		<div class=" client-photo-background">
			<div class="container-fluid">
				<div class="row">
					<%@include file="../includes/side_bar.jsp"%>
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
<!-- 			<div class="col-sm-9col-sm-offset-3 col-md-10 main" -->
<!-- 				style="margin-left: 17%; margin-top: 0%; width: 80%;"> -->





				<div class="span12">
					<h2>List Of Chat Invitations</h2>
				</div>
			
				</br>
				<table id="example" class="table table-striped table-bordered text-center"
					cellspacing="0" width="100%">
					<thead>
						<tr class="info">
							<th>Id</th>
							<th>Invitation From</th>
							<th width="30%"><spring:message code="user.options" /></th>
						</tr>
					</thead>
					<tfoot >
						<tr class="info">
							<th>Id</th>
							<th>Invitation From</th>
							<th width="30%"><spring:message code="user.options" /></th>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${invitations.size()==0}">
							<tr>
								<td>There are no new invitations.</td>
							</tr>
						</c:if>
						<c:forEach items="${invitations}" var="inv">
							<tr>
								<td>${inv.inviting.id}</td>
								<td>${inv.inviting.username}</td>
								<td align="center"><a onclick="sendData(${inv.id})"
									href="${contextPath}/user/chatInvitation/accept/${inv.id}"
									class="btn btn-primary" id="acceptBtn" role="button">Akceptuj</a>&nbsp;&nbsp;<a
									href="${contextPath}/user/invitation/reject/${inv.id}"
									class="btn btn-danger" role="button">Odrzuc</a>&nbsp;&nbsp;
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
// 		$(document).ready(function() {
// 			$('#example').dataTable();
// 		});
		
		

// 		$('#startBtn').on('click', function() {
// 			board.start();
// 			updateStatus();
			
// 		});


	</script>
	


</body>
</html>
