<%@page import="javax.websocket.SendResult"%>
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
<table>
<%
Provider p=new Provider();
String num=request.getParameter("user");
String ret=p.isCustThere(num);
String []temp=p.getInventory();
if(num.length()==0){
	response.sendRedirect("intermediate.jsp");
}else{
try{
	session.setAttribute("number", num);
	    for(int i=0;i<(temp.length);i=i+4){
		
		String itemno=request.getParameter("no"+temp[i]);
		String item=request.getParameter("prod"+temp[i]);
		String price=request.getParameter("pric"+temp[i]);
		String quantity=request.getParameter("item"+temp[i]);
		String original=request.getParameter("quan"+temp[i]);
		if((Integer.parseInt(quantity)>0)&&(Integer.parseInt(quantity)<=Integer.parseInt(original))){
			p.updateInventory(quantity, item);
			p.insertGood(num, itemno, item, quantity, price);	
		}else{
			response.sendRedirect("inter.jsp");		
		}
		
	}
	    
}catch(Exception e){
	e.printStackTrace();
}
if(ret.equals("not")){
		response.sendRedirect("registerCust.jsp");	
	
}
response.setHeader("Refresh", "2;url=print.jsp");}
%>
<h1>Order Processed! Please wait !!!</h1>
</table>
</body>
</html>