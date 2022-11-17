<%-- 
    Document   : index
    Created on : 16-nov-2022, 18:54:32
    Author     : RYZEN
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>11</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 100px;
            }

            .redondear {
                width: 25px;
                height: 25px;
                border: 2px solid black;
                border-radius: 50px;
            }
        </style>
    </head>
    <body>
        <h1>11. Mostrar todos los registros de una tabla en mysql usando una cajita texto</h1>

        <%
            String url = "jdbc:mysql://localhost:3306/colegio"; //Protocolo-Ip-Puerto-DB
            String usuario = "root";
            String clave = "12345678";

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(url, usuario, clave);

            if (conexion != null) {

                String query = "SELECT * FROM Alumno";
                try {
                    PreparedStatement ps = conexion.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        String codigo = rs.getString(1);
                        String nombre = rs.getString(2);
                        int edad = rs.getInt(3);
                        double estatura = rs.getDouble(4);
                        String foto = rs.getString(5);
                        String ruta = request.getContextPath() + "/ejercicio11/image/" + foto;
                        System.out.println("RUTA: " + ruta);
        %> 
    <center>
        <input type='text' value='<%=codigo%>' disabled />
        <input type='text' value='<%=nombre%>' disabled />
        <input type='text' value='<%=edad%>' disabled />
        <input type='text' value='<%=estatura%>' disabled />
        <img class='redondear' src='<%=ruta%>' title='<%=nombre%>'>
        <br>
    </center>
    <%
                }

            } catch (Exception e) {
                System.out.println("ERROR: CONEXION");
            }
        }

    %>




</body>
</html>
