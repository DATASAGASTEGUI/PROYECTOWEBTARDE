<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>20</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 60px;
            }
        </style>
    </head>
    <body>
        <h1>20. Convertir Coordenadas Cartesianas a Polares</h1>
        <%
            String x = "";
            String y = "";
            String r = "";
            String a = "";
            String m = "";

            if (request.getParameter("cmdCalcular") != null) {
                try {
                    //ENTRADA
                    x = request.getParameter("txtX");
                    y = request.getParameter("txtY");
                    //PROCESO
                    double[] res = convertirCatersianaToPolar(Double.parseDouble(x),
                            Double.parseDouble(y));
                    //SALIDA
                    r = res[0] + "";
                    a = res[1] + "";
                    m = "OK";
                } catch (Exception e) {
                    m = "ENTRADA INCORRECTA";
                }
            }
        %>

        <!-- FORMULARIO -->
    <center>
        <form action=''>
            <!-- ENTRADA -->
            <input type='text' name='txtX' value='<%=x%>' placeholder='X'/>
            <input type='text' name='txtY' value='<%=y%>' placeholder='Y'/>
            <!-- SALIDA -->
            <input type='text' name='txtR' value='<%=r%>' placeholder='RADIO' disabled="" />
            <input type='text' name='txtA' value='<%=a%>' placeholder='ANGULO' disabled="" />
            <input style='width: 155px' type='text' name='txtM' value='<%=m%>' placeholder='MENSAJE' disabled="" />
            <!-- BOTON -->
            <input type='submit' name='cmdCalcular' value='CALCULAR' />
            <input type='submit' name='cmdNuevo' value='NUEVO' />
        </form>
    </center>

</body>
</html>

<!-- METODOS -->
<%!
    public double[] convertirCatersianaToPolar(double x, double y) {
        double[] res = new double[2]; //Radio y Angulo
        double radio = Math.sqrt(x * x + y * y);
        double angulo = Math.atan(y / x) * 180 / Math.PI; //Sexagesimal
        res[0] = redondear2decimales(radio);
        res[1] = redondear2decimales(angulo);
        return res;
    }

    public double redondear2decimales(double x) {
        double y = (int) Math.ceil(x * 100.0) / 100.0;
        return y;
    }
%>