package mi_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet6 extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        RequestDispatcher rd = null;

        try (PrintWriter out = response.getWriter()) {

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

                    request.setAttribute("x", x);
                    request.setAttribute("y", y);
                    request.setAttribute("r", r);
                    request.setAttribute("a", a);
                    request.setAttribute("m", m);

                    rd = request.getRequestDispatcher("ejercicio16/index6.jsp");
                    rd.include(request, response);

                } catch (Exception e) {
                    m = "ENTRADA INCORRECTA";
                }

            }

            if (request.getParameter("cmdNuevo") != null) {
                rd = request.getRequestDispatcher("ejercicio16/index6.jsp");
                rd.include(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
