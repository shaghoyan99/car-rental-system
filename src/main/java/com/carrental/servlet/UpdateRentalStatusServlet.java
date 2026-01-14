package com.carrental.servlet;

import com.carrental.model.enums.RentalStatus;
import com.carrental.service.RentalService;
import com.carrental.service.impl.RentalServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/updateRentalStatus")
public class UpdateRentalStatusServlet extends HttpServlet {

    private final RentalService rentalService = new RentalServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("rentalId"));
        RentalStatus status = RentalStatus.valueOf(request.getParameter("status"));
        rentalService.updateRentalStatus(id, status);
        response.sendRedirect("/rentals");
    }
}
