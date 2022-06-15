package com.example.smart_home.repository;

import com.example.smart_home.entity.ConfirmToken;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

@Transactional
public interface  ConfirmationTokenRepository extends JpaRepository<ConfirmToken, Integer> {
    ConfirmToken findByUserId (long userId);
}