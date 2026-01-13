package com.carrental.dao.impl;

import com.carrental.dao.CustomerDao;
import com.carrental.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDaoImpl implements CustomerDao {
    @Override
    public Customer findById(Connection conn, long id) {
        String query = "SELECT * FROM customers WHERE id = ?";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query)){
            preparedStatement.setLong(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
               return addCustomer(resultSet);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return  null;
    }

    @Override
    public List<Customer> findAll(Connection conn) {
        String query = "SELECT * FROM customers";
        try(Statement statement = conn.createStatement()){
            ResultSet resultSet = statement.executeQuery(query);
            List<Customer> customers = new ArrayList<>();
            while(resultSet.next()){
                customers.add(addCustomer(resultSet));
            }
            return customers;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Customer addCustomer(ResultSet rs) throws SQLException{
        Customer customer = new Customer();
        customer.setId(rs.getLong("id"));
        customer.setName(rs.getString("name"));
        customer.setSurname(rs.getString("surname"));
        customer.setLicenseNumber(rs.getString("license_number"));
        customer.setPhone(rs.getString("phone"));
        customer.setEmail(rs.getString("email"));
        return customer;
    }

    @Override
    public void save(Connection conn, Customer customer) {
        String query = "INSERT INTO customers VALUES (NULL, ?, ?, ?, ?, ?)";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)){
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getSurname());
            preparedStatement.setString(3,customer.getLicenseNumber());
            preparedStatement.setString(4,customer.getPhone());
            preparedStatement.setString(5,customer.getEmail());
            preparedStatement.executeUpdate();
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()){
                customer.setId(rs.getLong(1));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Connection conn, long customerId) {
        String query = "DELETE FROM customers WHERE id = ?";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query)){
            preparedStatement.setLong(1,customerId);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
