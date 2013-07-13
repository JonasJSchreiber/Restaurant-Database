<%-- 
    Document   : event
    Created on : Aug 2, 2012, 6:47:59 PM
    Author     : zzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*"%>
        <%
            Statement stmt = null;
            String username = null;
            if(session.getAttribute("valid") != null)
            {
                if(!((String)session.getAttribute("valid")).equals("true"))
                 {
                //  System.out.println("not valid");
                     response.sendRedirect("notlogin.jsp");
                  }
                else
                {
                   stmt = (Statement)session.getAttribute("dbstmt");
                   username = (String)session.getAttribute("username");
                }
            }
            else
                response.sendRedirect("notlogin.jsp");
        %>
    </head>
    <body>
        <%
           String name = null;
            try{
                String sql = "select * from customer where account='" + username + "'";
                ResultSet rs = stmt.executeQuery(sql);
                if(rs.next())
                    {
                        name = rs.getString("Cname");
   
                    }

            }catch(Exception e){e.printStackTrace();}
        %>
        
        
        <P><font color ="blue"> Welcome back <%=name%> ! </font></p>

        <form method="post" action = "Login.jsp">

        <p> <INPUT type ="submit" name ="submit_logout" value ="logout">
        </form>
    </body>
</html>
