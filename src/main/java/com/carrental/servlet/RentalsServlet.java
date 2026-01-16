package com.carrental.servlet;

import com.carrental.model.User;
import com.carrental.service.RentalService;
import com.carrental.service.impl.RentalServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/rentals")
public class RentalsServlet extends HttpServlet {

    private final RentalService rentalService = new RentalServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("authUser");
        if (user == null) {
            resp.sendRedirect("/login");
        } else {
            req.setAttribute("rentals", rentalService.getRentalDetails());
            req.getRequestDispatcher("/WEB-INF/rental-list.jsp").forward(req, resp);
        }
    }
}