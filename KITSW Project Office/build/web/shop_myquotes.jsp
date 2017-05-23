<%-- 
    Document   : shop_myquotes
    Created on : 14 Apr, 2016, 6:34:16 PM
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
        <title>My Quotes</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div id="nav">
        <div id="nav_wrapper">
            <ul>
            <li><a href="shops.jsp">About</a>
            </li>
            <li> <a href="shop_viewinvites.jsp">View Invitations</a>
            </li>
            <li> <a href="shop_myquotes.jsp">My Quotes</a>
            </li>
            <li> <a href="change_pwd.jsp">Change Password</a>
            </li>
            <li> <a href="logout.jsp">Logout</a>
            </li>
        </ul>
    </div>
</div>
        <%
            String user_id=(String)session.getAttribute("userid");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from quotes where shop_id='"+user_id+"'";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 16%">Quote ID</th>
                    <th style="width: 16%">Item Name</th>
                    <th style="width: 16%">Quantity</th>
                    <th style="width: 16%">Price</th>
                    <th style="width: 16%">Comments</th>
                    <th style="width: 16%">Status</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 16%"><%=rs.getString(2)%></td>
                    <td style="width: 16%"><%=rs.getString(4)%></td>
                    <td style="width: 16%"><%=rs.getString(5)%></td>
                    <td style="width: 16%"><%=rs.getString(6)%></td>
                    <td style="width: 16%"><%=rs.getString(7)%></td>
                    <td style="width: 16%"><%=rs.getString(8)%></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
