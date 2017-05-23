<%-- 
    Document   : purchase_entry
    Created on : 15 Apr, 2016, 8:43:11 AM
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
        <title>Purchase Entry</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function purchaseEntry(id){
            var f= document.getElementById("purchase");
            f.method="post";
            f.action="purchase_entry1.jsp?id="+id;
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
        <form id="purchase" name="purchase"></form>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from quotes where status='Accepted'";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 14%">Serial Number</th>
                    <th style="width: 14%">Quote ID</th>
                    <th style="width: 14%">Shop ID</th>
                    <th style="width: 14%">Item Name</th>
                    <th style="width: 14%">Quantity</th>
                    <th style="width: 14%">Price</th>
                    <th style="width: 14%">Purchase</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 14%"><%=rs.getString(1)%></td>
                    <td style="width: 14%"><%=rs.getString(2)%></td>
                    <td style="width: 14%"><%=rs.getString(3)%></td>
                    <td style="width: 14%"><%=rs.getString(4)%></td>
                    <td style="width: 14%"><%=rs.getString(5)%></td>
                    <td style="width: 14%"><%=rs.getString(6)%></td>
                    <td style="width: 14%"><input type="submit" onclick="purchaseEntry(<%=rs.getString(1)%>);" name="purchase" value="Purchase"></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
