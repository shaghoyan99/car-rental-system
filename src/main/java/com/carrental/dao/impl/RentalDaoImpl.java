package com.carrental.dao.impl;

import com.carrental.dao.RentalDao;
import com.carrental.model.Rental;
import com.carrental.model.enums.RentalStatus;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RentalDaoImpl implements RentalDao {

    @Override
    public Rental findById(Connection conn, long id) {
        String query = "SELECT * FROM rental WHERE id = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return addRental(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<Rental> findAll(Connection conn) {
        List<Rental> rentals = new ArrayList<>();
        String query = "SELECT * FROM rental";
        try (Statement statement = conn.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                rentals.add(addRental(resultSet));
            }
            return rentals;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Rental addRental(ResultSet rs) throws SQLException {
        Rental rental = new Rental();
        rental.setId(rs.getLong("id"));
        rental.setCarId(rs.getLong("car_id"));
        rental.setCustomerId(rs.getLong("customer_id"));
        rental.setStartDate(rs.getDate("start_date").toLocalDate());
        rental.setEndDate(rs.getDate("end_date").toLocalDate());
        rental.setTotalCost(rs.getBigDecimal("total_cost"));
        rental.setRentalStatus(RentalStatus.valueOf(rs.getString("status")));
        return rental;
    }

    @Override
    public void save(Connection conn, Rental rental) {
        String query = "INSERT INTO rental VALUES (NULL, ?, ?, ?, ?, ?,?)";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setLong(1, rental.getCarId());
            preparedStatement.setLong(2, rental.getCustomerId());
            preparedStatement.setDate(3, Date.valueOf(rental.getStartDate()));
            preparedStatement.setDate(4, Date.valueOf(rental.getEndDate()));
            preparedStatement.setBigDecimal(5, rental.getTotalCost());
            preparedStatement.setString(6, RentalStatus.ACTIVE.name());
            preparedStatement.executeUpdate();
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                rental.setId(rs.getLong(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void updateStatus(Connection conn, long rentalId, RentalStatus status) {
        String query = "UPDATE rental SET status = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setString(1, status.name());
            preparedStatement.setLong(2, rentalId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void updateFinishedRentals(Connection conn) {
        String query = "UPDATE rental SET status = 'FINISHED' WHERE end_date <CURDATE() and status = 'ACTIVE'";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
