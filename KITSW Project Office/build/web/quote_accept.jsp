<%-- 
    Document   : quote_accept
    Created on : 14 Apr, 2016, 7:50:23 PM
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
        <title>Accept Quote</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
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
        <%
            String id=request.getParameter("id");
            int sno=Integer.parseInt(id);
            String quote_id1="";
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql1="select quote_id from quotes where sno='"+sno+"'";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next()){
                quote_id1=rs1.getString(1);
            }
            int quote_id=Integer.parseInt(quote_id1);
            
            String sql="update quotes set status='Accepted' where sno='"+sno+"'";
            PreparedStatement st=con.prepareStatement(sql);
            st.execute();
            
            String sql2="update quotes set status='Declined' where quote_id='"+quote_id+"' and sno<>'"+sno+"'";
            PreparedStatement st2=con.prepareStatement(sql2);
            st2.execute();
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="purchaseofficer.jsp">Home</a>
    </body>
</html>
