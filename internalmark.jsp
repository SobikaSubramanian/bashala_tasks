<%-- 
    Document   : internalmark
    Created on : 28-Jun-2024, 9:00:15 PM
    Author     : barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internal Mark Calculation</title>
        <style>
            body{
                background-color: skyblue;
                font-size: 30px;
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
        String str1 = request.getParameter("reg");
        String dbDriver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:2023/";
        String dbname = "bashala";
        String username = "root";
        String password = "sobi";
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(url + dbname, username, password);
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM student_details WHERE register_no = ? LIMIT 1");
        pstmt.setString(1, str1);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            String attendane_mark = rs.getString("attendance");
            String labMark = rs.getString("lab");
            String subjectMark = rs.getString("marks");
            String quizMark = rs.getString("quiz");
            out.println("<h3>Welcome register number "+str1+" !</h3>");
            out.println("<p>Your Attendance Mark: "+ attendane_mark + "% </p>");
            out.println("<p>Your Lab Mark: "+ labMark + "% </p>");
            out.println("<p>Your All Subject Mark: "+ subjectMark + "% </p>");
            out.println("<p>Your Quiz Mark: "+ quizMark + "% </p>");
            
            if(attendane_mark!= null && labMark!=null && subjectMark!=null && quizMark!=null){
                int total = Integer.parseInt(attendane_mark) + Integer.parseInt(labMark) + Integer.parseInt(subjectMark) + Integer.parseInt(quizMark);
                int percentage = (total*100) / 400;
                out.println("total: " +total + " out of 400");
                out.println("Percentage: " + percentage +"%");
            }
            }
            else{
            out.println("<p style=\"color:red;\"> student not found </p>");
            }
        %>
    </body>
</html>
