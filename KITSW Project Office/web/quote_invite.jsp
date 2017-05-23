<%-- 
    Document   : quote_invite
    Created on : 14 Apr, 2016, 4:58:59 PM
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
        <title>Invitation for a Quotation</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function drop_change(){
            var name1=document.getElementById("item_name");
            var drop1=document.getElementById("item_drop");
            var rbut1=document.getElementById("rbut1");
            if(rbut1.checked){
                name1.value=drop1.options[drop1.selectedIndex].text;
            }
        }
        function but1_checked(){
            var name1=document.getElementById("item_name");
            var drop1=document.getElementById("item_drop");
            name1.value=drop1.options[drop1.selectedIndex].text;
            name1.readOnly=true;
        }
        function but2_checked(){
            var name1=document.getElementById("item_name");
            name1.readOnly=false;
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
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="select item_name from store";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
        %>
        <center>
        <form name="quote_invite" action="quote_invite1.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td rowspan="2">Item Name: </td>
                        <td><input type="radio" name="radio" id="rbut1" onclick="but1_checked();"><select name="item_drop" id="item_drop" onchange="drop_change();">
                                <%while(rs.next()){%>
                                <option><%=rs.getString(1)%></option>
                            <%}%></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="radio" onclick="but2_checked();"><input type="text" name="item_name" id="item_name" /></td>
                    </tr>
                    <tr>
                        <td>Quantity: </td>
                        <td><input type="number" min="1" name="quantity" value="" /></td>
                    </tr>
                    <tr>
                        <td>Comments: </td>
                        <td><textarea name="comments" rows="4" cols="25">
                            </textarea></td>
                    </tr>
                    <tr>
                        <td>Expiration Date: </td>
                        <td><input type="date" name="exp_date" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
