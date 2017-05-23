<%-- 
    Document   : feedback_form1
    Created on : 1 Apr, 2016, 12:25:49 AM
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
        <title>Feedback Form</title>
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
            String user_name=request.getParameter("user_name");
            String mobile_no=request.getParameter("mobile_no");
            String email_addr=request.getParameter("email_addr");
            String feedback=request.getParameter("feedback");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="insert into feedback(user_name,mobile_no,email_addr,feedback) values('"+user_name+"','"+mobile_no+"','"+email_addr+"','"+feedback+"')";
            PreparedStatement st=con.prepareStatement(sql);
            st.execute();
            %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="users.jsp">Home</a>
        
    </body>
</html>
