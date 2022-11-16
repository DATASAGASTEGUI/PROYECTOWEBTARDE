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
        <title>9</title>
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
        <h1>9. Hacer una calculadora con 4 botones suma, resta, multiplicación y división.</h1>

        <%
            String n1 = "";
            String n2 = "";
            String r = "";
            try {

                if (request.getParameter("cmdSumar") != null) {
                    n1 = request.getParameter("txtN1");
                    n2 = request.getParameter("txtN2");
                    double s = Double.parseDouble(n1) + Double.parseDouble(n2);
                    r = s + "";
                }

                if (request.getParameter("cmdRestar") != null) {
                    n1 = request.getParameter("txtN1");
                    n2 = request.getParameter("txtN2");
                    double s = Double.parseDouble(n1) - Double.parseDouble(n2);
                    r = s + "";
                }

                if (request.getParameter("cmdDividir") != null) {
                    n1 = request.getParameter("txtN1");
                    n2 = request.getParameter("txtN2");
                    double s = Double.parseDouble(n1) / Double.parseDouble(n2);
                    r = s + "";
                }

                if (request.getParameter("cmdMultiplicar") != null) {
                    n1 = request.getParameter("txtN1");
                    n2 = request.getParameter("txtN2");
                    double s = Double.parseDouble(n1) * Double.parseDouble(n2);
                    r = s + "";
                }
            } catch (Exception e) {

            }

        %>


    <center>
        <form action=''>
            <input type='text' name='txtN1' value='<%=n1%>' placeholder='N1' />
            <input type='text' name='txtN2' value='<%=n2%>' placeholder='N2'/>
            <input type='text' name='txtR' value='<%=r%>' placeholder='R' disabled/>
            <input type='submit' name='cmdSumar' value='+' />
            <input type='submit' name='cmdRestar' value='-' />
            <input type='submit' name='cmdDividir' value='/' />
            <input type='submit' name='cmdMultiplicar' value='*' />

        </form>
    </center>

</body>
</html>
