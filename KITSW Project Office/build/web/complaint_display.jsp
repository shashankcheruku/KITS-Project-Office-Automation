<%-- 
    Document   : complaint_display
    Created on : 19 Feb, 2016, 6:36:03 PM
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
        <title>View Complaints</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function editStatus(id){
            var f= document.getElementById("status");
            f.method="post";
            f.action="complaint_status.jsp?id="+id;
            f.submit();            
        }
        
        function compForward(id){
            var f= document.getElementById("forward");
            f.method="post";
            f.action="complaint_forward.jsp?id="+id;
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
        <form id="status" name="comp_status"></form>
        <form id="forward" name="comp_forward"></form>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from complaints order by comp_date desc";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 11%">Ticket ID</th>
                    <th style="width: 11%">Lodger ID</th>
                    <th style="width: 11%">Date</th>
                    <th style="width: 11%">Complaint</th>
                    <th style="width: 11%">Location</th>
                    <th style="width: 11%">Priority</th>
                    <th style="width: 11%">Current Status</th>
                    <th style="width: 11%">Edit Status</th>
                    <th style="width: 11%">Forward</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 11%"><%=rs.getString(1)%></td>
                    <td style="width: 11%"><%=rs.getString(2)%></td>
                    <td style="width: 11%"><%=rs.getDate(3)%></td>
                    <td style="width: 11%"><%=rs.getString(4)%></td>
                    <td style="width: 11%"><%=rs.getString(5)%></td>
                    <td style="width: 11%"><%=rs.getString(6)%></td>
                    <td style="width: 11%"><%=rs.getString(7)%></td>
                    <td style="width: 11%"><input type="submit" onclick="editStatus(<%=rs.getString("sno")%>);" name="comp_edit" value="Edit Status"></td>
                    <td style="width: 11%"><input type="submit" onclick="compForward(<%=rs.getString("sno")%>);" name="comp_for" value="Forward" /></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
