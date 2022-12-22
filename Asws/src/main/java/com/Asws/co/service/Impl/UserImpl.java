package com.Asws.co.service.Impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Asws.co.domain.Role;
import com.Asws.co.domain.User;
import com.Asws.co.repository.RolesRepository;
import com.Asws.co.repository.UserRepository;
import com.Asws.co.service.UserService;

@Service
public class UserImpl implements UserService{


    @Autowired
    private RolesRepository rolesRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public User createUser(User obj) {
        User us = userRepository.save(obj);
        return us;
    }

    @Override
    public List<User> getAllUSers() {
        return userRepository.findAll();
    }

    public void initRoleAndUser() {

        Role adminRole = new Role();
        adminRole.setName("Admin");
        rolesRepository.save(adminRole);

        Role userRole = new Role();
        userRole.setName("User");
        //userRole.setRoleDescription("Default role for newly created record");
        rolesRepository.save(userRole);

        User adminUser = new User();
        adminUser.setUsername("umran");
        adminUser.setPassword(getEncodedPassword("admin@pass"));
        Set<Role> adminRoles = new HashSet<>();
        adminRoles.add(adminRole);
        adminUser.setRoles(adminRoles);
        userRepository.save(adminUser);

//        User user = new User();
//        user.setUserName("raj123");
//        user.setUserPassword(getEncodedPassword("raj@123"));
//        user.setUserFirstName("raj");
//        user.setUserLastName("sharma");
//        Set<Role> userRoles = new HashSet<>();
//        userRoles.add(userRole);
//        user.setRole(userRoles);
//        userDao.save(user);
    }

    public User registerNewUser(User user) {
        Role role = rolesRepository.findById("User").get();
        Set<Role> userRoles = new HashSet<>();
        userRoles.add(role);
        user.setRoles(userRoles);
        user.setPassword(getEncodedPassword(user.getPassword()));

        return userRepository.save(user);
    }

    public String getEncodedPassword(String password) {
        return passwordEncoder.encode(password);
    }
    
}
