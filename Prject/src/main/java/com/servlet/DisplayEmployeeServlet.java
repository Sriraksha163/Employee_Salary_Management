package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.EmployeeDAO;
import com.model.Employee;

@WebServlet("/DisplayEmployeeServlet") // This enables routing at /DisplayEmployee
public class DisplayEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Employee> employeeList = EmployeeDAO.getAllEmployees();

            // Debug log
            for (Employee e : employeeList) {
                System.out.println("Employee: " + e.getId() + ", " + e.getName());
            }

            request.setAttribute("employeeList", employeeList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("empdisplay.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("empdisplay.jsp");
            dispatcher.forward(request, response);
        }
    }
}
