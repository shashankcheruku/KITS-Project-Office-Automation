<%-- 
    Document   : purchase_entry
    Created on : 31 Mar, 2016, 2:59:47 PM
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
            String item_name="";
            String quantity="";
            String price="";
            String shop_id="";
            String shop_name="";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select * from quotes where sno='"+sno+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                item_name=rs.getString(4);
                quantity=rs.getString(5);
                price=rs.getString(6);
                shop_id=rs.getString(3);
            }
            String sql1="select shop_name from shop_db where shop_id='"+shop_id+"'";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next()){
                shop_name=rs1.getString(1);
            }
        %>
    <center>
        <form name="purchase_entry" action="purchase_entry2.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Item Name: </td>
                        <td><input type="text" name="item_name" value="<%=item_name%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Quantity: </td>
                        <td><input type="number" name="quantity" value="<%=quantity%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Price: </td>
                        <td><input type="number" name="amount" value="<%=price%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Shop Name: </td>
                        <td><input type="text" name="shop_name" value="<%=shop_name%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Bill No.: </td>
                        <td><input type="number" name="bill_no" value="" /></td>
                    </tr>
                    <tr>
                        <td>Bill Date: </td>
                        <td><input type="date" name="bill_date" /></td>
                    </tr>
                    <tr>
                        <td>Initiated by: </td>
                        <td><input type="text" name="init_by" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
