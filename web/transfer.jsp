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


    <center> <h1><u>CUSTOMER'S DETAILS</u></h1></center>
          <%@ page import ="java.sql.*" %>
   
     <% 
          try{
          Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","");
            Statement smt = conn.createStatement();
            ResultSet rs = smt.executeQuery("select * from customer");
            
          out.print("<center><table border=1 bgcolor=yellow>");
          out.print("<tr> <th>ID</th> <th>Name</th> <th> Email </th> <th> Balance </th>  </tr>");
         while (rs.next())
          {
             int id=rs.getInt(1);
           String na= rs.getString(2);
          String email=rs.getString(3);
         int bal=rs.getInt(4);
         out.print("<tr><td>"+id+"</td><td>"+na+"</td><td>"+email+"</td><td>"+ bal+"</td></tr>"); 
         
         
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
          <center><form action= "transaction.html"> 
              <input type="submit" value="Transfer money"> </form> 
          <form action="index.html" method="post">
              <input type="submit" value="Go to home page"></center>
          
          <footer class="text-center mt-5 py-2">
<p>Made by <b>Divas Pratap Singh</b>       <br/> The Sparks Foundation.



</p>
</footer>
 </body>
</html>