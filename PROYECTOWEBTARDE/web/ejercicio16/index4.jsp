<%-- 
    Document   : index4
    Created on : 23-nov-2022, 18:19:58
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>24</title>
    </head>
    <body>
        <h1>24. Unificar los botones del ejercicio 23</h1>

    <center>
        <form action='http://localhost:8081/PROYECTOWEBTARDE/Servlet4'>
            <input type='text' name='txtNumero' value='' placeholder='NUMERO' />

            <input type='submit' name='cmdOperacion'     value='RAIZ' />
            <input type='submit' name='cmdOperacion' value='CUADRADO' />
            <input type='submit' name='cmdOperacion'   value='CUBICO' />

        </form>
    </center>        



</body>
</html>
