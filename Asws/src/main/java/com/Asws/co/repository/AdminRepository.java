package com.Asws.co.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Asws.co.domain.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin,Long>{
    
}
