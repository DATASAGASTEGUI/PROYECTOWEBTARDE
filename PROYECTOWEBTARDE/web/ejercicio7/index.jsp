<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.Year"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>7</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>7. Mostrar la fecha del sistema sepadado en cajas de texto distintas "Miercoles 16 Noviembre 2022"</h1>

        <%
            String dia = "";
            String mes = "";
            LocalDate localDate = LocalDate.now();
            String diaSemana = localDate.getDayOfWeek() + "";
            String diaNumerico = localDate.getDayOfMonth() + "";
            String meses = localDate.getMonth() + "";
            int anio = localDate.getYear();
            
            Map<String,String> diasemana_hm = new HashMap<>();
            diasemana_hm.put("MONDAY","LUNES");
            diasemana_hm.put("TUESDAY","MARTES");
            diasemana_hm.put("WEDNESDAY","MIERCOLES");
            diasemana_hm.put("THURSDAY","JUEVES");
            diasemana_hm.put("FRIDAY","VIERNES");
            diasemana_hm.put("SATURDAY","SABADO");
            diasemana_hm.put("SUNDAY","DOMINGO");
            
            dia = diasemana_hm.get(diaSemana);
            /*
            switch (diaSemana) {

                case "MONDAY":
                    dia = "LUNES";
                    break;
                case "TUESDAY":
                    dia = "MARTES";
                    break;
                case "WEDNESDAY":
                    dia = "MIERCOLES";
                    break;
                case "THURSDAY":
                    dia = "JUEVES";
                    break;
                case "FRIDAY":
                    dia = "VIERNES";
                    break;
                case "SATURDAY":
                    dia = "SABADO";
                    break;
                case "SUNDAY":
                    dia = "DOMINGO";

            }
*/
            
            Map<String,String> meses_hm = new HashMap<>();
            meses_hm.put("JANUARY","ENERO");
            meses_hm.put("FEBRUARY","FEBRERO");
            meses_hm.put("MARCH","MARZO");
            meses_hm.put("APRIL","ABRIL");
            meses_hm.put("MAY","MAYO");
            meses_hm.put("JUNE","JUNIO");
            meses_hm.put("JULY","JULIO");
            meses_hm.put("AUGUST","AGOSTO");
            meses_hm.put("SEPTEMBER","SEPTIEMBRE");
            meses_hm.put("OCTOBER","OCTUBRE");
            meses_hm.put("NOVEMBER","NOVIEMBRE");
            meses_hm.put("DECEMBER","DICIEMBRE");
            
            mes = meses_hm.get(meses);
 
            /*
            switch (meses) {

                case "JANUARY":
                    mes = "ENERO";
                    break;
                case "FEBRUARY":
                    mes = "MARTES";
                    break;
                case "MARCH":
                    mes = "MARZO";
                    break;
                case "APRIL":
                    mes = "ABRIL";
                    break;
                case "MAY":
                    mes = "MAYO";
                    break;
                case "JUNE":
                    mes = "JUNIO";
                    break;
                case "JULY":
                    mes = "JULIO";
                    break;
                case "AUGUST":
                    mes = "AGOSTO";
                    break;
                case "SEPTEMBER":
                    mes = "SEPTIEMBRE";
                    break;
                case "OCTOBER":
                    mes = "OCTOBER";
                    break;
                case "NOVEMBER":
                    mes = "NOVIEMBRE";
                    break;
                case "DECEMBER":
                    mes = "DICIEMBRE";
                    break;

            }
*/
        %>

    <center><h2>Dia de la semana y fecha en Cajas</h2></center><br><br>
    <center>
        <input type='text' value='<%=dia%>' disabled />
        <input type='text' value= '<%=diaNumerico%>' disabled />
        <input type='text' value='<%=mes%>' disabled />
        <input type='text' value='<%=anio%>' disabled />
    </center>

</body>
</html>
