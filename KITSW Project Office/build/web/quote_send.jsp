<%-- 
    Document   : quote_send
    Created on : 14 Apr, 2016, 6:02:00 PM
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
        <title>Send a Quote</title>
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
        <center>
            <%
                String id=request.getParameter("id");
                int quote_id=Integer.parseInt(id);
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
                String sql="select * from quote_invite where quote_id='"+quote_id+"'";
                PreparedStatement st=con.prepareStatement(sql);
                ResultSet rs=st.executeQuery();
                while(rs.next()){
            %>
        <form name="quote_send" action="quote_send1.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Quote ID: </td>
                        <td><input type="number" name="quote_id" value="<%=rs.getString(1)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Item Name: </td>
                        <td><input type="text" name="item_name" value="<%=rs.getString(2)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Quantity: </td>
                        <td><input type="number" name="quantity" value="<%=rs.getString(3)%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Price: </td>
                        <td><input type="number" min="1" name="price" value="" /></td>
                    </tr>
                    <tr>
                        <td>Comments: </td>
                        <td><textarea name="comments" rows="4" cols="25">
                            </textarea></td>
                    </tr>
                </tbody>
            </table>
            <%
                }
            %>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
