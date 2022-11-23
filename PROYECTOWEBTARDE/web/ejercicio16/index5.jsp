<%-- 
    Document   : index5
    Created on : 23-nov-2022, 18:54:54
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>25</title>
    </head>
    <body>
        <h1>25. Servlet envía los resultados al jsp que lo llama</h1>


        <%
            // ENTRADA
            String numero1 = "";
            // SALIDA
            String resultado1 = "";
            if((resultado1 = (String)request.getAttribute("resultado")) != null) {
               numero1 = (String)request.getAttribute("numero"); 
            }
        %>



    <center>
        <form action='http://localhost:8081/PROYECTOWEBTARDE/Servlet5'>

            <!-- ENTRADA -->
            <input type='text' name='txtNumero' value='<%=numero1%>' placeholder='NUMERO' />
            <!-- SALIDA -->
            <input type='text' name='txtResultado' value='<%=resultado1%>' placeholder='RESULTADO' disabled />
            <!-- PROCESO -->
            <input type='submit' name='cmdOperacion' value='RAIZ' />
            <input type='submit' name='cmdOperacion' value='CUADRADO' />
            <input type='submit' name='cmdOperacion' value='CUBICO' />

        </form>
    </center>     





</body>
</html>
