<%-- 
    Document   : complaint_order
    Created on : 14 Apr, 2016, 12:25:28 PM
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
        <title>Issue Order</title>
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
            String id=request.getParameter("id");
            int no=Integer.parseInt(id);
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select * from comp_report where ticket_id='"+no+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next())
            {
        %>   
    <center>
        <form name="comp_order" action="complaint_order1.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Ticket ID: </td>
                        <td><input type="number" name="tid" value="<%=rs.getString(1)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Complaint: </td>
                        <td><input type="text" name="complaint" value="<%=rs.getString(2)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Report: </td>
                        <td><input type="text" name="report" value="<%=rs.getString(3)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Reporter ID: </td>
                        <td><input type="text" name="rep_id" value="<%=rs.getString(4)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Order: </td>
                        <td><textarea name="comp_order" rows="4" cols="25">
                            </textarea></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="Submit" />
        </form>
                        <%
            }
            %>
    </center>
    </body>
</html>
