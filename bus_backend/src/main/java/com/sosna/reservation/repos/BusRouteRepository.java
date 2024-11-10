package com.sosna.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import com.sosna.reservation.entities.BusRoute;



public interface BusRouteRepository  extends JpaRepository<BusRoute, Long>{

}
