package com.example.smart_home.repository;

import com.example.smart_home.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;


import javax.transaction.Transactional;

@Transactional
public  interface  UserRepository extends JpaRepository<User, Integer>{
    User findByEmail(String email);

    Integer deleteUserByEmail(String email);
}
