<%-- 
    Document   : maintenance_edit
    Created on : 15 Feb, 2016, 8:06:44 PM
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
        <title>Maintenance Edit</title>
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
            String sql="select * from mntnce_entry where sno='"+no+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next())
            {
        %>   
    <center>
        <form name="maintenance_edit" action="maintenance_edit1.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Serial Number:</td>
                        <td><input type="number" name="sno" value="<%=rs.getString("sno")%>" /></td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td><select name="category">
                                <option>Civil Works</option>
                                <option>Renovations</option>
                                <option>Water Supply</option>
                                <option>Furniture</option>
                                <option>Electrical Maintenance</option>
                                <option>Cleaning and Sanitation</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Work Name:</td>
                        <td><input type="text" name="work_name" value="<%=rs.getString("work_name")%>" /></td>
                    </tr>
                    <tr>
                        <td>Place:</td>
                        <td><input type="text" name="place" value="<%=rs.getString("place")%>" /></td>
                    </tr>
                    <tr>
                        <td>Budget</td>
                        <td><input type="number" min="1" name="budget" value="<%=rs.getString("budget")%>" /></td>
                    </tr>
                    <tr>
                        <td>Date of Initiation</td>
                        <td><input type="date" name="date_init" value="<%=rs.getDate("date_init")%>"/></td>
                    </tr>
                    <tr>
                        <td>Date of Completion</td>
                        <td><input type="date" name="date_comp" value="<%=rs.getDate("date_comp")%>"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="edit" name="edit" />
        </form>
                        <%
            }
            %>
    </center>
    </body>
</html>
