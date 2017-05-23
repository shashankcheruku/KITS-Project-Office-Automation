<%-- 
    Document   : maintenance_entry
    Created on : 6 Apr, 2016, 11:54:37 AM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maintenance Entry</title>
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
    <center>
        <form name="maintenance_entry" action="maintenance_entry1.jsp" method="POST">
            <table border="0">
                <tbody>
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
                        <td><input type="text" name="work_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Place:</td>
                        <td><input type="text" name="place" value="" /></td>
                    </tr>
                    <tr>
                        <td>Budget</td>
                        <td><input type="number" min="1" name="budget" value="" /></td>
                    </tr>
                    <tr>
                        <td>Date of Initiation</td>
                        <td><input type="date" name="date_init" /></td>
                    </tr>
                    <tr>
                        <td>Date of Completion</td>
                        <td><input type="date" name="date_comp" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
