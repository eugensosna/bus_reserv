package ua.sosna.reservationudemy.repos;

import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import jakarta.persistence.EntityManager;
import ua.sosna.reservationudemy.entities.Bus;

public class BusRepository  extends SimpleJpaRepository<Bus, Long>{

	public BusRepository(JpaEntityInformation<Bus, ?> entityInformation, EntityManager entityManager) {
		super(entityInformation, entityManager);
		// TODO Auto-generated constructor stub
	}
	
	

}
