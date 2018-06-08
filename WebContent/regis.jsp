<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
<jsp:useBean id="obj" class="com.Supermarket.src.Provider"/>
<jsp:setProperty property="*" name="obj"/>
<%
Provider p=new Provider();

String name=request.getParameter("ename");
String addr=request.getParameter("eaddr");
String cont=request.getParameter("enum");
String pass=request.getParameter("epass");
p.insertEmp(name, addr, cont, pass);

/*try {
    BufferedReader br=new BufferedReader(new FileReader("/WEB-INF/tomcat-users.xml"));
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
    FileWriter write=new FileWriter("/WEB-INF/tomcat-users.xml");
 write.write(s.toString());
 write.flush();
    
}catch(IOException e){
    e.printStackTrace();
}*/
response.sendRedirect("login.html");
response.setHeader("Refresh", "2;url=login.html");
%>
</body>
</html>