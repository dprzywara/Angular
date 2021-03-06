<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/taglibs.jsp"%>
<html>
<head>
<title><spring:message code="user.title" /></title>
<%@include file="../includes/scripts.jsp"%>
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
					<a class="navbar-brand" href="/GamesPortal/" title="Games Poral">Games Portal</a>
				</div>
				
			</div><!-- /.container -->
		</nav>
		<div class="quiz-photo-background">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			 <div class="jumbotron ">
				<c:url var="actionUrl" value="/admin/saveUser" />
				<div class="centerForm">

					<c:choose>
						<c:when test="${edit eq false}">
							<h2>Registration</h2>
						</c:when>
						<c:otherwise>
							<h2>Edit your data</h2>
						</c:otherwise>
					</c:choose>
					<br>
<%-- 					<form:form id="userForm" commandName="user" method="post" action="${actionUrl}"> --%>
<form:form method="POST" modelAttribute="user" class="form-horizontal" id="myform" name="myform" onsubmit="return validateForm()">
		<form:input type="hidden" path="id" id="id"/>
<!-- 						<div class="form-group"> -->
<%-- 							<label for="firstName"><spring:message code="user.firstName" /></label> --%>
<%-- 							<form:input path="firstName" class="form-control" /> --%>
<%-- 							<form:errors path="firstName" class="error" /> --%>
<!-- 						</div> -->
						
<!-- 						<div class="form-group"> -->
<%-- 							<label for="lastName"><spring:message code="user.lastName" /></label> --%>
<%-- 							<form:input path="lastName" class="form-control" /> --%>
<%-- 							<form:errors path="lastName" class="error" /> --%>
<!-- 						</div> -->

<div class="form-group has-feedback">
<label for="email">Email</label> 
					<form:input type="text" path="email" id="email" class="form-control input-sm" placeholder="Email" required="true"/>
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					<div class="has-error">
					
						<form:errors path="email" class="help-inline"/>
					</div>
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
						
						<div class="form-group has-feedback">
							<label for="username"><spring:message code="user.username" /></label>
							<form:input path="username" id="username" class="form-control" placeholder="username" required="true" />
							 <span class="glyphicon glyphicon-user form-control-feedback"></span>
							<form:errors path="username" class="error" />
						</div>
<!-- 						<div class="form-group"> -->
<%-- 							<label for="password"><spring:message code="user.password" /></label> --%>
<%-- 							<form:password path="password" maxlength="10" --%>
<%-- 								class="form-control" /> --%>
<%-- 							<form:errors path="password" class="error" /> --%>
<!-- 						</div> -->
						
						<div class="form-group has-feedback">
<!-- 						<div class="form-group col-md-12"> -->
<!-- 							<label class="col-md-3 control-lable" for="password">Password</label> -->
						<label for="password"><spring:message code="user.password" /></label> 
<!-- 							<div class="col-md-7"> -->
								<form:input type="password" path="password" id="password" class="form-control input-sm" placeholder="Hasło" required="true" onkeyup="checkPass(); return false;" />
								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								<div class="has-error">
									<form:errors path="password" class="help-inline"/>
								</div>
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					
					<div class="form-group has-feedback">
					<label for="confirmPassword">Confirm Password</label> 
					<input id="confirmPassword" name="confirmPassword" type="password" class="form-control" placeholder="Potwierdź hasło" required="true" onkeyup="checkPass(); return false;"/>
					<span id="confirmMessage" class="glyphicon glyphicon-lock form-control-feedback" class="confirmMessage"></span>
					
					</div>
					
						
<!-- 							<div class="row"> -->
<!-- 			<div class="form-group col-md-12"> -->
<!-- 				<label class="col-md-3 control-lable" for="email">Email</label> -->
<!-- 				<div class="col-md-7"> -->

						
<!-- 						<div class="form-group"> -->
<%-- 							<label for="status"><spring:message code="user.status" /></label> --%>

<%-- 							<form:radiobutton path="enabled" value="1" /> --%>
<%-- 							<spring:message code="user.active" /> --%>
<%-- 							<form:radiobutton path="enabled" value="0" /> --%>
<%-- 							<spring:message code="user.inactive" /> --%>
<%-- 							<form:errors path="enabled" class="error" /> --%>
<!-- 						</div> -->
						
						
<!-- 						<div class="form-group"> -->
<%-- 							<label for="roles"><spring:message code="roles" /></label> --%>
<%-- 							<form:select path="roles" multiple="true" class="form-control"> --%>
<%-- 								<form:options items="${roleList}" itemValue="id" itemLabel="role" /> --%>
<%-- 							</form:select> --%>
<%-- 							<form:errors path="roles" class="error" /> --%>
<!-- 						</div> -->
						
					
						
<!-- 							<div class="row"> -->
<!-- 			<div class="form-group col-md-12"> -->
<!-- 				<label class="col-md-3 control-lable" for="roles">Roles</label> -->
<!-- 				<div class="col-md-7"> -->
<%-- 					<form:select path="roles" items="${roleList}" multiple="true" itemValue="id" itemLabel="role" class="form-control input-sm" /> --%>
<!-- 					<div class="has-error"> -->
<%-- 						<form:errors path="roles" class="help-inline"/> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div class="row">
			<div class="form-actions floatRight">
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" value="Update" class="btn btn-primary "/> or <a class="btn btn-warning" href="<c:url value='/' />">Cancel</a>
					</c:when>
					<c:otherwise>
						<input type="submit" value="Register" class="btn btn-primary "/> or <a class="btn btn-warning" href="<c:url value='/' />">Cancel</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
						
<!-- 						<div class="btn-group " role="group"> -->
<!-- 							<button type="submit" class="btn btn-default">Save</button> -->
<!-- 							<button type="reset" class="btn btn-default">Reset</button> -->
<%-- 							<a href="<c:url value='/admin/users'/>" class="btn btn-default">Cancel</a> --%>
<!-- 						</div> -->
<%-- 						<form:input path="id" type="hidden" /> --%>
					</form:form>
				</div>
			</div>
		</div>
		</div>
		</div>
	</div>
	
	 <script type="text/javascript">
     
	  
	 function validateForm(){	
		    var pass1 = document.getElementById('password');
		    var pass2 = document.getElementById('confirmPassword');
		    var message = document.getElementById('confirmMessage');
		    var pass1Length = pass1.value.length;
			var pass2Length = pass2.value.length;
			if(pass1.value != pass2.value){
				var badColor = "#ff6666";
				pass2.style.backgroundColor = badColor;
		        message.style.color = badColor;
		        alert("Hasła nie są takie same!");
		        return false;
			}
			else if(pass1Length < 3){
				var badColor = "#ff6666";
				message.style.color = badColor;
				alert("Hasło musi mieć przynajmniej 3 znaki.");
		        return false;
			}
		}
		
		function checkPass(){
		    var pass1 = document.getElementById('password');
		    var pass2 = document.getElementById('confirmPassword');
		    var message = document.getElementById('confirmMessage');
		    var goodColor = "#ffffff";
		    if(pass1.value == pass2.value && pass1.value.length >= 3){
		        pass2.style.backgroundColor = goodColor;
		        message.style.color = goodColor;
		        message.innerHTML = ""
		    }
		}
      
	 
      </script>
</body>
</html>