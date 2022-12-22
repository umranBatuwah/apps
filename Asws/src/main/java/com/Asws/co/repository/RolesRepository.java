package com.Asws.co.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Asws.co.domain.Role;
import com.Asws.co.domain.User;

@Repository
public interface RolesRepository extends JpaRepository<Role,String>{
    
}
