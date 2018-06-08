<%@page import="com.Supermarket.src.Provider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
function process(id,quantity,price,want){
	var is=Number(quantity);
	var as=Number(want);
	var amt=Number(price);
	if(is<as){ 
	document.getElementById("label"+id).innerHTML="Out of Stock";
	document.getElementById("label"+id).style.color="#FF3235";
	document.billform.flag.innerHTML="notallowed";
	}
	else{
		document.getElementById("label"+id).innerHTML="Available";
		amt=amt*as;
		document.getElementById("price"+id).innerHTML=("Rs."+amt.toString());
	}
	}	
</script>
<link rel="stylesheet" href="style.css">
 <link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
</head>
<body>
<%
if(session.getAttribute("currentuser")==null || session.getAttribute("currentuser")==""){
	response.sendRedirect("authenticationerror.html");
}else{
%>
<form method="post" name="billform" action="processbill.jsp">
<center><ul style="display: inline-block;"><li><h4>Enter Cust Mobile No.: </h4></li>
<li><input type="text" name="user"></li>
<li><a href="logout.jsp"  style="float: right;">Logout</a></li></ul></center>
<%
Provider p=new Provider();
%>

<table border="1px">
<tr><th>Item no.</th><th>Item</th><th>Quantity Available</th><th>Cost per unit</th><th colspan="2">Enter Quantity</th><th>Cost</th></tr>
<%
String[] inventory=p.getInventory();
int i,n=inventory.length;
for(i=0;i<n;i=i+4){
%>
<tr>
<td><input type="text" name="no<%= inventory[i]%>" value="<%= inventory[i]%>" readonly></td>
<td><input type="text" name="prod<%= inventory[i]%>" value="<%= inventory[i+1]%>" readonly></td>
<td><input type="text" name="quan<%= inventory[i]%>" value="<%= inventory[i+2]%>" readonly></td>
<td><input type="text" name="pric<%= inventory[i]%>" value="<%= inventory[i+3]%>" readonly></td>
<td><input type="number" name="item<%= inventory[i]%>" onkeyup="process(<%=inventory[i]%>,<%=inventory[i+2]%>,<%=inventory[i+3]%>,this.value)"></td>
<td><label id="label<%=inventory[i]%>">check</label></td>
<td><label id="price<%=inventory[i]%>">Rs.</label></td></tr>
<%}} %>
<tr><td colspan="3"><input type="submit" name="buy" value="buy""></td>
<td colspan="2"><input type="reset" value="reset"></td></tr>
</table>
</form>
<div class="footer">

</div>
</body>
</html>