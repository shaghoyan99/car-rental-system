package com.carrental.service.impl;

import com.carrental.config.DSProvider;
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

import java.math.BigDecimal;
import java.sql.Connection;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

public class RentalServiceImpl implements RentalService {

    private final RentalDao rentalDao = new RentalDaoImpl();
    private final CarService carService = new CarServiceImpl();
    private final CustomerService customerService = new CustomerServiceImpl();

    private <T> T withConnection(Function<Connection, T> command) {
        try (Connection conn = DSProvider.getConnection()) {
            return command.apply(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void withConnectionVoid(Consumer<Connection> action) {
        try (Connection conn = DSProvider.getConnection()) {
            action.accept(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void updateTotalCost(BigDecimal dailyRate, Rental rental) {
        if (rental.getStartDate() != null && rental.getEndDate() != null) {
            if (rental.getEndDate().isBefore(rental.getStartDate())) {
                throw new IllegalArgumentException("End date cannot be before start date");
            }
            long days = ChronoUnit.DAYS.between(rental.getStartDate(), rental.getEndDate());
            if (days == 0) {
                days = 1;
            }
            rental.setTotalCost(dailyRate.multiply(BigDecimal.valueOf(days)));
        }
    }

    @Override
    public void createRental(Rental rental) {
        Car carById = carService.getCarById(rental.getCarId());
        updateTotalCost(carById.getDailyRate(), rental);
        withConnectionVoid(connection -> {
            rentalDao.save(connection, rental);
        });
    }

    @Override
    public Rental getRentalById(long id) {
        return withConnection(connection -> {
            return rentalDao.findById(connection, id);
        });
    }

    @Override
    public List<Rental> getRentals() {
        withConnectionVoid(rentalDao::updateFinishedRentals);
        return withConnection(rentalDao::findAll);
    }

    @Override
    public void completeRental(long rentalId, RentalStatus status) {
        withConnectionVoid(connection -> rentalDao.updateStatus(connection, rentalId, status));
    }

    public List<RentalDetails> getRentalDetails() {
        List<Rental> rentals = withConnection(rentalDao::findAll);
        List<RentalDetails> rentalDetails = new ArrayList<>();
        for (Rental rent : rentals) {
            Rental rental = withConnection(connection -> rentalDao.findById(connection, rent.getId()));
            Car car = withConnection(connection -> carService.getCarById(rent.getCarId()));
            Customer customer = withConnection(connection -> customerService.getCarById(rent.getCustomerId()));
            rentalDetails.add(new RentalDetails(car, rental, customer));
        }

        return rentalDetails;
    }

    @Override
    public void updateRentalStatus(long rentalId, RentalStatus status) {
        withConnectionVoid(connection -> rentalDao.updateStatus(connection, rentalId, status));
        Rental rentalById = withConnection(connection -> rentalDao.findById(connection, rentalId));
        switch (rentalById.getRentalStatus()) {
            case ACTIVE -> carService.updateCarStatus(rentalById.getCarId(), CarStatus.RENTED);
            case CANCELED, FINISHED -> carService.updateCarStatus(rentalById.getCarId(), CarStatus.AVAILABLE);
        }
    }
}

