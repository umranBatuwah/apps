package com.Asws.co.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.Asws.co.service.Impl.AdminServiceImpl;
import com.Asws.co.service.Impl.RoleServiceImpl;
import com.Asws.co.service.Impl.UserImpl;

@Configuration
public class BeanCnfiguration {

    @Bean
    public AdminServiceImpl adminServiceImpl(){
        return new AdminServiceImpl();
    }


    @Bean
    public RoleServiceImpl roleServiceImpl(){
        return new RoleServiceImpl();
    }

    @Bean
    public UserImpl userServiceImpl(){
        return new UserImpl();
    }


    
  
}
