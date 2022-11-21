<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="_14.Alumno"%>
<%@page import="_14.OperacionesCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    OperacionesCrud crud = new OperacionesCrud("colegio");

    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();

    TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

    Set<String> claves = alumnos_tm.keySet();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>14</title>

    </head>
    <body>
        <h1>14. Buscar un alumno y mostrarlo (Lista selección simple)</h1>

        <%
            boolean salida = false;
            Alumno a = null;
            String codigo = "";
            String mensaje = "";

            if (request.getParameter("cmdBuscar") != null) {
                codigo = request.getParameter("cboCodigo");
                a = alumnos_hm.get(codigo);
                salida = true;
            }
        %>


        <%
            String oculto = "";
            if (request.getParameter("cmdEliminar") != null) {
                oculto = request.getParameter("txtOculto");
                if (crud.eliminarAlumno(oculto)) {
                    mensaje = "OK: ELIMINAR";
                    alumnos_hm = crud.getHashMapAlumno();

                    alumnos_tm = new TreeMap<>(alumnos_hm);

                    claves = alumnos_tm.keySet();

                } else {
                    mensaje = "ERROR: ELIMINAR";
                }
            }
        %>


    <center>
        <form action=''>
            <select name="cboCodigo" size="1">
                <%
                    for (String s : claves) {

                        if (s.equalsIgnoreCase(codigo)) {
                %>           
                <option selected  value='<%=s%>'><%=s%></option>    

                <%
                } else {
                %>            

                <option           value='<%=s%>'><%=s%></option>    

                <%
                        }
                    }
                %>
            </select>
            <input type='hidden' name='txtOculto' value='<%=codigo%>' />
            <input type='submit' name='cmdBuscar' value='BUSCAR' />
            <input type='submit' name='cmdEliminar' value='ELIMINAR' />
            <input type='text' name='txtMensaje' value='<%=mensaje%>' />
        </form>


        <%
            if (salida == true) {
                String ruta = request.getContextPath() + "/ejercicio11/image/" + a.getFoto();

        %>       

        <center>
            <br><br>
            <img class='redondear' src='<%=ruta%>' title='<%=a.getNombre()%>'><br><br>

            <input type='text' value='<%=a.getCodigo()%>' disabled />
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
