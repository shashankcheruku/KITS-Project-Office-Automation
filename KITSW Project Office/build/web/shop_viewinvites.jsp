<%-- 
    Document   : shop_viewinvites
    Created on : 14 Apr, 2016, 5:41:48 PM
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
        <title>View Invitations</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function sendQuote(id){
            var f= document.getElementById("sendquote");
            f.method="post";
            f.action="quote_send.jsp?id="+id;
            f.submit();            
        }
    </script>
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
        <form id="sendquote" name="sendquote"></form>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from quote_invite where sysdate<exp_date";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 16%">Quote ID</th>
                    <th style="width: 16%">Item Name</th>
                    <th style="width: 16%">Quantity</th>
                    <th style="width: 16%">Comments</th>
                    <th style="width: 16%">Expiration Date</th>
                    <th style="width: 16%">Send a Quote</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 16%"><%=rs.getString(1)%></td>
                    <td style="width: 16%"><%=rs.getString(2)%></td>
                    <td style="width: 16%"><%=rs.getString(3)%></td>
                    <td style="width: 16%"><%=rs.getString(4)%></td>
                    <td style="width: 16%"><%=rs.getString(5)%></td>
                    <td style="width: 16%"><input type="submit" onclick="sendQuote(<%=rs.getString(1)%>);" name="quote_send" value="Send a Quote"></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
