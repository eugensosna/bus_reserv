package com.sosna.reservation.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sosna.reservation.entities.Bus;
import com.sosna.reservation.repos.BusRepository;
import com.sosna.reservation.services.BusService;

@Service
public class BusServiceImpl  implements BusService{
	@Autowired
	private BusRepository busRepository;

	@Override
	public Bus addBus(Bus bus) {
		// TODO Auto-generated method stub
		return busRepository.save(bus);
	}

	@Override
	public List<Bus> getAllBus() {
		// TODO Auto-generated method stub
		return busRepository.findAll();
	}

}
