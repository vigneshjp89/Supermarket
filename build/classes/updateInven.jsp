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
<form method="post" name="updin" action="updateInventory.jsp">
<table>
<tr><th>Product Id.</th><th>Product Name</th><th>Quantity</th><th>Price</th></tr>
<tr><td><input type="number" name="pid"></td>
<td><input type="text" name="pname"></td>
<td><input type="number" name="pquant"></td>
<td><input type="number" name="pprice"></td>
</tr>
<tr><td colspan="2"><center><input type="submit" value="Add"></center></td><td colspan="2"><center><input type="reset" value="reset"></center></td></tr>
</table>
<center><ul><li><a href="SelectView.jsp">Back</a></li></ul></center>
</form>
</body>
</html>