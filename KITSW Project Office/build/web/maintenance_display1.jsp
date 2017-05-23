<%-- 
    Document   : maintenance
    Created on : 8 Feb, 2016, 10:23:42 PM
    Author     : Shashank
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maintenance</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="javascript">
        function editRecord(id){
            var f= document.getElementById("edit");
            f.method="post";
            f.action="maintenance_edit.jsp?id="+id;
            f.submit();            
        }
        
        function deleteRecord(id){
            var f= document.getElementById("delete");
            f.method="post";
            f.action="maintenance_delete.jsp?id="+id;
            f.submit();            
        }
    </script>
    <body>
        <div id="nav">
        <div id="nav_wrapper">
            <ul>
            <li><a href="projectofficer.jsp">About</a>
            </li>
            <li> <a href="budget_allocate.jsp">Budget Allocate</a>
            </li>
            <li> <a href="maintenance_entry.jsp">Maintenance Entry</a>
            </li>
            <li> <a href="#">Reports</a>
                <ul>
                    <li><a href="budget_report.jsp">Budget</a>
                    </li>
                    <li><a href="maintenance_display.jsp">Maintenance</a>
                    </li>
                    <li><a href="purchase_display.jsp">Purchases</a>
                    </li>
                    <li><a href="store_display.jsp">Store</a>
                    </li>
                    <li><a href="stock_display.jsp">Stock Issue</a>
                    </li>
                </ul>
            </li>
            <li> <a href="#">Complaints</a>

                <ul>
                    <li><a href="complaint_display.jsp">Display</a>
                    </li>
                    <li><a href="complaint_repdisplay.jsp">Report and Orders</a>
                    </li>
                </ul>
            </li>
            <li> <a href="create_login.jsp">Create Login</a>
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
</div>
        <form id="delete" name="delete"></form>
        <form id="edit" name="edit"></form>
        <%
            String mntnce_from1=request.getParameter("mntnce_from");
            String mntnce_to1=request.getParameter("mntnce_to");
            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date mntnce_from2 = reFormat.parse(mntnce_from1);
            Date mntnce_to2=reFormat.parse(mntnce_to1);
            java.sql.Date mntnce_from = new java.sql.Date(mntnce_from2.getTime());
            java.sql.Date mntnce_to = new java.sql.Date(mntnce_to2.getTime());
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
        String sql="select * from mntnce_entry where date_init between ? and ? order by sno ASC";
        PreparedStatement st=con.prepareStatement(sql);
        st.setDate(1, mntnce_from);
        st.setDate(2, mntnce_to);
        ResultSet rs=st.executeQuery();
        %>
        <table border="1" style="width: 100%">
            <tbody>
                <tr>
                    <th style="width: 11%">Serial Number</th>
                    <th style="width: 11%">Category</th>
                    <th style="width: 11%">Work Name</th>
                    <th style="width: 11%">Place</th>
                    <th style="width: 11%">Budget</th>
                    <th style="width: 11%">Date of Initiation</th>
                    <th style="width: 11%">Date of Completion</th>
                    <th style="width: 11%">Edit Row</th>
                    <th style="width: 11%">Delete Row</th>
                </tr>
            </tbody>
        </table>
                <%
                    while(rs.next()){
                %>
        <table border="1" style="width: 100%">        
            <tbody>
                <tr>
                    <td style="width: 11%"><%=rs.getString("sno")%></td>
                    <td style="width: 11%"><%=rs.getString("category")%></td>
                    <td style="width: 11%"><%=rs.getString("work_name")%></td>
                    <td style="width: 11%"><%=rs.getString("place")%></td>
                    <td style="width: 11%"><%=rs.getString("budget")%></td>
                    <td style="width: 11%"><%=rs.getDate("date_init")%></td>
                    <td style="width: 11%"><%=rs.getDate("date_comp")%></td>
                    <td style="width: 11%"><input type="submit" onclick="editRecord(<%=rs.getString("sno")%>);" name="mntnce_edit" value="Edit"></td>
                    <td style="width: 11%"><input type="submit" onclick="deleteRecord(<%=rs.getString("sno")%>);" name="mntnce_delete" value="Delete" /></td>
                </tr>
            </tbody>
        </table>

        <%
        }
        %>
    </body>
</html>
