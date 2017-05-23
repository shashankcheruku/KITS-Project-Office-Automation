<%-- 
    Document   : login
    Created on : 6 Apr, 2016, 12:19:30 PM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="login_style.css" type="text/css" rel="stylesheet" />
    </head>
    <body link="red">
        <h1 align="center">WELCOME TO KITS PROJECT OFFICE</h1>
        <h2 align="center">PLEASE ENTER YOUR LOGIN CREDENTIALS</h2>
        <center>
            <form name="login_form" action="login1.jsp" method="POST">
                <table  border="0">
                    <tbody>
                        <tr>
                            <td><span style="font-weight: bold">User Name: </span></td>
                            <td><input type="text" name="uid" value="" /></td>
                        </tr>
                        <tr>
                            <td><span style="font-weight: bold">Password: </span></td>
                            <td><input type="password" name="pwd" value="" /></td>
                        </tr>
                    </tbody>
                </table>
                <input style="font-size: 25px" align="middle" type="submit" name="login_button" value="Login" />
                <p><a href="shop_reg.jsp">New Shop? Register Here</a></p>
            </form>
        </center>
    </body>
</html>
