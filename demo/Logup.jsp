<%-- 
    Document   : Logup
    Created on : Aug 2, 2012, 7:15:40 PM
    Author     : zzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
   <%
        if(request.getParameter("submit_create") != null){
            
            /*Attributes should not be null*/
          

 //           response.sendRedirect("Event.jsp");
        }
        else if(request.getParameter("submit_cancel") != null){
            response.sendRedirect("Login.jsp");
        }
   %>
        <Form method="post" action = "Logup.jsp">
        <p> Username: <input type="text" name ="username" size ="10">
        <p> Password: <input type="password" name ="password" size ="10">
        <p> Name:     <input type="text" name ="name" size ="10">
        <p> Phone:    <input type="text" name ="phone" size ="10">
        <p> Email:    <input type="text" name ="email" size ="10">
        

        <p> <INPUT type ="submit" name ="submit_create" value ="Create">
            <INPUT type ="submit" name ="submit_cancel" value ="Cancel">
        </Form>
    </body>
</html>
