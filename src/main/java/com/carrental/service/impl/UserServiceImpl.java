package com.carrental.service.impl;

import com.carrental.dao.UserDao;
import com.carrental.dao.impl.UserDaoImpl;
import com.carrental.model.User;
import com.carrental.model.enums.UserRole;
import com.carrental.service.UserService;
import com.carrental.utill.ConnectionUtil;

import java.util.List;


public class UserServiceImpl implements UserService {

    private final UserDao userDao = new UserDaoImpl();

    @Override
    public List<User> getAllUsers() {
        return ConnectionUtil.withConnection(userDao::findAll);
    }

    @Override
    public User getUserByUsername(String username) {
        return ConnectionUtil.withConnection(connection -> userDao.findByUsername(connection, username));
    }

    @Override
    public User authenticate(String username, String password) {
        return ConnectionUtil.withConnection(connection -> userDao.findByUsernameAndPassword(connection, username, password));
    }

    @Override
    public void registerUser(User user) {
        ConnectionUtil.withConnectionVoid(connection -> userDao.save(connection, user));
    }

    @Override
    public void updateRole(long userId, UserRole newRole) {
        ConnectionUtil.withConnectionVoid(connection -> userDao.updateRole(connection, userId, newRole));
    }

    @Override
    public void removeUser(long userId) {
        ConnectionUtil.withConnectionVoid(connection -> userDao.delete(connection, userId));
    }
}
