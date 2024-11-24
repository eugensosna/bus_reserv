package com.sosna.reservation.repos;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sosna.reservation.entities.Bus;
import com.sosna.reservation.entities.BusRoute;
import com.sosna.reservation.entities.BusSchedule;

public interface BusScheduleRepository extends JpaRepository<BusSchedule, Long> {
	Optional <List<BusSchedule>> findByBusRoute(BusRoute busRoute);
	Boolean existsByBusAndBusRouteAndDepartureTime(Bus bus, BusRoute busRoute, String date);

}
