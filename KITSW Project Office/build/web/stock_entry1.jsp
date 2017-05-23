<%-- 
    Document   : stock_entry1
    Created on : 29 Mar, 2016, 9:28:34 AM
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
        <title>Stock Issue</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
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
            String item_name="";
            int quan=0;
            String sno1=request.getParameter("id");
            int sno=Integer.parseInt(sno1);
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select * from store where sno='"+sno+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                item_name=rs.getString("item_name");
                String quan1=rs.getString("quantity");
                quan=Integer.parseInt(quan1);
            }
        %>
    <center>    
        <form name="stock_entry1" action="stock_entry2.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Item Name: </td>
                        <td><input type="text" name="item_name" value="<%=item_name%>" readonly /></td>
                    </tr>
                    <tr>
                        <td>Enter Quantity: </td>
                        <td><input type="number" name="quantity" min="1" max="<%=quan%>" /></td>
                    </tr>
                    <tr>
                        <td>Receiver Name: </td>
                        <td><input type="text" name="rec_name" /></td>
                    </tr>
                    <tr>
                        <td>Date of Issue: </td>
                        <td><input type="date" name="date_issue" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="Submit" />
        </form>
    </center>
    </body>
</html>
