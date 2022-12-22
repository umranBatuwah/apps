package com.Asws.co.controller;


import com.Asws.co.domain.Role;
import com.Asws.co.service.Impl.RoleServiceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/role")
public class RoleController {

    private static final Logger logger = LoggerFactory.getLogger(RoleController.class);



    @Autowired
    private RoleServiceImpl roleService;

    @PostMapping({"/createNewRole"})
    public Role createNewRole(@RequestBody Role role) {
        logger.info("Creating new Role");
        return roleService.createnewRole(role);
    }

    // @GetMapping("/roles")
	// public ResponseEntity<List<com.Asws.co.domain.Role>> getAllUser() {
	// 	List<Role> list = roleService.getAllRoles();
	// 	return ResponseEntity.status(HttpStatus.OK).body(list);
	// }
    

    // @PostMapping("/roles")
	// public ResponseEntity<Role> createuser(@RequestBody Role obj){
	//     Role us = roleService.createRole(obj);
	// 	return ResponseEntity.status(HttpStatus.OK).body(us);
	// }
    
}
