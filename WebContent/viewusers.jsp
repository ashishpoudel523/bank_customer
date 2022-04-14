<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Bank Customers</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<%@page import="com.dao.UserDao,com.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<h1>Bank Customers List</h1>

	<%
	List<User> list = UserDao.getAllRecords();
			request.setAttribute("users", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Number</th>
			<th>Email</th>
			<th>Sex</th>
			<th>Type</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${users}" var="u">
			<tr>
				<td>${u.getId()}</td>
				<td>${u.getName()}</td>
				<td>${u.getNumber()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getSex()}</td>
				<td>${u.getType()}</td>
				<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
				<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<a href="adduserform.jsp">Add New Customer</a>

</body>
</html>