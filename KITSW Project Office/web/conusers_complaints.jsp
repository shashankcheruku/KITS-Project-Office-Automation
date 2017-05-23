<%-- 
    Document   : conusers_complaints
    Created on : 13 Apr, 2016, 9:56:23 PM
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
        <title>Complaints</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function reportStatus(id){
            var f= document.getElementById("report");
            f.method="post";
            f.action="complaint_report.jsp?id="+id;
            f.submit();            
        }
    </script>
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
        <form id="report" name="comp_report"></form>
        <%
            String user_id=(String)session.getAttribute("userid");
            String off_type="";
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select officer_type from login where userid='"+user_id+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                off_type=rs.getString(1);
            }
            
            String sql1="select * from complaints where comp_for='"+off_type+"'";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1=st1.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 12%">Ticket ID</th>
                    <th style="width: 12%">Lodger ID</th>
                    <th style="width: 12%">Date</th>
                    <th style="width: 12%">Complaint</th>
                    <th style="width: 12%">Location</th>
                    <th style="width: 12%">Priority</th>
                    <th style="width: 12%">Current Status</th>
                    <th style="width: 12%">Report</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs1.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 12%"><%=rs1.getString(1)%></td>
                    <td style="width: 12%"><%=rs1.getString(2)%></td>
                    <td style="width: 12%"><%=rs1.getDate(3)%></td>
                    <td style="width: 12%"><%=rs1.getString(4)%></td>
                    <td style="width: 12%"><%=rs1.getString(5)%></td>
                    <td style="width: 12%"><%=rs1.getString(6)%></td>
                    <td style="width: 12%"><%=rs1.getString(7)%></td>
                    <td style="width: 12%"><input type="submit" onclick="reportStatus(<%=rs1.getString("sno")%>);" name="comp_report" value="Report"></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
