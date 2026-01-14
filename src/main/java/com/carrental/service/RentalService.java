package com.carrental.service;

import com.carrental.dto.RentalDetails;
import com.carrental.model.Rental;
import com.carrental.model.enums.RentalStatus;

import java.time.LocalDate;
import java.util.List;

public interface RentalService {
    void createRental(Rental rental);
    Rental getRentalById(long id);
    List<Rental> getRentals();
    void completeRental(long rentalId, RentalStatus status);
    List<RentalDetails> getRentalDetails();
    void updateRentalStatus(long rentalId, RentalStatus status);

}
