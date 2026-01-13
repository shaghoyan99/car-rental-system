package com.carrental.dao;

import com.carrental.model.Rental;
import com.carrental.model.enums.RentalStatus;

import java.sql.Connection;
import java.util.List;

public interface RentalDao {
    Rental findById(Connection conn, long id);
    List<Rental> findAll(Connection conn);
    void save(Connection conn, Rental rental);
    void updateStatus(Connection conn, long rentalId, RentalStatus status);
}
