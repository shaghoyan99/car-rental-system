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
import java.util.List;

@WebServlet(value = "/cars")
public class CarsServlet extends HttpServlet {

    private final CarService carService = new CarServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> allCars = carService.getAllCars();
        req.setAttribute("allCars", allCars);
        req.getRequestDispatcher("car-list.jsp").forward(req, resp);
    }
}
