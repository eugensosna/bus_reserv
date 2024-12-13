package com.sosna.reservation.services;

import com.sosna.reservation.entities.BusSchedule;
import java.util.List;

public interface BusSheduleService {

	BusSchedule addShedule(BusSchedule busShedule);

	List<BusSchedule> getAllShedules();

	List<BusSchedule> getShedulesByRoute(String routeName);

}
