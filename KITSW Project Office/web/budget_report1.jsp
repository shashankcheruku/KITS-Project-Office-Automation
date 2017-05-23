<%-- 
    Document   : budget_report
    Created on : 8 Mar, 2016, 7:37:57 PM
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
        <title>Budget Report</title>
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
            String bud_from=request.getParameter("bud_from");
            String bud_to=request.getParameter("bud_to");
            int bud_from1=Integer.parseInt(bud_from);
            int bud_to1=Integer.parseInt(bud_to);
            String total="";
            String spent="";
            String remain="";
            if(bud_to1==bud_from1+1){
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select total,spent,remain from budget where bud_from='"+bud_from+"' and bud_to='"+bud_to+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            if(!rs.next()){%>
            <p style="margin-left: 50%">Budget does not exist. To try again,</p>
            <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>    
            <%}
            else{
            rs=st.executeQuery();
            while(rs.next()){
            total=rs.getString(1);
            spent=rs.getString(2);
            remain=rs.getString(3);
            }
        %>
        <p style="margin-left: 30%"><strong>From: </strong> <%=bud_from%></p>
        <p style="margin-left: 30%"><strong>To: </strong> <%=bud_to%></p>
        <p style="margin-left: 30%"><strong>Total: </strong> <%=total%></p>
        <p style="margin-left: 30%"><strong>Budget Spent: </strong> <%=spent%></p>
        <p style="margin-left: 30%"><strong>Budget Remaining: </strong> <%=remain%></p>
        <%  
            }
            }
            else{
        %>        
        <p style="margin-left: 50%">Budget year has a difference of 1. To try again,</p>
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%}%>
    </body>
</html>
