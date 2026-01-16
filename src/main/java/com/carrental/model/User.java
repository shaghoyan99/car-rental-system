package com.carrental.model;

import com.carrental.model.enums.UserRole;
import com.carrental.utill.PasswordUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private Long id;
    private String name;
    private String surname;
    private String username;
    private transient String password;
    private String encryptedPassword;
    private UserRole role;

    public void setPassword(String password) {
        this.password = password;
        this.encryptedPassword = PasswordUtil.encrypt(password);
    }
}
