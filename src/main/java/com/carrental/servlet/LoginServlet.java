package com.carrental.servlet;

import com.carrental.model.User;
import com.carrental.service.UserService;
import com.carrental.service.impl.UserServiceImpl;
import com.carrental.utill.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {

    private final UserService usersService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User authUser = usersService.authenticate(username, PasswordUtil.encrypt(password));
        if (authUser != null) {
            req.getSession().setAttribute("authUser", authUser);
            resp.sendRedirect("/home");
        } else {
            req.getSession().setAttribute("message", "Invalid username or password");
            resp.sendRedirect("/login");
        }
    }
}
