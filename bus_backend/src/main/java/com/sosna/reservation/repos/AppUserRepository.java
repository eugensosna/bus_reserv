package com.sosna.reservation.repos;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sosna.reservation.entities.AppUsers;

public interface AppUserRepository  extends JpaRepository<AppUsers, Long>{
	 Optional<AppUsers> findByUserName(String userName);

}
