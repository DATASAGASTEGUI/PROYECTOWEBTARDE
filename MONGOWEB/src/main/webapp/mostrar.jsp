<%-- 
    Document   : mostrar
    Created on : 25-nov-2022, 17:21:04
    Author     : RYZEN
--%>

<%@page import="java.util.Collection"%>
<%@page import="java.util.Map"%>
<%@page import="misrc.Alumno"%>
<%@page import="misrc.OperacionesCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MOSTRAR</title>
    </head>
    <body>
    <center><h1>MOSTRAR</h1></center>
        <%
            OperacionesCrud crud = new OperacionesCrud(2);
            Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno(2);
            Collection coleccion = alumnos_hm.values();
            for (Object o : coleccion) {
                Alumno a = (Alumno) o;
                String ruta = request.getContextPath() + "/image/" + a.getFoto();
        %>       
    <center>
        <input type="text" value='<%=a.getIdAlumno()%>' />
        <input type="text" value='<%=a.getNombre()%>' />
        <input type="text" value='<%=a.getEdad()%>' />
        <input type="text" value='<%=a.getEstatura()%>' />
        <img src='<%=ruta%>' />
    </center>
    <%
        }
    %>
</body>
</html>
