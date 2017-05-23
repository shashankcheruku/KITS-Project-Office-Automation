<%-- 
    Document   : conusers_reports
    Created on : 15 Apr, 2016, 7:56:20 AM
    Author     : Shashank
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports and Orders</title>
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
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from comp_report where rep_id='"+user_id+"'";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 25%">Ticket ID</th>
                    <th style="width: 25%">Complaint</th>
                    <th style="width: 25%">Report</th>
                    <th style="width: 25%">Order</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 25%"><%=rs.getString(1)%></td>
                    <td style="width: 25%"><%=rs.getString(2)%></td>
                    <td style="width: 25%"><%=rs.getString(3)%></td>
                    <td style="width: 25%"><%=rs.getString(5)%></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
