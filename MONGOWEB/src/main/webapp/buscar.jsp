<%@page import="misrc.Alumno"%>
<%@page import="misrc.OperacionesCrud"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    OperacionesCrud crud = new OperacionesCrud(2);

    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno(2);

    TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

    Set<String> claves = alumnos_tm.keySet();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BUSCAR</title>

    </head>
    <body>
    <center><h1>BUSCAR</h1></center>

        <%
            boolean salida = false;
            Alumno a = null;
            if (request.getParameter("cmdSeleccionar") != null) {
                String codigo = request.getParameter("cboCodigo");
                a = alumnos_hm.get(codigo);
                salida = true;
            }
        %>




    <center>
        <form action=''>
            <select name="cboCodigo" size="1">
                <%                    for (String s : claves) {
                %>
                <option value='<%=s%>'><%=s%></option>  
                <%
                    }
                %>
            </select><br><br>
            <input type='submit' name='cmdSeleccionar' value='SELECCIONAR' />
        </form>


        <%
            if (salida == true) {
                String ruta = request.getContextPath() + "/image/" + a.getFoto();

        %>       

        <center>
            <br><br>
            <img class='redondear' src='<%=ruta%>' title='<%=a.getNombre()%>'><br><br>

            <input type='text' value='<%=a.getIdAlumno()%>' disabled />
            <input type='text' value='<%=a.getNombre()%>' disabled />
            <input type='text' value='<%=a.getEdad()%>' disabled />
            <input type='text' value='<%=a.getEstatura()%>' disabled />

        </center>

        <%
            }
        %>
    </center>
</body>
</html>