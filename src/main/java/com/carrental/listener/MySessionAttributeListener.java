package com.carrental.listener;

import com.carrental.model.User;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

import java.util.Date;

@WebListener
public class MySessionAttributeListener implements HttpSessionAttributeListener {
    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        if (event.getName().equals("authUser")) {
            System.out.println("User with username " + ((User) event.getValue()).getUsername() + " authenticated: " + new Date());
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        if (event.getName().equals("authUser")) {
            System.out.println("User with username " + ((User) event.getValue()).getUsername() + " logged out: " + new Date());
        }
    }
}