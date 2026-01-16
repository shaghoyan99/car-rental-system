package com.carrental.servlet;

import com.carrental.model.User;
import com.carrental.model.enums.UserRole;
import com.carrental.service.UserService;
import com.carrental.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {

    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String roleParam = req.getParameter("role");

        UserRole userRole = UserRole.USER;
        try {
            if (roleParam != null) userRole = UserRole.valueOf(roleParam);
        } catch (IllegalArgumentException ex) {
            userRole = UserRole.USER;
        }

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            req.setAttribute("message", "Username and password are required");
            req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
            return;
        }

        User exists = userService.getUserByUsername(username);
        if (exists != null) {
            req.setAttribute("message", "Username is already taken");
            req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setName(name);
        user.setSurname(surname);
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(userRole);

        userService.registerUser(user);
        req.getSession().setAttribute("message", "Registration successful. Please log in.");
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
