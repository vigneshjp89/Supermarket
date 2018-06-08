<%@page import="java.util.Arrays"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@page import="com.Supermarket.src.Provider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Provider p=new Provider();
String id=request.getParameter("pid");
String name=request.getParameter("pname");
String quant=request.getParameter("pquant");
String price=request.getParameter("pprice");
String temp[]=p.getInventory();
if(Arrays.asList(temp).contains(id)){
	p.updateAdminInventory(price, quant,id);
}else{
	p.insertInvetory(id,name,quant,price);
}
response.sendRedirect("updateInven.jsp");
%>
</body>
</html>