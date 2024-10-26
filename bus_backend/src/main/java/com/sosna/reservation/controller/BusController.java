package com.sosna.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.sosna.reservation.entities.Bus;
import com.sosna.reservation.repos.BusRepository;
import com.sosna.reservation.services.BusService;

@RestController
@RequestMapping("/api/bus")
public class BusController {
	
	@Autowired
	private BusService busService;
	
	@PostMapping("/add")
	@JsonCreator()
	public Bus addBus(@RequestBody Bus bus) {
		
		return busService.addBus(bus);
	}
	
	public List<Bus> getAllBus(){
		return busService.getAllBus();
		
	}
	
	
	
	

}
