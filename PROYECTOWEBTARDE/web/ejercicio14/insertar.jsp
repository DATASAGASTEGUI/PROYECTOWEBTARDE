<%-- 
    Document   : insertar
    Created on : 21-nov-2022, 16:25:23
    Author     : RYZEN
--%>

<%@page import="_14.OperacionesCrud"%>
<%@page import="_14.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>16</title>
    </head>
    <body>
    <center><h1>INSERTAR</h1></center>



    <%
        OperacionesCrud crud = new OperacionesCrud("colegio");
        
        String codigo = crud.getCodigo();
        
        String nombre = "";
        String edad = "";
        String estatura = "";
        String foto = "";
        String mensaje = "";
        if (request.getParameter("cmdInsertar") != null) {

            codigo = request.getParameter("txtCodigo");
            nombre = request.getParameter("txtNombre");
            edad = request.getParameter("txtEdad");
            estatura = request.getParameter("txtEstatura");
            foto = request.getParameter("txtFoto");

            Alumno a = new Alumno(codigo,
                    nombre,
                    Integer.parseInt(edad),
                    Double.parseDouble(estatura),
                    foto);


            if (crud.insertarAlumno(a)) {
                mensaje = "OK: INSERTAR";
            } else {
                mensaje = "ERROR: INSERTAR";
            }
        }
    %>
    <center>
        <form action=''>
            <input style='font-weight: bold;' type='text' name='txtCodigo' value='<%=codigo%>' placeholder='CODIGO' readonly />
            <input type='text' name='txtNombre' value='<%=nombre%>' placeholder='NOMBRE'/>
            <input type='number' name='txtEdad' value='<%=edad%>' min='1' max='120' step='1' placeholder='EDAD' />
            <input type='number' name='txtEstatura' style='width: 120px' value='<%=estatura%>'  min='1' max='1.90' step='0.01' placeholder='ESTATURA' />
            <input type='text' name='txtFoto' value='<%=foto%>' placeholder='FOTO' />
            <input type='text' name='txtMensaje' value='<%=mensaje%>' placeholder='MENSAJE' disabled />
            <input type='submit' name='cmdInsertar' value='INSERTAR' />
            <input type='submit' name='cmdNuevo' value='NUEVO' />
        </form>
    </center>





</body>
</html>
