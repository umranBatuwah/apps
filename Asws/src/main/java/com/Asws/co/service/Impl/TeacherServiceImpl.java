package com.Asws.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.Asws.co.domain.Teacher;
import com.Asws.co.repository.TeacherRepository;
import com.Asws.co.service.TeacherService;

public class TeacherServiceImpl implements TeacherService{

    @Autowired
    private TeacherRepository teacherRepository;

    @Override
    public Teacher creatTeacher(Teacher obj) {

        Teacher tc = teacherRepository.save(obj);

        return tc;
    }

    @Override
    public List<Teacher> getAllTeachers() {
        return teacherRepository.findAll();
    }
    
}
