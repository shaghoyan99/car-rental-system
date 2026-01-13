package com.carrental.service.impl;

import com.carrental.config.DSProvider;
import com.carrental.dao.CarDao;
import com.carrental.dao.impl.CarDaoImpl;
import com.carrental.model.Car;
import com.carrental.model.enums.CarStatus;
import com.carrental.service.CarService;

import java.sql.Connection;
import java.util.List;

public class CarServiceImpl implements CarService {

    private final CarDao carDao =  new CarDaoImpl();

    @Override
    public List<Car> getAllCars() {
        try(Connection conn = DSProvider.getConnection()){
            return carDao.findAll(conn);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Car> getAvailableCars() {
        try(Connection conn = DSProvider.getConnection()){
            return carDao.findAvailable(conn);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public Car getCarById(long id) {
        try(Connection conn = DSProvider.getConnection()){
            return carDao.findById(id,conn);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addCar(Car car) {
        try(Connection conn = DSProvider.getConnection()) {
            carDao.save(conn,car);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void removeCar(long id) {
        try(Connection conn = DSProvider.getConnection()){
            carDao.delete(conn,id);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateCarStatus(long id, CarStatus status) {
        try(Connection conn = DSProvider.getConnection()){
            carDao.updateStatus(conn,id,status);
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
