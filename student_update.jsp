<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%@page contentType="text/html" language="java" pageEncoding="UTF-8" import="java.sql.*" %>
<html>
    <head>
        <title>Student details updation</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                background-color: skyblue;
                font-size: 15px;
            }
                form{
                position: absolute;
                top: 30%;
                left: 40%;
            }
            input{
                font-size: 20px;
            }
            input{
                border: none;
                border-radius: 20px;
            }
            input::placeholder{
                left: 12px;
                position: relative;
                font-style: italic;
            }
            input:focus{
                outline-color: whitesmoke;
            }
            button{
                font-size: 15px;
                border: none;
                background-color: black;
                color: white;
                cursor: pointer;
                border-radius: 20px 0 20px 20px;
            }
            button:hover{
                background-color: white;
                color: black;
            }
            a{
                color: white;
                text-decoration: none;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <a href="index.html"><-</a>
        <div>
            <form method="post">
                Student register no : <input name="reg_no" id="reg" type="number" autocomplete="off" placeholder="Enter student register number" required><br><br>
                Student name   :<input name="stu_name" id="name" type="text" autocomplete="off" placeholder="Enter student name" required><br><br>
                Attendance mark:<input name="atten" id="atten" type="number" autocomplete="off" placeholder="Enter attendance mark" required><br><br>
                Total mark     :<input name="mark" id="tot" type="number" autocomplete="off" placeholder="Enter total marks" required><br><br>
                Quiz mark      :<input name="quiz" id="quiz" type="number" autocomplete="off" placeholder="Enter quiz mark" required><br><br>
                Lab mark       :<input name="lab" id="lab" type="number" autocomplete="off" placeholder="Enter lab mark" required><br><br>
                <button onclick="success()">Submit</button>
            </form>
        </div>
        
        <script>
            function success(){
                var reg = document.getElementById('reg');
                var name = document.getElementById('name');
                var attendance = document.getElementById('atten');
                var total = document.getElementById('tot');
                var quiz = document.getElementById('quiz');
                var lab = document.getElementById('lab');
                
                if(reg !== null || name !== null || attendance !== null || total !== null || quiz !== null || lab !== null){
                    alert("Please insert all field!");
                }
//                else{
//                alert("Student details added successfully 👍🏻");
//            }
            }
        </script>
        
        
        <%
//        String stud_name = request.getParameter("stu_name");
//        int atten_mark = Integer.parseInt(request.getParameter("atten"));
//        int total_mark = Integer.parseInt(request.getParameter("mark"));
//        int quiz_mark = Integer.parseInt(request.getParameter("quiz"));
//        int lab_mark = Integer.parseInt(request.getParameter("lab"));
String reg = request.getParameter("reg_no");
        String stud_name = request.getParameter("stu_name");
String attenStr = request.getParameter("atten");
String totalStr = request.getParameter("mark");
String quizStr = request.getParameter("quiz");
String labStr = request.getParameter("lab");

int atten_mark = 0;
int total_mark = 0;
int quiz_mark = 0;
int lab_mark = 0;
        try{
          if (attenStr != null && !attenStr.isEmpty()) {
        atten_mark = Integer.parseInt(attenStr);
    }
    if (totalStr != null && !totalStr.isEmpty()) {
        total_mark = Integer.parseInt(totalStr);
    }
    if (quizStr != null && !quizStr.isEmpty()) {
        quiz_mark = Integer.parseInt(quizStr);
    }
    if (labStr != null && !labStr.isEmpty()) {
        lab_mark = Integer.parseInt(labStr);
    }
            String dbDriver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:2023/";
            String dbname = "bashala";
            String username = "root";
            String password = "sobi";
            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(url + dbname, username, password);
            Statement st=con.createStatement();
            int i=st.executeUpdate("insert into student_details(register_no, stu_name, attendance, marks, quiz, lab)values('"+reg+"' ,'"+stud_name+"','"+atten_mark+"', '"+ total_mark+"', '"+quiz_mark+"', '"+lab_mark+"')");
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
            }
        %>
    </body>
</html>
