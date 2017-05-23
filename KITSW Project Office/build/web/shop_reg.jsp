<%-- 
    Document   : shop_reg
    Created on : 14 Apr, 2016, 2:20:29 PM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Registration</title>
        <link href="login_style.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <center>
        <form name="shop_reg" action="shop_reg1.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" name="shop_id" /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="pwd" /></td>
                    </tr>
                    <tr>
                        <td>Re-enter Password: </td>
                        <td><input type="password" name="re_pwd" /></td>
                    </tr>
                    <tr>
                        <td>Shop Name: </td>
                        <td><input type="text" name="shop_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Address: </td>
                        <td><textarea name="shop_addr" rows="4" cols="25">
                            </textarea></td>
                    </tr>
                    <tr>
                        <td>Phone Number: </td>
                        <td><input type="number" max="9999999999" name="shop_phone" value="" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="submit" />
        </form>
    </center>
    </body>
</html>
