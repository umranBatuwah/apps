package com.Asws.co.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.Asws.co.service.Impl.AdminServiceImpl;

@Configuration
public class BeanCnfiguration {

    @Bean
    public AdminServiceImpl adminServiceImpl(){
        return new AdminServiceImpl();
    }
    
}
