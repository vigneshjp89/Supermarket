<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%StringBuilder s=new StringBuilder();
String ls=System.getProperty("line.separator");
String input,line;
String addr,pass;
addr=request.getParameter("auser");
pass=request.getParameter("apass");
input="<user password=\""+pass+"\" roles=\"employee\" username=\""+addr+"\"/>";
try {
    BufferedReader br=new BufferedReader(new FileReader("E:\\workspace\\Servers\\Tomcat v8.5 Server at localhost-config\\tomcat-users.xml"));
    while((line=br.readLine())!=null){
        s.append(line);
        s.append(ls);
    }
    s.delete(s.indexOf("</tomcat-users>"),s.length());
            s.append(input);
s.append("\n</tomcat-users>");
    System.out.println(s.toString());   
    br.close();
} catch (IOException e) {
    e.printStackTrace();
}
try{
    FileWriter write=new FileWriter("E:\\workspace\\Servers\\Tomcat v8.5 Server at localhost-config\\tomcat-users.xml");
 write.write(s.toString());
 write.flush();
    
}catch(IOException e){
    e.printStackTrace();
}
response.sendRedirect("home.html");
%>
</body>
</html>