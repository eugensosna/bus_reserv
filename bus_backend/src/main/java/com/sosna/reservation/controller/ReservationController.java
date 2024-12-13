package com.sosna.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sosna.reservation.entities.Reservation;
import com.sosna.reservation.models.ResponseModel;
import com.sosna.reservation.services.ReservationService;

@RestController
@RequestMapping("/api/reservation")
public class ReservationController {
	 @Autowired
	    private ReservationService reservationService;

	    @PostMapping("/add")
	    public ResponseModel<Reservation> addReservation(@RequestBody Reservation reservation) {
	        final Reservation res = reservationService.addReservation(reservation);
	        return new ResponseModel<>(HttpStatus.OK.value(), "Reservation saved", res);
	    }

	    @GetMapping("/all")
	    public ResponseEntity<List<Reservation>> getAllReservations() {
	        return ResponseEntity.ok(reservationService.getAllReservations());
	    }

	    @GetMapping("/query")
	    public ResponseEntity<List<Reservation>> getReservationsByScheduleAndDepartureDate(
	            @RequestParam Long scheduleId,
	            @RequestParam String departureDate
	    ) {
	        return ResponseEntity.ok(reservationService.getReservationsByScheduleAndDepartureDate(scheduleId, departureDate));
	    }

	    @GetMapping("/all/{mobile}")
	    public ResponseEntity<List<Reservation>> getReservationsByMobile(
	            @PathVariable(name = "mobile") String mobile
	    ) {
	        return ResponseEntity.ok(reservationService.getReservationsByMobile(mobile));
	    }
}
