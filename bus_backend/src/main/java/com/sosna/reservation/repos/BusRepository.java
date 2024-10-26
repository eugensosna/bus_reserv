package com.sosna.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sosna.reservation.entities.Bus;

public interface BusRepository extends JpaRepository <Bus, Long> {

}
