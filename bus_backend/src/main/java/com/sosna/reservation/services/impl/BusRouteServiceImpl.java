package com.sosna.reservation.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import com.sosna.reservation.entities.BusRoute;
import com.sosna.reservation.models.ReservationApiException;
import com.sosna.reservation.repos.BusRouteRepository;
import com.sosna.reservation.services.BusRouteService;

public class BusRouteServiceImpl implements BusRouteService {
	@Autowired
	private BusRouteRepository busRouteRepository;

	@Override
	public BusRoute addRoute(BusRoute busRoute) {

		return busRouteRepository.save(busRoute);
	}

	@Override
	public List<BusRoute> getAllBusRoutes() {
		// TODO Auto-generated method stub
		return busRouteRepository.findAll();
	}

	@Override
	public BusRoute getRouteByRouteName(String routeName) {
		// TODO Auto-generated method stub
		return busRouteRepository.findByRouteName(routeName)
				.orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "no such route:" + routeName));
	}

	@Override
	public BusRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo) {
		// TODO Auto-generated method stub
		return busRouteRepository.findByCityFromAndCityTo(cityFrom, cityTo)
				.orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No such route found!"));
	}

}
