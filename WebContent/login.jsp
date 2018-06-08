<%@page import="com.Supermarket.src.Provider"%>
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

<div class="tab">
<jsp:useBean id="obj" class="com.Supermarket.src.Provider"/>
<jsp:setProperty property="*" name="obj"/>
<%
Provider p=new Provider();
String username=request.getParameter("user");
String password=request.getParameter("password");
String check[]=p.isUserPass(username, password);
if(check[0].equals(username)&&check[1].equals(password)){
	session.setAttribute("user", username);
	session.setAttribute("currentuser", username);
	response.sendRedirect("bill.jsp");
}else{
	response.sendRedirect("authenticationerror.html");
}
%>

</div>
</body>
</html>