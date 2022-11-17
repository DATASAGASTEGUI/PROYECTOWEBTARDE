<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="_14.Alumno"%>
<%@page import="_14.OperacionesCrud"%>
<%
    OperacionesCrud crud = new OperacionesCrud("colegio");
    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();
    Set<String> claves = alumnos_hm.keySet();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>14</title>
    </head>
    <body>
        <h1>14. Buscar un alumno y mostrarlo (Lista selección simple)</h1>

    <center>
        <select name="cboCodigo" size="1">

            <%
                for (String s : claves) {
            %>

            <option value='<%=s%>'><%=s%></option>  

            <%
                }
            %>

        </select>
    </center>

</body>
</html>
