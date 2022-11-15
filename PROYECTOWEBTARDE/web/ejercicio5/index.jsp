<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <title>5</title>

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
        <h1>5. Construir la tabla de multiplicar seleccionando el número de un ComboBox(Lista Desplegable).</h1>

        <%
            String n = "0";
            boolean entro = false;
            boolean entroMensaje = false;
            if (request.getParameter("cmdEnviar") != null) {

                n = request.getParameter("cboN");
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
            <select name="cboN" size="1">
                <option value="4">4</option>  
                <option value="5">5</option> 
                <option value="6">6</option> 
                <option value="7">7</option> 
                <option value="8">8</option> 
            </select><br><br>

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
