package com.carrental.dao;

import com.carrental.model.Car;
import com.carrental.model.enums.CarStatus;

import java.sql.Connection;
import java.util.List;

public interface CarDao {
    Car findById(long id,Connection conn);
    List<Car> findAll(Connection conn);
    List<Car> findAvailable(Connection conn);
    void save(Connection conn, Car car);
    void updateStatus(Connection conn, long carId, CarStatus status);
    void delete(Connection conn, long carId);
}
