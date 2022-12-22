package com.Asws.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Asws.co.domain.Admin;
import com.Asws.co.repository.AdminRepository;
import com.Asws.co.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public Admin createAdmin(Admin obj) {

        Admin ad = adminRepository.save(obj);

        return ad;
    }

    @Override
    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }
    
}
