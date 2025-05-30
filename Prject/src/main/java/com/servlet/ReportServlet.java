package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        List<Employee> employees = null;

        try {
            if (action == null || action.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter!");
                return;
            }

            switch (action) {
                case "NameFilter":
                    String startsWith = request.getParameter("startsWith");
                    if (startsWith == null || startsWith.trim().isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty 'startsWith' parameter!");
                        return;
                    }
                    employees = EmployeeDAO.getEmployeesByNamePrefix(startsWith);
                    break;

                case "ServiceFilter":
                    String yearsParam = request.getParameter("years");
                    if (yearsParam == null || yearsParam.trim().isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing 'years' parameter!");
                        return;
                    }
                    int years = Integer.parseInt(yearsParam);
                    employees = EmployeeDAO.getEmployeesByServiceYears(years);
                    break;

                case "SalaryFilter":
                    String salaryParam = request.getParameter("salary");
                    if (salaryParam == null || salaryParam.trim().isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing 'salary' parameter!");
                        return;
                    }
                    double salary = Double.parseDouble(salaryParam);
                    employees = EmployeeDAO.getEmployeesBySalary(salary);
                    break;

                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter!");
                    return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("filteredEmployees", employees);

            StringBuilder redirectURL = new StringBuilder("report_result.jsp?action=")
                    .append(URLEncoder.encode(action, "UTF-8"));

            if ("NameFilter".equals(action)) {
                redirectURL.append("&startsWith=").append(URLEncoder.encode(request.getParameter("startsWith"), "UTF-8"));
            } else if ("ServiceFilter".equals(action)) {
                redirectURL.append("&years=").append(URLEncoder.encode(request.getParameter("years"), "UTF-8"));
            } else if ("SalaryFilter".equals(action)) {
                redirectURL.append("&salary=").append(URLEncoder.encode(request.getParameter("salary"), "UTF-8"));
            }

            response.sendRedirect(redirectURL.toString());

        } catch (NumberFormatException nfe) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric input!");
        } catch (Exception e) {
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(response.getWriter());
        }
    }
}
