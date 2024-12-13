package com.sosna.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sosna.reservation.entities.BusSchedule;
import com.sosna.reservation.models.ResponseModel;
import com.sosna.reservation.services.BusSheduleService;

@RestController
@RequestMapping("/api/schedule")
public class BusScheduleController {
	
	@Autowired
    private BusSheduleService busScheduleService;
	
	@GetMapping("/all")
	public ResponseEntity<List<BusSchedule>> getAllSchedules() {
        return ResponseEntity.ok(busScheduleService.getAllShedules());
    }
	@PostMapping("/add")
    public ResponseModel<BusSchedule> addBusSchedule(@RequestBody BusSchedule busSchedule) {
        final BusSchedule schedule = busScheduleService.addShedule(busSchedule);
        return new ResponseModel<>(HttpStatus.OK.value(), "Schedule Saved", schedule);
    }

	

}
