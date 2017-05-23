<%-- 
    Document   : complaint_forward1
    Created on : 13 Apr, 2016, 12:34:07 PM
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
        <title>Complaint Forward</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
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
        <%
        String ide=request.getParameter("sno");
        int no=Integer.parseInt(ide);
        String comp_forward=request.getParameter("comp_forward");
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="Update complaints set comp_for='"+comp_forward+"' where sno='"+no+"'";
        PreparedStatement st=con.prepareStatement(sql);
        st.execute();
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="projectofficer.jsp">Home</a>
    </body>
</html>
