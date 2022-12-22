package com.Asws.co.service;

import java.util.List;

import com.Asws.co.domain.User;

public interface UserService {

    public User createUser(User obj);

    public List<User> getAllUSers();

}
