<%-- 
    Document   : index
    Created on : 16-nov-2022, 16:35:18
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>8</title>
    </head>
    <body>
        <h1>8. MOSTRAR LOS AÑOS, MESES Y DIAS TRANSCURRIDOS A PARTIR DE UNA FECHA DE NACIMIENTO TOMADOS DE UN CONTROL DATE.</h1>

        <%
             
             if(request.getParameter("cmdEnviar") != null) {
                String fecha = request.getParameter("txtNacimiento");
                out.println(fecha);
             }

        %>





    <center>
        <form action=''>
            <label for='lblNacimiento'>Seleccione fecha nacimiento? </label>
            <input type='date' name='txtNacimiento'>
            <input type='submit' name='cmdEnviar' value='ENVIAR' />
        </form>
    </center>

</body>
</html>
