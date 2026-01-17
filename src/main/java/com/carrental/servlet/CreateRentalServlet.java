package com.carrental.servlet;

import com.carrental.model.Rental;
import com.carrental.model.enums.CarStatus;
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
import java.time.format.DateTimeParseException;

@WebServlet(value = "/addRental")
public class CreateRentalServlet extends HttpServlet {

    private final RentalService rentalService = new RentalServiceImpl();
    private final CarService carService = new CarServiceImpl();
    private final CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("cars", carService.getAvailableCars());
        req.setAttribute("customers", customerService.getAllCustomers());
        req.getRequestDispatcher("/WEB-INF/rental-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Rental rental = new Rental();
        try {
            String carIdStr = req.getParameter("carId");
            String customerIdStr = req.getParameter("customerId");
            String startStr = req.getParameter("startDate");
            String endStr = req.getParameter("endDate");
            rental.setCarId(Long.parseLong(carIdStr));
            rental.setCustomerId(Long.parseLong(customerIdStr));
            LocalDate startDate = LocalDate.parse(startStr);
            LocalDate endDate = LocalDate.parse(endStr);

            LocalDate today = LocalDate.now();

            if (startDate.isBefore(today)) {
                req.setAttribute("message", "Start date must be today or later");
                req.setAttribute("cars", carService.getAvailableCars());
                req.setAttribute("customers", customerService.getAllCustomers());
                req.getRequestDispatcher("/WEB-INF/rental-create.jsp").forward(req, resp);
                return;
            }

            if (endDate.isBefore(startDate)) {
                req.setAttribute("message", "End date cannot be before start date");
                req.setAttribute("cars", carService.getAvailableCars());
                req.setAttribute("customers", customerService.getAllCustomers());
                req.getRequestDispatcher("/WEB-INF/rental-create.jsp").forward(req, resp);
                return;
            }
            rental.setStartDate(startDate);
            rental.setEndDate(endDate);
        } catch (NumberFormatException e) {
            req.setAttribute("message", "Invalid numeric values for car or customer");
            req.setAttribute("cars", carService.getAvailableCars());
            req.setAttribute("customers", customerService.getAllCustomers());
            req.getRequestDispatcher("/WEB-INF/rental-create.jsp").forward(req, resp);
            return;
        } catch (DateTimeParseException e) {
            req.setAttribute("message", "Invalid date format. Use YYYY-MM-DD");
            req.setAttribute("cars", carService.getAvailableCars());
            req.setAttribute("customers", customerService.getAllCustomers());
            req.getRequestDispatcher("/WEB-INF/rental-create.jsp").forward(req, resp);
            return;
        }


        rentalService.createRental(rental);
        carService.updateCarStatus(rental.getCarId(), CarStatus.RENTED);
        resp.sendRedirect(req.getContextPath() + "/rentals");

    }
}
