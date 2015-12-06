<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		
	<%@include file="../includes/scripts.jsp"%>
		<title>User Page</title>
		
		
		<link href="resources/css/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/canvasjs.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var hashMap = '${categoryWiseDistribution}';
		var count = 1;
		var newWord = "";
		var dataP = [];
		while (hashMap[count] != '}') {

			if (hashMap[count] == ",") {
				count = count + 1;
				continue;
			}
			if (hashMap[count] != "=") {
				newWord = newWord + hashMap[count];

			} else {
				var categoryCount = hashMap[count + 1];
				var newEntry = {
					y : categoryCount,
					indexLabel : newWord
				}
				dataP.push(newEntry);
				newWord = "";
				count = count + 1;
			}
			count = count + 1;
		}
		var chart = new CanvasJS.Chart("chartContainer", {
			data : [ {
				type : "doughnut",
				dataPoints : dataP
			} ]
		});

		chart.render();
	}
</script>
	
	</head>
		
	</head>
	<body role="document">
		<%@include file="../includes/header2.jsp"%>
		<div class=" client-photo-background">
			<div class="container-fluid">
				<div class="row">
					<%@include file="../includes/side_bar.jsp"%>
					<div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2">
						<div class="jumbotron">
						
<%-- 						<h1><spring:message code="admin.title" /></h1> --%>
					
					<%@include file="../includes/menu.jsp"%>
					<br>
						<br>		
						
						<p>pozycja w rankingu </p>
						
						<p>ostatnie gry </p>
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