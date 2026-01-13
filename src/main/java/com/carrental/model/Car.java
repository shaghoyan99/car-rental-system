package com.carrental.model;

import com.carrental.model.enums.CarStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Car {
    private long id;
    private String brand;
    private String model;
    private int year;
    private BigDecimal dailyRate;
    private CarStatus status;
}
