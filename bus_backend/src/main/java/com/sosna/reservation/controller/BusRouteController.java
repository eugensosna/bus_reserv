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

import com.sosna.reservation.entities.BusRoute;
import com.sosna.reservation.models.ResponseModel;
import com.sosna.reservation.services.BusRouteService;

@RestController
@RequestMapping("/api/route")
public class BusRouteController {
	@Autowired
	private BusRouteService busRouteService;

	@PostMapping("/add")
	public ResponseModel<BusRoute> addRoute(@RequestBody BusRoute busRoute) {
		final BusRoute busRoute1 = busRouteService.addRoute(busRoute);
		return new ResponseModel<BusRoute>(HttpStatus.OK.value(), "Route Saved", busRoute1);
	}

	@GetMapping("/all")
	public ResponseEntity<List<BusRoute>> getAllRoutes() {
		return ResponseEntity.ok(busRouteService.getAllBusRoutes());
	}

	@GetMapping("/{routeName}")
	public ResponseEntity<BusRoute> getRouteByRouteName(@PathVariable(name = "routeName") String routeName) {
		return ResponseEntity.ok(busRouteService.getRouteByRouteName(routeName));
	}

	@GetMapping("/query")
	public ResponseEntity<BusRoute> getRouteByCityFromAndCityTo(@RequestParam String cityFrom,
			@RequestParam String cityTo) {
		return ResponseEntity.ok(busRouteService.getRouteByCityFromAndCityTo(cityFrom, cityTo));
	}

}
