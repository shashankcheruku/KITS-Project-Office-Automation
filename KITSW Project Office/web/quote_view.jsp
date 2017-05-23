<%-- 
    Document   : quote_view
    Created on : 14 Apr, 2016, 7:10:42 PM
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
        <title>View Quotations</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function acceptQuote(id){
            var f= document.getElementById("acceptquote");
            f.method="post";
            f.action="quote_accept.jsp?id="+id;
            f.submit();            
        }
    </script>    
    <body>
        <div id="nav">
    <div id="nav_wrapper">
        <ul>
            <li><a href="purchaseofficer.jsp">About</a>
            </li>
            <li> <a href="#">Purchases</a>
                <ul>
                    <li> <a href="purchase_entry.jsp">Purchase Entry</a>
                    </li>
                    <li> <a href="purchase_display.jsp">View Purchases</a>
                    </li>
                </ul>
            </li>
            <li> <a href="stock_display.jsp">View Issue of stock</a>
            </li>
            <li> <a href="#">Quotations</a>
                <ul>
                    <li><a href="quote_invite.jsp">New Invitation</a>
                    </li>
                    <li><a href="quote_viewinvites.jsp">View Invitations</a>
                    </li>
                </ul>
            </li>
            <li> <a href="shop_db.jsp">Shop Database</a>
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
        <form id="acceptquote" name="acceptquote"></form>
        <%
            String id=request.getParameter("id");
            int quote_id=Integer.parseInt(id);
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from quotes where quote_id='"+quote_id+"'";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 11%">Serial Number</th>
                    <th style="width: 11%">Quote ID</th>
                    <th style="width: 11%">Shop ID</th>
                    <th style="width: 11%">Item Name</th>
                    <th style="width: 11%">Quantity</th>
                    <th style="width: 11%">Price</th>
                    <th style="width: 11%">Comments</th>
                    <th style="width: 11%">Status</th>
                    <th style="width: 11%">Accept/Decline</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 11%"><%=rs.getString(1)%></td>
                    <td style="width: 11%"><%=rs.getString(2)%></td>
                    <td style="width: 11%"><%=rs.getString(3)%></td>
                    <td style="width: 11%"><%=rs.getString(4)%></td>
                    <td style="width: 11%"><%=rs.getString(5)%></td>
                    <td style="width: 11%"><%=rs.getString(6)%></td>
                    <td style="width: 11%"><%=rs.getString(7)%></td>
                    <td style="width: 11%"><%=rs.getString(8)%></td>
                    <td style="width: 11%"><input type="submit" onclick="acceptQuote(<%=rs.getString(1)%>);" name="accept" value="Accept"></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
