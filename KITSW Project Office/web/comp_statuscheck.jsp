<%-- 
    Document   : comp_statuscheck
    Created on : 13 Apr, 2016, 11:30:53 PM
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
        <title>Complaint Status Check</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div id="nav">
    <div id="nav_wrapper">
        <ul>
            <li><a href="users.jsp">About</a>
            </li>
            <li> <a href="#">Complaints</a>

                <ul>
                    <li><a href="complaint_entry.jsp">Lodge a Complaint</a>
                    </li>
                    <li><a href="comp_statuscheck.jsp">My Complaints</a>
                    </li>
                </ul>
            </li>
            <li> <a href="#">Feedbacks</a>

                <ul>
                    <li><a href="feedback_form.jsp">Write a Feedback</a>
                    </li>
                    <li><a href="feedback_view.jsp">View Feedbacks</a>
                    </li>
                </ul>
            </li>
            <li> <a href="change_pwd.jsp">Change Password</a>
            </li>
            <li> <a href="logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
    <!-- Nav wrapper end -->
</div>
        <%
        String user_id=(String)session.getAttribute("userid");    
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from complaints where lodger_id='"+user_id+"'";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 16%">Ticket ID</th>
                    <th style="width: 16%">Date</th>
                    <th style="width: 16%">Complaint</th>
                    <th style="width: 16%">Location</th>
                    <th style="width: 16%">Priority</th>
                    <th style="width: 16%">Current Status</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 16%"><%=rs.getString(1)%></td>
                    <td style="width: 16%"><%=rs.getDate(3)%></td>
                    <td style="width: 16%"><%=rs.getString(4)%></td>
                    <td style="width: 16%"><%=rs.getString(5)%></td>
                    <td style="width: 16%"><%=rs.getString(6)%></td>
                    <td style="width: 16%"><%=rs.getString(7)%></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
