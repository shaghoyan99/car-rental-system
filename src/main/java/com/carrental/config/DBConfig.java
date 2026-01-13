package com.carrental.config;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

public class DBConfig {

    private static final Properties prop = new Properties();

    static {
        try(InputStream in = DBConfig.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (in == null) {
                throw  new FileNotFoundException("db.properties file not found!");
            }
            prop.load(in);
            Class.forName(prop.getProperty("db.driver"));

        }catch (Exception e) {
            throw new ExceptionInInitializerError("Failed to load DB properties file");
        }
    }

    private DBConfig() {}

    public static String getUrl(){
        return prop.getProperty("db.url");
    }
    public static String getUsername(){
        return prop.getProperty("db.username");
    }
    public static String getPassword(){
        return prop.getProperty("db.password");
    }

}
