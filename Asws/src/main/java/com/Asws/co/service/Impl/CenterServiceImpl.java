package com.Asws.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Asws.co.domain.Center;
import com.Asws.co.repository.CenterRepository;
import com.Asws.co.service.CenterService;

@Service
public class CenterServiceImpl implements CenterService{

    @Autowired
    private CenterRepository centerRepository;

    @Override
    public Center creatTeacher(Center obj) {

        Center ct = centerRepository.save(obj);
        return ct;
    }

    @Override
    public List<Center> getAllTeachers() {
        return centerRepository.findAll();
    }
    
}
