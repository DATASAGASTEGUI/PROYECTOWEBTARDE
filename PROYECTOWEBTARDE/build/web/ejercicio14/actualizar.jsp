<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="_14.OperacionesCrud"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="_14.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            OperacionesCrud crud = new OperacionesCrud("colegio");
            Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();
            TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);
            Set<String> claves = alumnos_tm.keySet();
        %>

        <h1>18. Actualizar un alumno</h1>

        <%
            String codigo = "";
            String nombre = "";
            String edad = "";
            String estatura = "";
            String foto = "";
            String mensaje = "";
            Alumno a = null;
            boolean salida = false;

            if (request.getParameter("cmdBuscar") != null) {
                codigo = request.getParameter("cboCodigo");
                a = alumnos_hm.get(codigo);
                salida = true;
            }

            if (request.getParameter("cmdActualizar") != null) {
                codigo = request.getParameter("txtCodigo");
                nombre = request.getParameter("txtNombre");
                edad = request.getParameter("txtEdad");
                estatura = request.getParameter("txtEstatura");
                foto = request.getParameter("txtFoto");
                
                Alumno alumno = new Alumno(codigo,
                                           nombre,
                                           Integer.parseInt(edad),
                                           Double.parseDouble(estatura),
                                           foto);
                if(crud.actualizarAlumno(alumno)) {
                   mensaje = "OK ACTUALIZAR";
                }else {
                   mensaje = "ERROR ACTUALIZAR";
                }
                
            }
        %>

        <!-- FORMULARIO -->
    <center>
        <form action=''>
            <select name='cboCodigo' size='1'>

                <%
                    for (String s : claves) {
                %>
                <option value='<%=s%>'><%=s%></option>
                <%
                    }
                %>
            </select>
            <input type='submit' name='cmdBuscar' value='BUSCAR' />
            <input type='submit' name='cmdActualizar' value='ACTUALIZAR' />
            <input type='text' name='txtMensaje' value='<%=mensaje%>' placeholder='MENSAJE' /><br>


            <!-- PINTAR ALUMNO ENCONTRADO -->

            <%
                if (salida == true) {
                    codigo = a.getCodigo();
                    nombre = a.getNombre();
                    edad = String.valueOf(a.getEdad());
                    estatura = String.valueOf(a.getEstatura());
                    foto = a.getFoto();
                    String ruta = request.getContextPath() + "/ejercicio14/image/" + a.getFoto();
            %>

            <input type='text' name='txtCodigo' value='<%=codigo%>' readonly />
            <input type='text' name='txtNombre' value='<%=nombre%>' />
            <input type='number' name='txtEdad' value='<%=edad%>' min='1' max='120' step='1' />
            <input type='number' name='txtEstatura' style='width: 120px' value='<%=estatura%>'  min='1' max='1.90' step='0.01' />
            <input type='text' name='txtFoto' value='<%=foto%>' placeholder='FOTO' />
            <img src='<%=ruta%>' />

            <%
                }
            %>

        </form>
    </center>




</body>
</html>
