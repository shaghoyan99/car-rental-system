package com.carrental.dao.impl;

import com.carrental.dao.CarDao;
import com.carrental.model.Car;
import com.carrental.model.enums.CarStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CarDaoImpl implements CarDao {
    @Override
    public Car findById(long id, Connection conn) {
        String sql = "SELECT * from car WHERE id = ?";
        try(PreparedStatement preparedStatement = conn.prepareStatement(sql) ) {
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return addCar(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<Car> findAll(Connection conn) {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT * from car";
        try (Statement statement = conn.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                cars.add(addCar(resultSet));
            }
            return cars;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Car> findAvailable(Connection conn) {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT * from car WHERE status = 'AVAILABLE'";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query)){
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                cars.add(addCar(resultSet));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return cars;
    }

    private Car addCar(ResultSet rs) throws SQLException  {
        Car car = new Car();
        car.setId(rs.getLong("id"));
        car.setBrand(rs.getString("brand"));
        car.setModel(rs.getString("model"));
        car.setYear(rs.getInt("year"));
        car.setDailyRate(rs.getBigDecimal("daily_rate"));
        car.setStatus(CarStatus.valueOf(rs.getString("status")));
        return car;
    }

    @Override
    public void save(Connection conn, Car car) {
        String query = "INSERT INTO car(brand, model, year, daily_rate) VALUES (?, ?, ?, ?)";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getYear());
            preparedStatement.setBigDecimal(4, car.getDailyRate());
            preparedStatement.executeUpdate();
            ResultSet rs = preparedStatement.getGeneratedKeys();

            if (rs.next()) {
                car.setId(rs.getLong(1));
                car.setStatus(CarStatus.AVAILABLE);
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateStatus(Connection conn, long carId, CarStatus status) {
        String query = "UPDATE car SET status = ? WHERE id = ?";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query)){
            preparedStatement.setString(1,status.name());
            preparedStatement.setLong(2,carId);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Connection conn, long carId) {
        String query  = "DELETE FROM car WHERE id = ?";
        try(PreparedStatement preparedStatement = conn.prepareStatement(query)){
            preparedStatement.setLong(1, carId);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
