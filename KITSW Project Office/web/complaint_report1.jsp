<%-- 
    Document   : complaint_report1
    Created on : 13 Apr, 2016, 10:48:52 PM
    Author     : Shashank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Report</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div id="nav">
        <div id="nav_wrapper">
            <ul>
            <li><a href="conusers.jsp">About</a>
            </li>
            <li> <a href="conusers_complaints.jsp">View Complaints</a>
            </li>
            <li> <a href="conusers_reports.jsp">My reports and Orders</a>
            </li>
            <li> <a href="feedback_view.jsp">View Feedbacks</a>
            </li>
            <li> <a href="change_pwd.jsp">Change Password</a>
            </li>
            <li> <a href="logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
</div>
        <%
            String user_id=(String)session.getAttribute("userid");
            String tid=request.getParameter("sno");
            String complaint=request.getParameter("comp_text");
            String report=request.getParameter("comp_report");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="Insert into comp_report (ticket_id,complaint,report,rep_id) values('"+tid+"','"+complaint+"','"+report+"','"+user_id+"')";
            PreparedStatement st=con.prepareStatement(sql);
            st.execute();
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="conusers.jsp">Home</a>
    </body>
</html>
