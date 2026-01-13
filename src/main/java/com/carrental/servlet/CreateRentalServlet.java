package com.carrental.servlet;

import com.carrental.model.Rental;
import com.carrental.service.CarService;
import com.carrental.service.CustomerService;
import com.carrental.service.RentalService;
import com.carrental.service.impl.CarServiceImpl;
import com.carrental.service.impl.CustomerServiceImpl;
import com.carrental.service.impl.RentalServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(value = "/addRental")
public class CreateRentalServlet extends HttpServlet {

    private final RentalService rentalService = new RentalServiceImpl();
    private final CarService carService = new CarServiceImpl();
    private final CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("cars" ,carService.getAllCars());
        req.setAttribute("customers", customerService.getAllCustomers());
        req.getRequestDispatcher("rental-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Rental rental = new Rental();
        rental.setCarId(Long.parseLong(req.getParameter("carId")));
        rental.setCustomerId(Long.parseLong(req.getParameter("customerId")));
        rental.setStartDate(LocalDate.parse(req.getParameter("startDate")));
        rental.setEndDate(LocalDate.parse(req.getParameter("endDate")));
        rentalService.createRental(rental);

        resp.sendRedirect("/rentals");

    }
}
