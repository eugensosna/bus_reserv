package com.sosna.reservation.entities;

import com.sosna.reservation.entities.BusSchedule;
import com.sosna.reservation.entities.Customer;

import jakarta.persistence.*;

@Entity
@Table(name = "bus_reservation")
public class Reservation {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reservationId;
    @OneToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    @OneToOne
    @JoinColumn(name = "bus_schedule_id")
    private BusSchedule busSchedule;
    private Long timestamp;
    private String departureDate;
    private Integer totalSeatBooked;
    private String seatNumbers;
    private String reservationStatus;
    private Integer totalPrice;

}
