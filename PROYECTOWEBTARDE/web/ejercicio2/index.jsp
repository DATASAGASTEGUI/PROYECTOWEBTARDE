<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>2</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 30px;
            }
        </style>


    </head>
    <body>
        <h1>2. Construir la tabla de multiplicar 3 etiqueta scriplets - out.print.</h1>

        <%
            for (int i = 1; i < 13; i++) {
                out.print("<center>");
                out.print("<input type='text' value='3' />&nbsp;&nbsp;*&nbsp;");
                out.print("<input type='text' value='" +  i + "' />&nbsp;&nbsp;=&nbsp;");
                out.print("<input type='text' value='" +  (3 * i) + "' /><br> ");
                out.print("</center>");
            }
        %>

    </body>
</html>