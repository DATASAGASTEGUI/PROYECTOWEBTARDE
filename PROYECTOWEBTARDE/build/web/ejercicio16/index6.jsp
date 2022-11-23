<%-- 
    Document   : index6
    Created on : 23-nov-2022, 20:34:15
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>26</title>
    </head>
    <body>
        <h1>26. Resolver ejericio 20 usando Servlet</h1>



        <%
            String x = "";
            String y = "";
            String r = "";
            String a = "";
            String m = "";

            if ((m = (String) request.getAttribute("m")) != null) {
               x = (String)request.getAttribute("x");
               y = (String)request.getAttribute("y");
               r = (String)request.getAttribute("r");
               a = (String)request.getAttribute("a");
            }
            
            if(m == null) {
                m = "";
            }

        %>

        <!-- FORMULARIO -->
    <center>
        <form action='http://localhost:8081/PROYECTOWEBTARDE/Servlet6'>
            <!-- ENTRADA -->
            <input type='text' name='txtX' value='<%=x%>' placeholder='X'/>
            <input type='text' name='txtY' value='<%=y%>' placeholder='Y'/>
            <!-- SALIDA -->
            <input type='text' name='txtR' value='<%=r%>' placeholder='RADIO' disabled="" />
            <input type='text' name='txtA' value='<%=a%>' placeholder='ANGULO' disabled="" />
            <input style='width: 155px' type='text' name='txtM' value='<%=m%>' placeholder='MENSAJE' disabled="" />
            <!-- BOTON -->
            <input type='submit' name='cmdCalcular' value='CALCULAR' />
            <input type='submit' name='cmdNuevo' value='NUEVO' />
        </form>
    </center>        



</body>
</html>
