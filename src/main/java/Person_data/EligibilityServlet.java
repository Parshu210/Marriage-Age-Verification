package Person_data;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EligibilityServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String adhar = req.getParameter("adhar");
        String country = req.getParameter("country");
        String gender = req.getParameter("gender");

        String msg;

        if (gender.equalsIgnoreCase("male")) {
            if (age > 21 && age < 60) {
                msg = "Eligible for marriage. Think one more time before taking decision!";
            } else {
                msg = "Not eligible for marriage. Stay happy! Don't be in a hurry.";
            }
        } else {
            if (age > 18 && age < 60) {
                msg = "Eligible for marriage. Think one more time before taking decision!";
            } else {
                msg = "Not eligible for marriage. Stay happy! Don't be in a hurry.";
            }
        }

        // Set attributes for JSP
        req.setAttribute("name", name);
        req.setAttribute("age", age);
        req.setAttribute("adhar", adhar);
        req.setAttribute("country", country);
        req.setAttribute("gender", gender);
        req.setAttribute("message", msg);

        // Forward to data.jsp
        RequestDispatcher rd = req.getRequestDispatcher("data.jsp");
        rd.forward(req, res);
    }
}
