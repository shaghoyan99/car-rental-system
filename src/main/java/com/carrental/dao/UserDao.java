package com.carrental.dao;

import com.carrental.model.User;
import com.carrental.model.enums.UserRole;

import java.sql.Connection;
import java.util.List;

public interface UserDao {
    User findByUsername(Connection connection, String username);

    User findByUsernameAndPassword(Connection connection, String username, String password);

    List<User> findAll(Connection connection);

    void save(Connection connection, User user);

    void updateRole(Connection connection, long id, UserRole role);

    void delete(Connection connection, long id);
}
