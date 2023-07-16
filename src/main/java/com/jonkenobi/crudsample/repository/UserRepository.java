package com.jonkenobi.crudsample.repository;

import com.jonkenobi.crudsample.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
