package com.carrental.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DSProvider {

    private DSProvider() {
    }

    public static Connection getConnection() throws SQLException {

        return DriverManager.getConnection(
                DBConfig.getUrl(),
                DBConfig.getUsername(),
                DBConfig.getPassword()
        );

    }

}
