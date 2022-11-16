<%-- 
    Document   : index
    Created on : 16-nov-2022, 17:48:05
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>10</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 40px;
            }
        </style>
    </head>
    <body>
        <h1>10. Hacer una calculadora con 4 botones suma, resta, multiplicación y división (VERSION MEJORADA)</h1>

        <%
            String n1 = "";
            String n2 = "";
            String r = "";
            String operador = "";
            double s = 0;
            try {
                if ((operador = request.getParameter("cmdCalcular")) != null) {
                    n1 = request.getParameter("txtN1");
                    n2 = request.getParameter("txtN2");
                    switch (operador) {
                        case "+":
                            s = Double.parseDouble(n1) + Double.parseDouble(n2);
                            break;
                        case "-":
                            s = Double.parseDouble(n1) - Double.parseDouble(n2);
                            break;
                        case "*":
                            s = Double.parseDouble(n1) * Double.parseDouble(n2);
                            break;
                        case "/":
                            s = Double.parseDouble(n1) / Double.parseDouble(n2);
                            break;
                    }
                    r = s + "";
                }
            } catch (Exception e) {
                 n1 = n2 = r = "";
            }
        %>

    <center>
        <form action=''>
            <input type='text' name='txtN1' value='<%=n1%>' placeholder='N1' />
            <input type='text' name='txtN2' value='<%=n2%>' placeholder='N2'/>
            <input type='text' name='txtR' value='<%=r%>' placeholder='R' disabled/>
            <input type='submit' name='cmdCalcular' value='+' />
            <input type='submit' name='cmdCalcular' value='-' />
            <input type='submit' name='cmdCalcular' value='/' />
            <input type='submit' name='cmdCalcular' value='*' />

        </form>
    </center>

</body>
</html>
