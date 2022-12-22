package com.Asws.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.Asws.co.domain.Role;
import com.Asws.co.repository.RolesRepository;
import com.Asws.co.service.RoleService;

public class RoleServiceImpl implements RoleService{

    @Autowired
    private RolesRepository rolesRepository;

    @Override
    public Role createnewRole(Role obj) {

        Role rl = rolesRepository.save(obj);
        return rl;
    }

    // @Override
    // public List<Role> getAllRoles() {
    //     return rolesRepository.findAll();
    // }
    
}
