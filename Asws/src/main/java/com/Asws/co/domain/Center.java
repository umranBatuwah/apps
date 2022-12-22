package com.Asws.co.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "center")
public class Center {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;


    @Column(name = "centerName")
    private String centerName;

    @Column(name = "email")
    private String email;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @Column(name = "masjidCommitteMemberName")
    private String masjidCommiteMemberName;

    @Column(name = "waqtBoardNumber")
    private Integer waqtBoardNumber;
    
}
