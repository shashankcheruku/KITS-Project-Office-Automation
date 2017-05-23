<%-- 
    Document   : logout
    Created on : 19 Feb, 2016, 1:02:25 PM
    Author     : Shashank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link href="login_style.css" type="text/css" rel="stylesheet" />
    </head>
    <script lang="JavaScript">
            window.history.forward();
            function noBack() { 
                window.history.forward(); 
            }
    </script>
    <body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
        <%
            session.invalidate();
        %>
    <center>
        <h1>You have been successfully logged out</h1>
        <h2><a href="login.jsp">Click Here to login again</a></h2>
    </center>
    </body>
</html>
