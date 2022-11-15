<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <title>4</title>

        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 30px;
            }

            h1 {

                font-family: "Courier New", monospace;
                font-size: 30px
            }
        </style>       



    </head>
    <body>
        <h1>4. Construir la tabla de multiplicar seleccionando el número de un botón radio.</h1>

        <%
            String n = "0";
            boolean entro = false;
            boolean entroMensaje = false;
            if (request.getParameter("cmdEnviar") != null) {

                n = request.getParameter("rN");
                if (n != null) {
                    System.out.print("N: " + n);
                    entro = true;
                } else {
                    entroMensaje = true;

                }

            }
        %>

    <center>
        <form action=''>
            SELECCIONE UN NUMERO N<br> 
            <input type='radio' name='rN' value='4'/> 4
            <input type='radio' name='rN' value='5'/> 5  
            <input type='radio' name='rN' value='6'/> 6 
            <input type='radio' name='rN' value='7'/> 7 <br>

            <input type='submit' name='cmdEnviar' value='ENVIAR'/>
        </form>
    </center>

    <br><br>


    <%
        if (entro == true) {
            for (int i = 1; i < 13; i++) {
    %>  

    <center>
        <input type='text' value='<%=n%>' />&nbsp;&nbsp;*&nbsp;
        <input type='text' value='<%=i%>' />&nbsp;&nbsp;=&nbsp;
        <input type='text' value='<%=Integer.parseInt(n) * i%>' /><br>  
    </center>

    <%
            }
        }

        if (entroMensaje == true) {
            out.print("<br><center><input style='width: 50%;' type='text' value='DEBE SELECCIONAR UNA OPCION' /></center>");
        }
    %>

</body>
</html>
