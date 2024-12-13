package com.sosna.reservation.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.sosna.reservation.entities.BusRoute;
import com.sosna.reservation.entities.BusSchedule;
import com.sosna.reservation.models.ReservationApiException;
import com.sosna.reservation.repos.BusRouteRepository;
import com.sosna.reservation.repos.BusScheduleRepository;
import com.sosna.reservation.services.BusSheduleService;

@Service
public class BusSheduleServiceImpl implements BusSheduleService {
	
	@Autowired
	private BusScheduleRepository busSheduleRepository;
	
	@Autowired
	private BusRouteRepository busRouteRepo;

	@Override
	public BusSchedule addShedule(BusSchedule busSchedule) {
		final boolean exists = busSheduleRepository.existsByBusAndBusRouteAndDepartureTime(
				busSchedule.getBus(),
				busSchedule.getBusRoute(),
				busSchedule.getDepartureTime());
		
		if(exists) {
            throw new ReservationApiException(HttpStatus.CONFLICT, "Duplicate Schedule");
        }
       
		return busSheduleRepository.save(busSchedule);
	}

	@Override
	public List<BusSchedule> getAllShedules() {
	
		return busSheduleRepository.findAll();
	}

	@Override
	public List<BusSchedule> getShedulesByRoute(String routeName) {
		final BusRoute route = busRouteRepo.findByRouteName(routeName).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST,"not found route:"+routeName));
		return busSheduleRepository.findByBusRoute(route).orElseThrow(() -> new ReservationApiException(HttpStatus.BAD_REQUEST, "Not Found"));
	} 

}
