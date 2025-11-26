package Person_data;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidationServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String name = req.getParameter("name");
        String ageStr = req.getParameter("age");
        String adhar = req.getParameter("adhar");
        String country = req.getParameter("country");
        String gender = req.getParameter("gender");

        boolean isValid = true;
        String errorMsg = "";

        // Validation rules
        if (name == null || name.trim().isEmpty()) {
            isValid = false;
            errorMsg += "Name cannot be empty.<br>";
        }
        if (adhar == null || adhar.length() != 12 || adhar.equals("000000000000")) {
            isValid = false;
            errorMsg += "Aadhar number must be 12 digits and not zero.<br>";
        }
        if (ageStr == null || ageStr.trim().isEmpty()) {
            isValid = false;
            errorMsg += "Age cannot be empty.<br>";
        }

        if (isValid) {
            // Forward to eligibility check
            RequestDispatcher rd = req.getRequestDispatcher("EligibilityServlet");
            rd.forward(req, res);
        } else {
            out.println("<h3 style='color:red'>Validation Failed:</h3>");
            out.println(errorMsg);
            RequestDispatcher rd = req.getRequestDispatcher("person.html");
            rd.include(req, res);
        }
    }
}



//
//
//
//<%@ page language="java" contentType="text/html; charset=UTF-8"
//pageEncoding="UTF-8"%>
//<!DOCTYPE html>
//<html>
//<head><title>Marriage Eligibility Result</title></head>
//<body style="font-family: Arial; color: red;">
//<h2>Valid User Data</h2>
//<p>Name: <%= request.getAttribute("name") %></p>
//<p>Age: <%= request.getAttribute("age") %></p>
//<p>Country Name: <%= request.getAttribute("country") %></p>
//<p>Adhar Number: <%= request.getAttribute("adhar") %></p>
//
//<%
//    String gender = (String)request.getAttribute("gender");
//    String name = (String)request.getAttribute("name");
//    String message = (String)request.getAttribute("message");
//%>
//
//<h3>
//    <% if(gender.equalsIgnoreCase("male")) { %>
//        Mr. <%= name %> — <%= message %>
//    <% } else { %>
//        Ms. <%= name %> — <%= message %>
//    <% } %>
//</h3>
//</body>
//</html>