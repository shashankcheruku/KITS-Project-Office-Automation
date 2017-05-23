<%-- 
    Document   : msg_view
    Created on : 4 Mar, 2016, 9:47:03 PM
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
        <title>Inbox</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <%
            String user_id=(String)session.getAttribute("userid");
            if(user_id.equals("project_officer")){
        %>
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
        <%
            }
            else if(user_id.equals("purchase_officer")){
        %>
        <div id="nav">
    <div id="nav_wrapper">
        <ul>
            <li><a href="purchaseofficer.jsp">About</a>
            </li>
            <li> <a href="#">Purchases</a>
                <ul>
                    <li> <a href="purchase_entry.jsp">Purchase Entry</a>
                    </li>
                    <li> <a href="purchase_display.jsp">View Purchases</a>
                    </li>
                </ul>
            </li>
            <li> <a href="stock_display.jsp">View Issue of stock</a>
            </li>
            <li> <a href="#">Quotations</a>
                <ul>
                    <li><a href="quote_invite.jsp">New Invitation</a>
                    </li>
                    <li><a href="quote_viewinvites.jsp">View Invitations</a>
                    </li>
                </ul>
            </li>
            <li> <a href="shop_db.jsp">Shop Database</a>
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
    <!-- Nav wrapper end -->
</div>
        <%
            }
            else if(user_id.equals("store_officer")){
        %>
        <div id="nav">
    <div id="nav_wrapper">
        <ul>
            <li><a href="storeofficer.jsp">About</a>
            </li>
            <li> <a href="#">Stock Issue</a>

                <ul>
                    <li><a href="stock_entry.jsp">Entry</a>
                    </li>
                    <li><a href="stock_display.jsp">Display</a>
                    </li>
                </ul>
            </li>
            <li> <a href="store_display.jsp">Store</a>
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
    <!-- Nav wrapper end -->
</div>
        <%
            }
            String msg_rec="null";
            if(user_id.equals("project_officer"))
            {
                msg_rec="Project Officer";
            }
            else if(user_id.equals("purchase_officer"))
            {
                msg_rec="Purchase Officer";
            }
            else if(user_id.equals("store_officer"))
            {
                msg_rec="Store Officer";
            }
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select msg_sender,msg,msg_date from msg_box where msg_rec='"+msg_rec+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 20%">Message Sender</th>
                    <th style="width: 60%">Message</th>
                    <th style="width: 20%">Date</th>
                </tr>
            </tbody>
        </table>
        <%
            while(rs.next()){
        %>
        
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <td style="width: 20%"><%=rs.getString("msg_sender")%></td>
                    <td style="width: 60%"><%=rs.getString("msg")%></td>
                    <td style="width: 20%"><%=rs.getDate("msg_date")%></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
