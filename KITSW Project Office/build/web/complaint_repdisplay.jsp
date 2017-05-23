<%-- 
    Document   : complaint_repdisplay
    Created on : 13 Apr, 2016, 11:16:42 PM
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
        <title>Complaint Reports</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function issueOrder(id){
            var f= document.getElementById("issueorder");
            f.method="post";
            f.action="complaint_order.jsp?id="+id;
            f.submit();            
        }
    </script>
    <body>
        <div id="nav">
        <div id="nav_wrapper">
            <ul>
            <li><a href="projectofficer.jsp">About</a>
            </li>
            <li> <a href="budget_allocate.jsp">Budget Allocate</a>
            </li>
            <li> <a href="maintenance_entry.jsp">Maintenance Entry</a>
            </li>
            <li> <a href="#">Reports</a>
                <ul>
                    <li><a href="budget_report.jsp">Budget</a>
                    </li>
                    <li><a href="maintenance_display.jsp">Maintenance</a>
                    </li>
                    <li><a href="purchase_display.jsp">Purchases</a>
                    </li>
                    <li><a href="store_display.jsp">Store</a>
                    </li>
                    <li><a href="stock_display.jsp">Stock Issue</a>
                    </li>
                </ul>
            </li>
            <li> <a href="#">Complaints</a>

                <ul>
                    <li><a href="complaint_display.jsp">Display</a>
                    </li>
                    <li><a href="complaint_repdisplay.jsp">Report and Orders</a>
                    </li>
                </ul>
            </li>
            <li> <a href="create_login.jsp">Create Login</a>
            </li>
            <li> <a href="#">Message Box</a>

                <ul>
                    <li><a href="msg_compose.jsp">Compose</a>
                    </li>
                    <li><a href="msg_view.jsp">Inbox</a>
                    </li>
                    <li><a href="msg_sentview.jsp">Sent Messages</a>
                    </li>
                </ul>
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
        <form id="issueorder" name="issueorder"></form>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from comp_report";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 16%">Ticket ID</th>
                    <th style="width: 16%">Complaint</th>
                    <th style="width: 16%">Report</th>
                    <th style="width: 16%">Reporter ID</th>
                    <th style="width: 16%">Order Status</th>
                    <th style="width: 16%">Give an Order</th>
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
                    <td style="width: 16%"><%=rs.getString(2)%></td>
                    <td style="width: 16%"><%=rs.getString(3)%></td>
                    <td style="width: 16%"><%=rs.getString(4)%></td>
                    <td style="width: 16%"><%=rs.getString(5)%></td>
                    <td style="width: 16%"><input type="submit" onclick="issueOrder(<%=rs.getString(1)%>);" name="issue_order" value="Issue Order"></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
