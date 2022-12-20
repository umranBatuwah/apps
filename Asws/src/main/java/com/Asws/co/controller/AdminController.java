package com.Asws.co.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Asws.co.domain.Admin;
import com.Asws.co.service.Impl.AdminServiceImpl;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;

    @GetMapping("/admins")
	public ResponseEntity<List<Admin>> getAlladmins() {
		List<Admin> list = adminService.getAllAdmins();
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
    

    @PostMapping("/create-admin")
	public ResponseEntity<Admin> createServiceDetail(@RequestBody Admin obj){
		Admin ad = adminService.createAdmin(obj);
		return ResponseEntity.status(HttpStatus.OK).body(ad);
	}
}
