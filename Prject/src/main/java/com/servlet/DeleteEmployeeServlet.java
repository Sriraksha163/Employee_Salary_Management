package com.servlet;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import com.dao.EmployeeDAO;
import com.model.Employee;

// Servlet mapped to URL /DeleteEmployee
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    // Handles POST requests (from form submission)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";

        try {
            // Get employee number from form input
            int empno = Integer.parseInt(request.getParameter("empno"));

            // Check if employee exists
            Employee emp = EmployeeDAO.getEmployeeById(empno);
            if (emp == null) {
                message = "Employee with ID " + empno + " does not exist. Cannot delete.";
            } else {
                // Proceed with deletion
                EmployeeDAO.deleteEmployee(empno);
                message = "Employee with ID " + empno + " deleted successfully.";
            }

        } catch (NumberFormatException e) {
            message = "Invalid employee number format!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error deleting employee: " + e.getMessage();
        }

        // Set feedback message for JSP
        request.setAttribute("message", message);

        // Fetch updated employee list to display after deletion
        try {
            List<Employee> list = EmployeeDAO.getAllEmployees();
            request.setAttribute("employeeList", list);
        } catch (Exception e) {
            request.setAttribute("message", "Error fetching employee list: " + e.getMessage());
        }

        // Forward to JSP for UI response
        RequestDispatcher rd = request.getRequestDispatcher("empdelete.jsp");
        rd.forward(request, response);
    }

    // Optional: handles GET requests gracefully (e.g., if user accesses URL directly)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("empdelete.jsp"); // or show a message
    }
}
