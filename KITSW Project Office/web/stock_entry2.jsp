<%-- 
    Document   : stock_entry2
    Created on : 29 Mar, 2016, 9:25:20 AM
    Author     : Shashank
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock Entry</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
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
        <%
            String item_name=request.getParameter("item_name");
            String quantity=request.getParameter("quantity");
            String date_issue1=request.getParameter("date_issue");
            String rec_name=request.getParameter("rec_name");
            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date_issue2 = reFormat.parse(date_issue1);
            java.sql.Date date_issue = new java.sql.Date(date_issue2.getTime());
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
              
            String sql2="update store set quantity=quantity-"+quantity+" where item_name='"+item_name+"'";
            PreparedStatement st2=con.prepareStatement(sql2);
            st2.execute();
                    
            String sql="Insert into stock_issue (sno,item_name,quantity,issue_date,rec_name) values(stock_sno.nextval,?,?,?,?)";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, item_name);
            st.setString(2, quantity);
            st.setDate(3, date_issue);
            st.setString(4, rec_name);
            st.execute();
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="storeofficer.jsp">Home</a>
    </body>
</html>
