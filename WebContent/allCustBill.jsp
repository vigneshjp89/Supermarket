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

<%
Provider p=new Provider();
String []bill;
int total=0;
%>
<table class="form">
<tr><th>Customer</th><th>Item No.</th><th>Product</th><th>Quantity</th><th>Price</th></tr>
<%

bill=p.getAllBill();
for(int i=0;i<(bill.length);i=i+5){
	total+=Integer.parseInt(bill[i+4]);
	if(i>0 && bill[i-5].equals(bill[i])){
   %>
   <tr><td></td><td><%=bill[i+1]%></td><td><%=bill[i+2]%></td><td><%=bill[i+3]%></td><td><%=bill[i+4]%></td></tr>
<%
	}else{
	%>
	<tr><td><%=bill[i]%></td><td><%=bill[i+1]%></td><td><%=bill[i+2]%></td><td><%=bill[i+3]%></td><td><%=bill[i+4]%></td></tr>
	<%
}
}
%>
<tr><td colspan="3"></td><td>Total: <%=total%></td></tr>
</table>

<center><a href="SelectView.jsp">Admin Center</a></center>
</body>
</html>