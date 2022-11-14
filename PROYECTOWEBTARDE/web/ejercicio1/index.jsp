<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>1</title>
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
        <h1>1. Construir la tabla de multiplicar 3 etiqueta expresion.</h1>


        <%
            for (int i = 1; i < 13; i++) {
        %>  

    <center>
        <input type='text' value='3' />&nbsp;&nbsp;*&nbsp;
        <input type='text' value='<%=i%>' />&nbsp;&nbsp;=&nbsp;
        <input type='text' value='<%=3 * i%>' /><br>  
    </center>

    <%
        }
    %>

</body>
</html>
