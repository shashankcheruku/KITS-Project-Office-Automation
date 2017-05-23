<%-- 
    Document   : quote_send1
    Created on : 14 Apr, 2016, 6:17:25 PM
    Author     : Shashank
--%>

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
        <%
            String user_id=(String)session.getAttribute("userid");
            String quote_id=request.getParameter("quote_id");
            String item_name=request.getParameter("item_name");
            String quantity=request.getParameter("quantity");
            String price=request.getParameter("price");
            String comments=request.getParameter("comments");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="insert into quotes(sno,quote_id,shop_id,item_name,quantity,price,comments) values(quote_sno.nextval,'"+quote_id+"','"+user_id+"','"+item_name+"','"+quantity+"','"+price+"','"+comments+"')";
            PreparedStatement st=con.prepareStatement(sql);
            st.execute();
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="shops.jsp">Home</a>
    </body>
</html>
