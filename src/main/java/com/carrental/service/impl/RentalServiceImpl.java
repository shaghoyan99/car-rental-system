package com.carrental.service.impl;

import com.carrental.dao.RentalDao;
import com.carrental.dao.impl.RentalDaoImpl;
import com.carrental.dto.RentalDetails;
import com.carrental.model.Car;
import com.carrental.model.Customer;
import com.carrental.model.Rental;
import com.carrental.model.enums.CarStatus;
import com.carrental.model.enums.RentalStatus;
import com.carrental.service.CarService;
import com.carrental.service.CustomerService;
import com.carrental.service.RentalService;
import com.carrental.utill.ConnectionUtil;

import java.math.BigDecimal;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class RentalServiceImpl implements RentalService {

    private final RentalDao rentalDao = new RentalDaoImpl();
    private final CarService carService = new CarServiceImpl();
    private final CustomerService customerService = new CustomerServiceImpl();


    public void updateTotalCost(BigDecimal dailyRate, Rental rental) {
        if (rental.getStartDate() != null && rental.getEndDate() != null) {
            if (rental.getEndDate().isBefore(rental.getStartDate())) {
                throw new IllegalArgumentException("End date cannot be before start date");
            }
            long days = ChronoUnit.DAYS.between(rental.getStartDate(), rental.getEndDate()) + 1;
            rental.setTotalCost(dailyRate.multiply(BigDecimal.valueOf(days)));
        } else
            throw new IllegalArgumentException("Start date and end date must not be null");

    }

    @Override
    public void createRental(Rental rental) {
        Car carById = carService.getCarById(rental.getCarId());
        updateTotalCost(carById.getDailyRate(), rental);
        ConnectionUtil.withConnectionVoid(connection -> {
            rentalDao.save(connection, rental);
        });
    }

    @Override
    public Rental getRentalById(long id) {
        return ConnectionUtil.withConnection(connection -> {
            return rentalDao.findById(connection, id);
        });
    }

    @Override
    public List<Rental> getRentals() {
        ConnectionUtil.withConnectionVoid(rentalDao::updateFinishedRentals);
        return ConnectionUtil.withConnection(rentalDao::findAll);
    }

    @Override
    public void completeRental(long rentalId, RentalStatus status) {
        ConnectionUtil.withConnectionVoid(connection -> rentalDao.updateStatus(connection, rentalId, status));
    }

    public List<RentalDetails> getRentalDetails() {
        List<Rental> rentals = ConnectionUtil.withConnection(rentalDao::findAll);
        List<RentalDetails> rentalDetails = new ArrayList<>();
        for (Rental rent : rentals) {
            Car car = ConnectionUtil.withConnection(connection -> carService.getCarById(rent.getCarId()));
            Customer customer = ConnectionUtil.withConnection(connection -> customerService.getCarById(rent.getCustomerId()));
            rentalDetails.add(new RentalDetails(car, rent, customer));
        }

        return rentalDetails;
    }

    @Override
    public void updateRentalStatus(long rentalId, RentalStatus status) {
        ConnectionUtil.withConnectionVoid(connection -> rentalDao.updateStatus(connection, rentalId, status));
        Rental rentalById = ConnectionUtil.withConnection(connection -> rentalDao.findById(connection, rentalId));
        switch (rentalById.getRentalStatus()) {
            case ACTIVE -> carService.updateCarStatus(rentalById.getCarId(), CarStatus.RENTED);
            case CANCELED, FINISHED -> carService.updateCarStatus(rentalById.getCarId(), CarStatus.AVAILABLE);
        }
    }
}

