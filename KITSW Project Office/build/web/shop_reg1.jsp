<%-- 
    Document   : shop_reg1
    Created on : 14 Apr, 2016, 2:35:03 PM
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
        <title>Shop Registration</title>
        <link href="login_style.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <%
            String shop_id=request.getParameter("shop_id");
            String pwd=request.getParameter("pwd");
            String re_pwd=request.getParameter("re_pwd");
            String shop_name=request.getParameter("shop_name");
            String shop_addr=request.getParameter("shop_addr");
            String shop_phone=request.getParameter("shop_phone");
            int present=0;
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","shashank");
            String sql1="select userid from login";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next()){
                if(shop_id.equals(rs1.getString(1))){
                    present=1;
                    break;
                }
            }
            if(present==1){
        %>
        <p style="margin-left: 50%">Username already exists. To try again, </p>
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%
            }
            else{
                if(pwd.equals(re_pwd)){
                    String sql="insert into shop_db(shop_sno,shop_id,shop_name,address,phone) values(shop_sno.nextval,'"+shop_id+"','"+shop_name+"','"+shop_addr+"','"+shop_phone+"')";
                    PreparedStatement st=con.prepareStatement(sql);
                    st.execute();
                    
                    String sql2="insert into login(userid,password,officer_type) values('"+shop_id+"','"+pwd+"','Shop')";
                    PreparedStatement st2=con.prepareStatement(sql2);
                    st2.execute();
        %>
        <p style="margin-left: 50%">Submitted</p>
        <a style="margin-left: 50%" href="login.jsp">Home</a>
        <%
                }
                else{
        %>
        <p style="margin-left: 50%">Password and its re-entry do not match. To try again, </p>
        <a style="margin-left: 50%" href="javascript:history.back()">Click Here</a>
        <%
                }
            }
        %>  
    </body>
</html>
