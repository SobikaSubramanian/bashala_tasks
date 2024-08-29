<%-- 
    Document   : admin_authentication
    Created on : 15-Jul-2024, 5:17:11 PM
    Author     : barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify admin</title>
        <style>
            body{
                background-color: skyblue;
            }
            h2{
                font-size: 3rem;
                text-align: center;
            }
            form{
                text-align: center;
            }
            button{
                margin-top: 50px;
                background-color: black;
                color: white;
                border-radius: 50px 50px 0 50px;
                cursor: pointer;
                font-size: 25px;
            }
            button:hover{
                background-color: white;
                color: black;
            }
        </style>
    </head>
    <body>
        <%
            String str1 = request.getParameter("admin_id");
            
            String dbDriver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:2023/";
            String dbname = "bashala";
            String username = "root";
            String password = "sobi";
            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(url + dbname, username, password);
            Statement st=con.createStatement();
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM college_admin WHERE id = ? LIMIT 1");
            pstmt.setString(1, str1);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()){
                String adminName = rs.getString("name");
                out.println("<h2>Welcome, " + adminName + "</h2>");
                out.println("<form action = \"student_update.jsp\" method=\"post\"> <button>Insert student marks</button> </form>");
//                out.println("<form action = \"view_student.jsp\" method=\"post\"> <button>View students </button> </form>");
            }
            
            else{
                out.println("<p style=\"color:red;\"> Wrong admin id </p>");
            }
            %>
    </body>
</html>
