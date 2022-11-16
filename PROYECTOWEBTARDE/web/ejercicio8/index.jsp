<%-- 
    Document   : index
    Created on : 16-nov-2022, 16:35:18
    Author     : RYZEN
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>8</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>8. Mostrar los años, meses y dias transcurridos a partir de una fecha de nacimiento tomados de un control date.</h1>

        <%
            String anios = "";
            String meses = "";
            String dias = "";
            String fecha = "";
            if (request.getParameter("cmdEnviar") != null) {
                try {
                    fecha = request.getParameter("txtNacimiento");

                    String[] p = fecha.split("-");

                    int anio = Integer.parseInt(p[0]);
                    int mes = Integer.parseInt(p[1]);
                    int dia = Integer.parseInt(p[2]);

                    LocalDate fnacimiento = LocalDate.of(anio, mes, dia);
                    LocalDate factual = LocalDate.now();

                    Period periodo = Period.between(fnacimiento, factual);

                    anios = periodo.getYears() + " AÑOS";
                    meses = periodo.getMonths() + " MESES";
                    dias = periodo.getDays() + " DIAS";
                } catch (Exception e) {

                }
            }
        %>
    <center>
        <form action=''>
            <label for='lblNacimiento'>SELECCIONE FECHA NACIMIENTO </label><br><br>
            <input type='date' name='txtNacimiento' value='<%=fecha%>'>
            <input type='submit' name='cmdEnviar' value='ENVIAR' /><br><br>

            <input type='text' value='<%=anios%>' disabled placeholder='AÑOS'/>
            <input type='text' value='<%=meses%>' disabled placeholder='MESES' />
            <input type='text' value='<%=dias%>' disabled placeholder='DIAS'/>
        </form>
    </center>

</body>
</html>
