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
	
				</br>
<div  id="login">${username}</div>				

 <div id="content"></div>
        <div>
            <span id="status">Connecting...</span>
            <input type="text" id="input" disabled="disabled" />
        </div>
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

<script src="<c:url value="/resources/js/angular/frontend.js" />"></script>
</body>
</html>
