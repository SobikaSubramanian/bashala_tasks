<%-- 
    Document   : circular
    Created on : 14-Jul-2024, 8:46:59 PM
    Author     : barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Circular</title>
        <style>
            body{
                background-color: skyblue;
            }
            li{
                font-size: 25px;
                text-align: center;
            }
            a{
                font-size: 30px;
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <a href="common_details.html"><-</a>
        <%
            String dbDriver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:2023/";
        String dbname = "bashala";
        String username = "root";
        String password = "sobi";
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(url + dbname, username, password);
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM circular");
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
        String columnValue = rs.getString("name");
        out.println("<li>" + columnValue + "</li>");
            }
        %>
    </body>
</html>
