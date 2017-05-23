<%-- 
    Document   : maintenance_entry
    Created on : 14 Feb, 2016, 6:31:22 PM
    Author     : Shashank
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maintenance Entry</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
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
        <%
            try{
            String category=request.getParameter("category");
            String work_name=request.getParameter("work_name");
            String place=request.getParameter("place");
            String budget=request.getParameter("budget");
            String date_init1=request.getParameter("date_init");
            String date_comp1=request.getParameter("date_comp");
            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date_init2 = reFormat.parse(date_init1);
            int year=date_init2.getYear();
            year=year+1900;
            Date bud_year=reFormat.parse(""+year+"-03-31");
            int comp=date_init2.compareTo(bud_year);
            Date date_comp2 = reFormat.parse(date_comp1);
            java.sql.Date date_init = new java.sql.Date(date_init2.getTime());
            java.sql.Date date_comp = new java.sql.Date(date_comp2.getTime());
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql="Insert into mntnce_entry (sno,category,work_name,place,budget,date_init,date_comp) values(mntnce_sno.nextval,?,?,?,?,?,?)";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, category);
            st.setString(2, work_name);
            st.setString(3, place);
            st.setString(4, budget);
            st.setDate(5, date_init);
            st.setDate(6, date_comp);
            st.execute();
            
            String sql1="";
            if(comp<=0){
                year=year-1;
                sql1="update budget set spent=spent+'"+budget+"', remain=remain-'"+budget+"' where bud_from='"+year+"'";
                PreparedStatement st1=con.prepareStatement(sql1);
                st1.execute();
            }
            else{
                sql1="update budget set spent=spent+'"+budget+"', remain=remain-'"+budget+"' where bud_from='"+year+"'";
                PreparedStatement st1=con.prepareStatement(sql1);
                st1.execute();
            }
       %>
       <p style="margin-left: 50%">Submitted</p>
       <a style="margin-left: 50%" href="projectofficer.jsp">Home</a>
       <%
            }
            catch(Exception e){
        %>        
        <p style="margin-left: 50%">All fields are mandatory. To try again,</p>
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%}%>

    </body>
</html>
