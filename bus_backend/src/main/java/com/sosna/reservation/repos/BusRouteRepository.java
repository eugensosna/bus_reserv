package com.sosna.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import com.sosna.reservation.entities.BusRoute;
import java.util.Optional;



public interface BusRouteRepository  extends JpaRepository<BusRoute, Long>{
	
	 Optional <BusRoute> findByRouteName(String routeName);
	 Optional <BusRoute > findByCityFromAndCityTo(String cityFrom, String cityTo);

}
