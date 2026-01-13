package com.carrental.dto;

import com.carrental.model.Car;
import com.carrental.model.Customer;
import com.carrental.model.Rental;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RentalDetails {

    private Car car;
    private Rental rental;
    private Customer customer;

}
