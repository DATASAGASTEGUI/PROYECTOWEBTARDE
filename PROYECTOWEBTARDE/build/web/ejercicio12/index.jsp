<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>12</title>
        <style>

            .redondear {
                width: 40px;
                height: 40px;
                border: 2px solid black;
                border-radius: 80px;
            }
            table, tr, th, td{
                border: 3px solid graytext;
                font-family:"Comic Sans MS";
            }
            #cabecera {
                background-color: #F7F171;
                font-weight: bold;
            }

            .codigo {
                background-color: #A2E4FB;
            }
        </style>
    </head>
    <body>
        <h1>12. Mostrar todos los registros de una tabla en mysql usando table</h1>



    <center>
        <table>
            <tr><!--- mirar apuntes--->
                <th id="cabecera">Código</th>
                <th id ="cabecera">Nombre</th>    
                <th id ="cabecera">Edad</th>
                <th id ="cabecera">Estatura</th>
                <th id="cabecera">Fotografía</th><br><br>
            </tr>
            <%
                String url = "jdbc:mysql://localhost:3306/colegio";
                String usuario = "root";
                String clave = "12345678";
                int contador = 0;
                String ruta = "";

                //para trabajar en web necesitamos registrar la clase
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection(url, usuario, clave);

                if (conexion != null) {

                    String query = "SELECT * FROM alumno;";
                    try {
                        PreparedStatement ps = conexion.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {

                            String codigo = rs.getString(1);
                            String nombre = rs.getString(2);
                            int edad = rs.getInt(3);
                            double estatura = rs.getDouble(4);
                            String foto = rs.getString(5);
                            ruta = request.getContextPath() + "/ejercicio12/image/" + foto;

            %>

            <tr>
                <td style="text-align: center" class ="codigo"><%=codigo%></td>
                <td style="text-align: center" class ="codigo"><%=nombre%></td>
                <td style="text-align: center" class="codigo"><%=edad%></td>
                <td style="text-align: center" class ="codigo"><%=estatura%></td>
                <td style="text-align: center" class ="codigo"><img class ='redondear' src='<%=ruta%>' /></td>
            </tr>
            
            <%                 }

                    } catch (Exception e) {
                        out.print("ERROR: NO SE HA PODIDO HACER LA CONSULTA");
                    }
                } else {
                    out.print("ERROR DE CONEXION");
                }


            %>

        </table>

    </center>
</body>
</html>
