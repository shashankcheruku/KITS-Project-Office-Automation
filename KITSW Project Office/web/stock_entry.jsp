<%-- 
    Document   : stock_entry
    Created on : 28 Mar, 2016, 9:17:49 PM
    Author     : Shashank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
    <script lang="javascript">
        function editRecord(id){
            var f= document.getElementById("edit");
            f.method="post";
            f.action="stock_entry1.jsp?id="+id;
            f.submit();            
        }
        
    </script>
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
        <form id="edit" name="edit"></form>
        <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from store";
        PreparedStatement st=con.prepareStatement(sql);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 25%">Serial Number</th>
                    <th style="width: 25%">Item Name</th>
                    <th style="width: 25%">Quantity</th>
                    <th style="width: 25%">Select Row</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 25%"><%=rs.getString("sno")%></td>
                    <td style="width: 25%"><%=rs.getString("item_name")%></td>
                    <td style="width: 25%"><%=rs.getString("quantity")%></td>
                    <td style="width: 25%"><input type="submit" onclick="editRecord(<%=rs.getString("sno")%>);" name="mntnce_edit" value="Select"></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
