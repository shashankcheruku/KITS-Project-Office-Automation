<%-- 
    Document   : complaint_entry
    Created on : 6 Apr, 2016, 12:09:48 PM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Entry</title>
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
        <form name="complaint_entry" action="complaint_entry1.jsp" method="POST">
            <table style="margin-top: 40px" border="0">
                <tbody>
                    <tr>
                        <td>Complaint: </td>
                        <td><textarea name="comp_text" rows="4" cols="25">
                            </textarea></td>
                    </tr>
                    <tr>
                        <td>Location: </td>
                        <td><input type="text" name="comp_loc" value="" /></td>
                    </tr>
                    <tr>
                        <td>Priority: </td>
                        <td><select name="priority">
                                <option>High</option>
                                <option>Medium</option>
                                <option>Low</option>
                            </select></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
