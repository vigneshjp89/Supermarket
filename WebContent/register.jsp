<%@page import="javax.swing.text.Document"%>
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
<script type="text/javascript">
function check(){
	var pword=document.regis.epass.value;
	var rpword=document.regis.repass.value;
	if((pword==rpword)==true){
		document.getElementById("checkP").innerHTML="Match";
	}else{
		document.getElementById("checkP").innerHTML="Doesn't Match";
	}
}

</script>
<div class="form">
<form name="regis" action="regis.jsp" method="post">
<table>
<tr><td>Name:</td><td colspan="2"><input type="text" name="ename"></td></tr>
<tr><td>Email Id:</td><td><input type="text" name="eaddr"></td><td><label id="isAvailable"></label></td></tr>
<tr><td>Contact:</td><td colspan="2"><input type="number" name="enum"></td></tr>
<tr><td>Password:</td><td colspan="2"><input type="password" name="epass"></td></tr>
<tr><td>Retype Password:</td><td><input type="password" name="repass" onkeyup="check()"></td><td><label id="checkP"></label></td></tr>
<tr><td colspan="3"><center><input type="submit" value="Register"></center></td></tr>
</table>
</form>
</div>
<center><a href="login.html">Back</a></center>
<jsp:useBean id="obj" class="com.Supermarket.src.Provider"/>
<jsp:setProperty property="*" name="obj"/>


</body>
</html>