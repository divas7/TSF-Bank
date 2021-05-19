
<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
        
        <link rel="stylesheet"href="homecss.css"type="text/css">

        
<header>
<h2><a href="index.html"class="navbar-brand"style="color: rgb(245, 243, 243);"><b><img src="THE BANK.png"alt="Home"style="width: 150px;height: 150px;"></b></a></h2>
</header>
        
        <%@ page import ="java.sql.*" %>
    <% 
        String sen=request.getParameter("sender");
        String rec=request.getParameter("receiver");
        int amount= Integer.parseInt(request.getParameter("amount"));
        try
        {
                                                                                                                                                                                                                                                                                                                                                                               
          Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","");
            PreparedStatement ps=conn.prepareStatement("update customer set balance=balance-"+amount+" where name ='"+sen+"'");
            
            PreparedStatement ps1=conn.prepareStatement("update customer set balance=balance+"+amount+" where name ='"+rec+"'");
            PreparedStatement ps2=conn.prepareStatement("insert into transfer values('"+sen+"','"+rec+"',"+amount+")");
           int d1= ps.executeUpdate();
             int d2=ps1.executeUpdate();
              int d3=ps2.executeUpdate();
              out.print("<center><b style=font-size:20 px>Congratulations!</b></center></br></br>");
              out.print("<center>");
             if(d1>0)
                 out.println("Amount deducted from sender's account");
             else
               out.print("Amount not deducted from sender's account");
             out.print("</br></br></br>");             
                     if(d2>0)
                    out.println("Amount added to receiver's acoount");
             else
                 out.print("Amount not added to receiver's acount");
                     out.print("</br></br></br>");
             if(d3>0)
                 out.println("Transaction succesfully saved in history");
             else
               out.print("There was a problem in saving transaction in history");
             out.print("</center>");
             
conn.close();
        }

                 catch(Exception e)
                 {
                     out.print("error"+e.getMessage());
                     
                 }
                 
            
            
      %>
      </br></br></br>
    <center> <form action="transfer.jsp" method="post">
          <input type="submit" value="Check balance now">
          <form action="index.html" method="post">
          <input type="submit" value="Go to home page">
          </form></center>
    
    <footer class="text-center mt-5 py-2">
<p>Made by <b>Divas Pratap Singh</b>       <br/> The Sparks Foundation.



</p>
</footer>
    
    </body>
</html>
