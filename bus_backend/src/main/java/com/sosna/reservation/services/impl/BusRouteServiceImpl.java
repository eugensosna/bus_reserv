package com.sosna.reservation.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.sosna.reservation.entities.BusRoute;
import com.sosna.reservation.models.ReservationApiException;
import com.sosna.reservation.repos.BusRouteRepository;
import com.sosna.reservation.services.BusRouteService;

@Service
public class BusRouteServiceImpl implements BusRouteService {
	@Autowired
	private BusRouteRepository busRouteRepository;

	@Override
	public BusRoute addRoute(BusRoute busRoute) {

		return busRouteRepository.save(busRoute);
	}

	@Override
	public List<BusRoute> getAllBusRoutes() {
		return busRouteRepository.findAll();
	}

	@Override
	public BusRoute getRouteByRouteName(String routeName) {
		return busRouteRepository.findByRouteName(routeName)
				.orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "no such route:" + routeName));
	}

	@Override
	public BusRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo) {
		return busRouteRepository.findByCityFromAndCityTo(cityFrom, cityTo)
				.orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "No such route found!"));
	}

}
