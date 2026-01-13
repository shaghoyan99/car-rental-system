package com.carrental.dao;

import com.carrental.model.Customer;

import java.sql.Connection;
import java.util.List;

public interface CustomerDao {
    Customer findById(Connection conn, long id);
    List<Customer> findAll(Connection conn);
    void save(Connection conn, Customer customer);
    void delete(Connection conn, long customerId);
}
