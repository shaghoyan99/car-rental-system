package com.carrental.servlet;

import com.carrental.model.enums.UserRole;
import com.carrental.service.UserService;
import com.carrental.service.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/updateUserRole")
public class UpdateUserRoleServlet extends HttpServlet {

    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userIdStr = req.getParameter("userId");
        String roleParam = req.getParameter("role");
        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                long userId = Long.parseLong(userIdStr);
                UserRole role = UserRole.USER;
                try {
                    if (roleParam != null) role = UserRole.valueOf(roleParam);
                } catch (IllegalArgumentException e) {
                    role = UserRole.USER;
                }
                userService.updateRole(userId, role);
            } catch (NumberFormatException ignored) {
            }
        }
        resp.sendRedirect(req.getContextPath() + "/users");
    }
}
