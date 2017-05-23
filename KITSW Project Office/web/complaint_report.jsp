<%-- 
    Document   : complaint_report
    Created on : 13 Apr, 2016, 10:37:07 PM
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
        <title>Complaint Report</title>
        <link href="styles.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div id="nav">
        <div id="nav_wrapper">
            <ul>
            <li><a href="conusers.jsp">About</a>
            </li>
            <li> <a href="conusers_complaints.jsp">View Complaints</a>
            </li>
            <li> <a href="conusers_reports.jsp">My reports and Orders</a>
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
            String id=request.getParameter("id");
            int no=Integer.parseInt(id);
            int present=0;
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            
            String sql1="select ticket_id from comp_report";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next()){
                if(id.equals(rs1.getString(1))){
                    present=1;
                    break;
                }
                    
            }
            if(present==0){
            String sql="select * from complaints where sno='"+no+"'";
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
        %>
    <center>
        <form name="complaint_report" action="complaint_report1.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Ticket ID: </td>
                        <td><input type="number" name="sno" value="<%=no%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Complaint: </td>
                        <td><input type="text" name="comp_text" value="<%=rs.getString("comp_text")%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Report: </td>
                        <td><textarea name="comp_report" rows="5" cols="20">
                            </textarea></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Submit" name="Submit" />
        </form>
    </center>
                        <%
            }
            }
            else{
                %>
                <p style="margin-left: 50%">Report Exists</p>
                <a style="margin-left: 50%" href="conusers.jsp">Home</a>
            <%
                }
                        %>
    </body>
</html>
