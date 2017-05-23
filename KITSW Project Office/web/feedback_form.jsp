<%-- 
    Document   : feedback_form1
    Created on : 31 Mar, 2016, 11:59:16 PM
    Author     : Shashank
--%>

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
    <center>
        <form name="feedback_form" action="feedback_form1.jsp" method="POST">
            <table style="margin-top: 40px" border="0">
                <tbody>
                    <tr>
                        <td>Name: </td>
                        <td><input type="text" name="user_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Mobile No.: </td>
                        <td><input type="tel" name="mobile_no" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="email" name="email_addr" value="" /></td>
                    </tr>
                    <tr>
                        <td>Feedback: </td>
                        <td><textarea name="feedback" rows="5" cols="40">
                            </textarea></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
