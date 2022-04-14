<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@page import="com.dao.UserDao,com.bean.User"%>

<%
String id=request.getParameter("id");
User u=UserDao.getRecordById(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="edituser.jsp" method="post">
	<input type="hidden" name="id" value="<%=u.getId() %>"/>
	<table class="table table-striped table-dark">
		<tr><td>Name:</td><td><input type="text" name="name" value="<%= u.getName()%>"/></td></tr>
		<tr><td>Number:</td><td><input type="password" name="number" value="<%= u.getNumber()%>"/></td></tr>
		<tr><td>Email:</td><td><input type="email" name="email" value="<%= u.getEmail()%>"/></td></tr>
		<tr><td>Type:</td><td>
		<select name="type">
		<option>Saving</option>
		<option>Other</option>
		</select>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="Edit Customer"/></td></tr>
	</table>
</form>

</body>
</html>