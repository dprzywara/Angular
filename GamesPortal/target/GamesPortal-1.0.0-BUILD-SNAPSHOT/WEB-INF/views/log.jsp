<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login | Beingjavaguys.com</title>
</head>
<body>





		<div style="border: 1px solid black; width: 300px; padding-top: 10px;">

			Please enter your username and password to login ! <span
				style="color: red">${message}</span>

			<form:form method="post" action="j_spring_security_check"
				modelAttribute="user">
				<table>
					<tr>
						<td>Username:</td>
						<td><form:input path="username" /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><form:input path="password" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" /></td>
					</tr>
				</table>
			</form:form>
		</div>

</body>
</html>
