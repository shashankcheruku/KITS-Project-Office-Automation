<%-- 
    Document   : create_login
    Created on : 18 Feb, 2016, 10:12:30 PM
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
        <title>Login Creation</title>
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
            String user_id=request.getParameter("user_id");
            String pwd=request.getParameter("pwd");
            String re_pwd=request.getParameter("re_pwd");
            String user_type=request.getParameter("user_type");
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            
            if(pwd.equals(re_pwd)){
                String sql="Insert into login (userid, password, officer_type) values('"+user_id+"', '"+pwd+"', '"+user_type+"')";
                PreparedStatement st=con.prepareStatement(sql);
                st.execute();
        %>        
        <p style="margin-left: 50%">Successfully Created</p>
        <a style="margin-left: 50%" href="projectofficer.jsp">Home</a>
        <%
            }
            else{
        %>        
        <p style="margin-left: 50%">Passwords do not match. To try again, </p> 
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%
            }
            }
            catch(java.sql.SQLException  e){
        %>        
        <p style="margin-left: 50%">Username already exists. To try again, </p> 
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%
            }
        %>
    </body>
</html>
