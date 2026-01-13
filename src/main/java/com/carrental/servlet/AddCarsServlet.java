package com.carrental.servlet;

import com.carrental.model.Car;
import com.carrental.service.CarService;
import com.carrental.service.impl.CarServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(value = "/addCar")
public class AddCarsServlet extends HttpServlet {

    private final CarService carService = new CarServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("car-create.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Car car = new Car();
        car.setBrand(req.getParameter("brand"));
        car.setModel(req.getParameter("model"));
        car.setYear(Integer.parseInt(req.getParameter("year")));
        car.setDailyRate(new BigDecimal(req.getParameter("daily")));
        carService.addCar(car);
        resp.sendRedirect("/cars");
    }
}
