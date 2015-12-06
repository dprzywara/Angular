<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/taglibs.jsp"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
	<head>
<%@include file="includes/scripts.jsp"%>
  </head>
	<body>
		<nav class="navbar navbar-fixed-top navbar-inverse ">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/" title="Games Poral">Games Portal</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="/kurierzy/main/client/drivers">Opcja 1</a></li>
					</ul>
					<form class="navbar-form navbar-right"  action="<c:url value='/j_spring_security_check' />" method='POST'>
						<div class="form-group">
							<input type="text" placeholder="Login" class="form-control" name="j_username">
						</div>
						<div class="form-group">
							<input type="password" placeholder="Password" class="form-control" name="j_password">
						</div>
						<input type="submit" value="Login" class="btn btn-success"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- 						Zaloguj się</input> -->
					</form>
				</div><!--/.navbar-collapse -->
			</div><!-- /.container -->
		</nav>
		
		<div class="quiz-photo-background">
		<div class="container ">
			<div class="row">
<!--       <div class="row row-offcanvas row-offcanvas-right"> -->

        <div class="col-xs-12 col-sm-8 ">
<!--           <p class="pull-right visible-xs"> -->
<!--             <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button> -->
<!--           </p> -->
          <div class="jumbotron ">
            <h1>Hello, world!</h1>
            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
          <a href="/kurierzy/main/client/registration.do"><button type="button" class="btn btn-lg btn-primary">Zarejestruj się!</button></a> 
          
          </div>
<!--           <div class="row"> -->
            <div class="col-xs-6 col-lg-4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            
<!--           </div>/row -->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class=" col-xs-6 col-sm-4 " >
        <div class ="sideblock " >
<!--         <div class=" col-xs-6 col-sm-3 sidebar-offcanvas sideblock " id="sidebar"> -->
<center><p class="sidetitle">Statictics</p> </center>
          <h3>Trending Scores</h3> 

				<table class="table">
						<thead>
							<br>
							<tr>
								<th>Quiz</th>
								<th>Name</th>
								<th>Score</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${topScores}" var="scoreCard">
								<tr class="active">
									<td>${scoreCard.quiz.name}</td>
									<td>${scoreCard.user.firstName}</td>
									<td>${scoreCard.score}</td>
								</tr>
							</c:forEach>
			
						</tbody>
					</table>
			<h3>Categories</h3>
			<div id="chartContainer" style="height: 300px; width: 100%;"></div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
</div>
      <hr>

     		
		<footer>
        <p>&copy; Dariusz Przywara 2015</p>
      </footer>	

    </div><!--/.container-->
    </div><!-- /background -->


		
		<script type="text/javascript">
		window.onload = function() {
			var hashMap = '${categoryDistribution}';
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
						label : newWord
					}
					dataP.push(newEntry);
					newWord = "";
					count = count + 1;
				}
				count = count + 1;
			}	
			var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled : true,
				data : [ {
					type : "pie",
					dataPoints : dataP
				} ]
			});

			chart.render();
			
		}
	</script>
		
	</body>
</html>