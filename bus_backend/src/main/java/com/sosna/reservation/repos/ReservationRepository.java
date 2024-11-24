package com.sosna.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sosna.reservation.entities.BusSchedule;
import com.sosna.reservation.entities.Customer;
import com.sosna.reservation.entities.Reservation;
import java.util.List;
import java.util.Optional;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
	Optional<List<Reservation>> findByCustomer(Customer customer);

	Optional<List<Reservation>> findByBusScheduleAndDepartureDate(BusSchedule busSchedule, String departureDate);

}
