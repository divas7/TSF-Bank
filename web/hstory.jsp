<%-- 
    Document   : hstory
    Created on : 18 May, 2021, 4:38:23 PM
    Author     : Divas Pratap singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            th 
        {
        font-size:50px;
       
     }
     td
     {
        font-size:40px;  
     }
        </style>
    </head>
    <body>
        
        <link rel="stylesheet"href="homecss.css"type="text/css">

        
<header>
<h2><a href="index.html"class="navbar-brand"style="color: rgb(245, 243, 243);"><b><img src="THE BANK.png"alt="Home"style="width: 150px;height: 150px;"></b></a></h2>
</header>
        
         <h1> <center><u>TRANSACTION HISTORY</u></center></h1>
         <%@ page import ="java.sql.*" %>
   
     <% 
          try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","");
            Statement smt = conn.createStatement();
            ResultSet rs = smt.executeQuery("select * from transfer");
            
          out.print("<center><table border=1 bgcolor=yellow>");
          out.print("<tr><b> <th>Sender</th> <th> Receiver </th> <th> Amount</th> </b></tr>");
         while (rs.next())
          {
             String sen=rs.getString(1);
           String rec= rs.getString(2);
          
         int amount=rs.getInt(3);
         out.print("<tr><b><td>"+sen+"</td><td>"+rec+"</td><td>"+amount+"</td></b></tr>"); 
         
         
         }
        out.print("</table></center>");
          conn.close();
          }
          catch(Exception e)
           { 
           out.print ("error "+e);
          
           }
                           
          %>
          </br></br></br>
    <center> <form action="index.html" method="post">
            <input type="submit" value="Go to home page"></center>


    <footer class="text-center mt-5 py-2">
<p>Made by <b>Divas Pratap Singh</b>       <br/> The Sparks Foundation.



</p>
</footer>
</body>

</html>
