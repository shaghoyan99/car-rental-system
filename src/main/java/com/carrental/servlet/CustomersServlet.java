package com.carrental.servlet;

import com.carrental.model.User;
import com.carrental.service.CustomerService;
import com.carrental.service.impl.CustomerServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/customers")
public class CustomersServlet extends HttpServlet {

    CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("authUser");
        if (user == null) {
            resp.sendRedirect("/login");
        } else {
            req.setAttribute("customers", customerService.getAllCustomers());
            req.getRequestDispatcher("/WEB-INF/customer-list.jsp").forward(req, resp);
        }
    }
}
