<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">

</head>

<body>
<%
if(session.getAttribute("currentuser")==null || session.getAttribute("currentuser")==null){
	response.sendRedirect("authenticationerror.html");
}
String data=(String)session.getAttribute("number");
%>
<form name="regisCust" method="post" action="regisCust.jsp">
<table>
<tr><td>Customer Name:</td><td><input type="text" name="cname"></td></tr>
<tr><td>Customer Address:</td><td><textarea name="caddr"></textarea></td></tr>
<tr><td>Customer Contact No.:</td><td><input type="text" name="cnum" value="<%=data%>" readonly></td></tr>
<tr><td colspan="2"><input type="submit" value="Add"></td></tr>
</table>
</form>
</body>
</html>