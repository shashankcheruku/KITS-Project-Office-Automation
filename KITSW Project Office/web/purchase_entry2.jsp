<%-- 
    Document   : purchase_entry
    Created on : 8 Mar, 2016, 9:35:57 AM
    Author     : Shashank
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            try{
            int present=0;
            String item_name=request.getParameter("item_name");
            String quantity=request.getParameter("quantity");
            String shop_name=request.getParameter("shop_name");
            String bill_no=request.getParameter("bill_no");
            String bill_date1=request.getParameter("bill_date");
            SimpleDateFormat reFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date bill_date2 = reFormat.parse(bill_date1);
            int year=bill_date2.getYear();
            year=year+1900;
            Date bud_year=reFormat.parse(""+year+"-03-31");
            int comp=bill_date2.compareTo(bud_year);
            java.sql.Date bill_date = new java.sql.Date(bill_date2.getTime());
            String init_by=request.getParameter("init_by");
            String amount=request.getParameter("amount");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            
            String sql1="select item_name from store";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next()){
                if(item_name.equals(rs1.getString(1)))
                        present=1;
            }
            if(present==1){
                String sql2="update store set quantity=quantity+"+quantity+" where item_name='"+item_name+"'";
                PreparedStatement st2=con.prepareStatement(sql2);
                st2.execute();
            }
            else{
                String sql3="insert into store values(store_sno.nextval,'"+item_name+"',"+quantity+")";
                PreparedStatement st3=con.prepareStatement(sql3);
                st3.execute();
            }
            
            String sql="Insert into purchases (sno,item_name,quantity,shop_name,bill_no,bill_date,initiated_by,amount) values(pur_sno.nextval,?,?,?,?,?,?,?)";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, item_name);
            st.setString(2, quantity);
            st.setString(3, shop_name);
            st.setString(4, bill_no);
            st.setDate(5, bill_date);
            st.setString(6, init_by);
            st.setString(7,amount);
            st.execute();
            
            String sql4="";
            if(comp<=0){
                year=year-1;
                sql4="update budget set spent=spent+'"+amount+"', remain=remain-'"+amount+"' where bud_from='"+year+"'";
                PreparedStatement st4=con.prepareStatement(sql4);
                st4.execute();
            }
            else{
                sql4="update budget set spent=spent+'"+amount+"', remain=remain-'"+amount+"' where bud_from='"+year+"'";
                PreparedStatement st4=con.prepareStatement(sql4);
                st4.execute();
            }
            
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="purchaseofficer.jsp">Home</a>
        <%
            }
            catch(Exception e){
        %>
        <p style="margin-left: 50%">All fields are mandatory. To try again, </p>
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%}%>
    </body>
</html>
