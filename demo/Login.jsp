<%-- 
    Document   : Login
    Created on : Aug 2, 2012, 6:03:40 PM
    Author     : zzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%@ page import="java.sql.*" %>
    <%
         String username = null;
         String password = null;
	 String type=null;


	 
	 
	 if(request.getParameter("submit_login") != null)
	{
		username = request.getParameter("username");
		password = request.getParameter("password");
		// type = request.getParameter("type");

		String url = "jdbc:mysql://localhost:3306";
		String userName="root";
	        String Pwd="root123";
                String dbdriver = "com.mysql.jdbc.Driver";
                Connection con;
		String sql="";
                Statement stmt = null;
                 try{
                      Class.forName(dbdriver).newInstance();
                      con = DriverManager.getConnection(url, userName, Pwd);


                       stmt = con.createStatement();
                       stmt.executeUpdate("use mutant");

		       System.out.println("Set up Connection");
		      	
                       sql = "select pwd from customer where account='" + username +"'";

                       System.out.println(sql);
                       ResultSet rs = stmt.executeQuery(sql);
                       
                       if(rs.next())
                       {
                           System.out.println("in rs");
                          if(rs.getString("pwd").equals(password))
                           {
                                session.setAttribute("valid", "true");
                                session.setAttribute("username",username);
                                session.setAttribute("password",password);
                                session.setAttribute("dbstmt", stmt);
			
                                response.sendRedirect("Event.jsp");
                           }
                           else{        //incorrect password
                                response.sendRedirect("notlogin.jsp");
                           }
                       }
                       else
                       {
                                //no such user
                           response.sendRedirect("notlogin.jsp");
                       }

                      }catch(Exception e){
                          e.printStackTrace();
                      response.sendRedirect("err.html");
                      }

                    

	}
       if(request.getParameter("submit_logup") != null){
            response.sendRedirect("Logup.jsp");
       }
       if(request.getParameter("submit_logout") != null)
       {
           session.invalidate();
       }

%>
    <Form method="post" action = "Login.jsp">
        <p> Username: <input type="text" name ="username" size ="10">
         Password: <input type="password" name ="password" size ="10">
        <p> <INPUT type ="submit" name ="submit_login" value ="Sign In">
            <INPUT type ="submit" name ="submit_logup" value ="Sign Up">
    </Form>

    </body>
</html>

