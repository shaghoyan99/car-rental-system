package com.carrental.servlet;

import com.carrental.model.User;
import com.carrental.service.CarService;
import com.carrental.service.impl.CarServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/cars")
public class CarsServlet extends HttpServlet {

    private final CarService carService = new CarServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("authUser");
        if (user == null) {
            resp.sendRedirect("/login");
        } else {
            req.setAttribute("allCars", carService.getAllCars());
            req.getRequestDispatcher("/WEB-INF/car-list.jsp").forward(req, resp);
        }
    }
}
