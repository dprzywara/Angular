<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Users</title>
 
    <style>
        tr:first-child{
            font-weight: bold;
            background-color: #C6C9C4;
        }
    </style>
 
</head>
 
 
<body>
    <h2>List of Users</h2>  
    <table>
        <tr>
            <td>id</td><td>UserName </td> <td>First Name  </td><td>Last Name</td><td>Login</td><td>enable</td><td>role</td><td></td>
        </tr>
        
        <c:forEach items="${users}" var="user">
            <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.enabled}</td>
<%--            <td>${roles}</td> --%>
<%--             <td>${user.firstName}</td> --%>
<%--             <td>${user.lastName}</td> --%>
<%--             <td>${user.joiningDate}</td> --%>
            <td><a href="<c:url value='/edit-${user.username}-user' />">edit</a></td>
            <td><a href="<c:url value='/delete-${user.username}-user' />">delete</a></td>
            
<!--                 <td colspan="3"> -->
<%--                     <c:choose> --%>
<%--                         <c:when test="${edit}"> --%>
<!--                             <input type="submit" value="Update"/> -->
<%--                         </c:when> --%>
<%--                         <c:otherwise> --%>
<!--                             <input type="submit" value="Register"/> -->
<%--                         </c:otherwise> --%>
<%--                     </c:choose> --%>
<!--                 </td> -->
            </tr>
        </c:forEach>
    </table>
    <br/>
    <a href="<c:url value='/new' />">Add New User</a>
</body>
</html>