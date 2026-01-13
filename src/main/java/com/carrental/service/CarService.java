package com.carrental.service;

import com.carrental.model.Car;
import com.carrental.model.enums.CarStatus;

import java.util.List;

public interface CarService {
    List<Car> getAllCars();

    List<Car> getAvailableCars();

    Car getCarById(long id);

    void addCar(Car car);

    void removeCar(long id);

    void updateCarStatus(long id, CarStatus status);
}
