package com.carrental.service;

import com.carrental.model.User;
import com.carrental.model.enums.UserRole;

import java.util.List;

public interface UserService {
List<User> getAllUsers();
User getUserByUsername(String username);
User authenticate(String username, String password);
void registerUser(User user);
void updateRole(long userId, UserRole newRole);
void removeUser(long userId);

}
