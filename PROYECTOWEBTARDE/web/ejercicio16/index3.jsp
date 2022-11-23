<%-- 
    Document   : index3
    Created on : 23-nov-2022, 17:38:16
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>23</title>
    </head>
    <body>
        <h1>23. Desde un jsp enviar información a un servlet</h1>

    <center>
        <form action='http://localhost:8081/PROYECTOWEBTARDE/Servlet3'>
            <input type='text' name='txtNumero' value='' placeholder='NUMERO' />
            
            <input type='submit' name='cmdRaiz'     value='RAIZ' />
            <input type='submit' name='cmdCuadrado' value='CUADRADO' />
            <input type='submit' name='cmdCubico'   value='CUBICO' />
            
        </form>
    </center>

</body>
</html>
