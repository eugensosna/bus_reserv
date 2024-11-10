package com.sosna.reservation.services;

import java.util.List;

import com.sosna.reservation.entities.Bus;

public interface BusService {
	Bus addBus(Bus bus);
	List<Bus> getAllBus();
}
