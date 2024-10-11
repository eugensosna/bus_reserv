package ua.sosna.reservationudemy.services;

import java.util.List;
import ua.sosna.reservationudemy.entities.Bus;

public interface BusService {

	Bus addBus(Bus bus);

	List<Bus> getAllBus();

}
