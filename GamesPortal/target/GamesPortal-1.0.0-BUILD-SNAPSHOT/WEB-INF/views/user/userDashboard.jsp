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
<!-- <!-- Optional theme --> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->

<!-- <!-- Bootstrap core CSS --> -->
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- <!-- Custom styles for this template --> -->
<!-- <link href="../resources/css/dashboard.css" rel="stylesheet"> -->
<!-- <script type="text/javascript" src="../resources/js/lib/canvasjs.min.js"></script> -->
<%-- <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-theme.min.css"/>'> --%>
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

	<body role="document">
		<%@include file="../includes/header2.jsp"%>
	<div class=" client-photo-background">

	<div class="container-fluid">
		<div class="row">
			<%@include file="../includes/side_bar.jsp"%>


			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<!-- 				<h4 class="page-header"> -->
<%-- 					Welcome <small>${userName}</small> --%>
<!-- 				</h4> -->

				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">Total quizzes attempted by
							category</div>
						<div class="panel-body">
							<div id="chartContainer" style="height: 282px; width: 100%;"></div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">Recently attempted quizzes</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Quiz Name</th>
											<th>Level</th>
											<th>Category</th>
											<th>Your Score</th>
											<th>Highest Score</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${attemptedQuizzes.size()==0}">
											<tr>
												<td>Go ahead and attempt some quizzes.</td>
											</tr>
										</c:if>
										<c:forEach items="${attemptedQuizzes}" var="attempted">
											<tr>
												<td>${attempted.quiz.name}</td>
												<td>${attempted.quiz.level}</td>
												<td>${attempted.quiz.category.name}</td>
												<td>${attempted.score}</td>
												<td>${attempted.highestScore}</td>
											</tr>
										</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>

				<h4 class="sub-header">Most Popular Quizzes</h4>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Quiz Name</th>
								<th>Popularity</th>
								<th>Level</th>
								<th>Category</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${popularQuizList}" var="popQuiz">
								<tr>
									<td>${popQuiz.name}</td>
									<td>${popQuiz.popularity}</td>
									<td>${popQuiz.level}</td>
									<td>${popQuiz.category.name}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 	<script src="../resources/js/lib/bootstrap.min.js"></script> -->
<!-- 	<script src="../resources/js/holder.js"></script> -->
<!-- 	<script src="../resources/js/lib/ie10-viewport-bug-workaround.js"></script> -->


</body>
</html>
