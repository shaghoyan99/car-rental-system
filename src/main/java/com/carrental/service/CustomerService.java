package com.carrental.service;

import com.carrental.model.Customer;

import java.sql.Connection;
import java.util.List;

public interface CustomerService {
    List<Customer> getAllCustomers();

    void addCustomer(Customer customer);

    Customer getCarById(long id);
}
