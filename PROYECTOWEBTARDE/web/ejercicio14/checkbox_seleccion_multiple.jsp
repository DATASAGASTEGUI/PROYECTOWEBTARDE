<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
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
        <title>19</title>

    </head>
    <body>
        <h1>19. Buscar varios alumnos y mostrarlo (checkbox selección múltiple)</h1>

        <%
            boolean salida = false;
            Map<String, Alumno> alumnos1_hm = new HashMap<>();
            if (request.getParameter("cmdSeleccionar") != null) {

                String[] codigo = request.getParameterValues("chkCodigo");

                for (String k : codigo) {
                    Alumno a1 = alumnos_hm.get(k);
                    alumnos1_hm.put(k, a1);
                }

                salida = true;
            }
        %>

    <center>
        <form action=''>
            <%                    for (String s : claves) {
            %>
            <input type="checkbox" name="chkCodigo" value="<%=s%>" /> <%=s%>
            <%
                }
            %>
            <input type='submit' name='cmdSeleccionar' value='SELECCIONAR' />
        </form>
        <%
            if (salida == true) {

                Collection coleccion = alumnos1_hm.values();

                for (Object o : coleccion) {
                    Alumno a = (Alumno) o;

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
            }
        %>






    </center>







</body>
</html>
