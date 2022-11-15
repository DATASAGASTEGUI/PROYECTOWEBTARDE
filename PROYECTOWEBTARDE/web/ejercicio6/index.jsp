<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>6</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }
        </style>
    </head>
    <body>
        <h1>6. Traducir ingles-español usando un diccionario(hashmap)</h1>

        <%
            String ingles = "";
            String spanish = "";
            if (request.getParameter("cmdEnviar") != null) {
                ingles = request.getParameter("txtIngles");
                spanish = diccionario(ingles.toLowerCase());
                if(spanish == null) {
                    spanish = "NO ESTA REGISTRADO";
                }
            }
        %>
    <center>
        <form action=''>
            <input type='text' name='txtIngles' value='<%=ingles%>' placeholder='INGLES'/>
            <input type='text' name='txtSpanish' value='<%=spanish%>' placeholder='ESPAÑOL' disabled />
            <input type='submit' name='cmdEnviar' value='ENVIAR' />
        </form>
    </center>
</body>
</html>

<%!
    public String diccionario(String ingles) {
        String spanish = "";
        Map<String, String> diccionario_hm = new HashMap<>();
        diccionario_hm.put("tool", "herramienta");
        diccionario_hm.put("window", "ventana");
        diccionario_hm.put("one", "uno");
        diccionario_hm.put("file", "archivo");
        diccionario_hm.put("edit", "editar");

        spanish = diccionario_hm.get(ingles);

        return spanish;
    }
%>
