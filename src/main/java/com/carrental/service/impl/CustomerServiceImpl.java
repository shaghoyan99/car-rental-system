package com.carrental.service.impl;

import com.carrental.config.DSProvider;
import com.carrental.dao.CustomerDao;
import com.carrental.dao.impl.CustomerDaoImpl;
import com.carrental.model.Customer;
import com.carrental.service.CustomerService;

import java.sql.Connection;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {

    private final CustomerDao customerDao = new CustomerDaoImpl();

    @Override
    public List<Customer> getAllCustomers() {
        try (Connection conn = DSProvider.getConnection()) {
            return customerDao.findAll(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Customer getCustomerById(long id) {
        try (Connection conn = DSProvider.getConnection()) {
            return customerDao.findById(conn, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addCustomer(Customer customer) {
        try (Connection conn = DSProvider.getConnection()) {
            customerDao.save(conn, customer);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Customer getCarById(long id) {
        try (Connection conn = DSProvider.getConnection()) {
            return customerDao.findById(conn, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

