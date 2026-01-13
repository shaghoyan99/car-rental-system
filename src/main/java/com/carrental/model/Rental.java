package com.carrental.model;

import com.carrental.model.enums.RentalStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rental {
    private long id;
    private long carId;
    private long customerId;
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal totalCost;
    private RentalStatus rentalStatus;

    public void setEndDate(LocalDate endDate) {
        if (startDate != null && endDate.isBefore(startDate)) {
           throw  new IllegalStateException("endDate is incorrect");
        }
        this.endDate = endDate;
    }
}
