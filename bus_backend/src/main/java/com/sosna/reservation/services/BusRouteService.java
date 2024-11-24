package com.sosna.reservation.services;

import java.util.List;

import com.sosna.reservation.entities.BusRoute;

public interface BusRouteService {

	BusRoute addRoute(BusRoute busRoute);

	List<BusRoute> getAllBusRoutes();

	BusRoute getRouteByRouteName(String routeName);

	BusRoute getRouteByCityFromAndCityTo(String cityFrom, String cityTo);
}
