<%-- 
    Document   : login
    Created on : 7 Feb, 2016, 1:29:01 PM
    Author     : Shashank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
        <link href="login_style.css" type="text/css" rel="stylesheet" />
    </head>
    <center>
        <%
            session =request.getSession(false);
            if(session.getAttribute("userid")!=null){
                session.invalidate();
            }
            
        String userid=request.getParameter("uid");
        String pwd=request.getParameter("pwd");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from login where userid='"+userid+"'";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        if(rs.next())
        {
        if(rs.getString(1).equals(userid) && rs.getString(2).equals(pwd)){
            if(rs.getString(3).equals("Project Officer")){
                session=request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("projectofficer.jsp");
            }
            else if(rs.getString(3).equals("Purchase Officer")){
                session=request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("purchaseofficer.jsp");
            }
            else if(rs.getString(3).equals("Store Officer")){
                session=request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("storeofficer.jsp");
            }
            else if(rs.getString(3).equals("End User")){
                session=request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("users.jsp");
            }
            else if(rs.getString(3).equals("Shop")){
                session=request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("shops.jsp");
            }
            else{
                session=request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("conusers.jsp");
            }
        }
        else{
        %>
        <h1>Invalid Credentials</h1>
        <h2><a href="login.jsp">Click Here to login again</a></h2>
        <%
        }
        }
        else{
        %>
        <h1>Username does not exist</h1>
        <h2><a href="login.jsp">Click Here to login again</a></h2>
        <%
        }
        %>
    </center>
    
</html>
