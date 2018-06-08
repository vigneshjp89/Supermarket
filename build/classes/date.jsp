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
String []data=p.getResultViewDate_Value();
int i;String year,month,day;%>
<table border=2px>
<tr>
<td>Date</td>
<td>Value</td>
</tr>
<%
for(i=0;i<data.length;i=i+2){	
%>
<tr>
<% year=data[i].substring(0,4);
	month=data[i].substring(4,6);
	day=data[i].substring(6,8);
	%>
<td><%=day%>/<%=month%>/<%=year%></td>
<td>Rs.  <%=data[i+1] %></td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>