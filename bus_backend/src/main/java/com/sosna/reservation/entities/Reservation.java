package com.sosna.reservation.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

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
    public Long getReservationId() {
		return reservationId;
	}
	public void setReservationId(Long reservationId) {
		this.reservationId = reservationId;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public BusSchedule getBusSchedule() {
		return busSchedule;
	}
	public void setBusSchedule(BusSchedule busSchedule) {
		this.busSchedule = busSchedule;
	}
	public Long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public Integer getTotalSeatBooked() {
		return totalSeatBooked;
	}
	public void setTotalSeatBooked(Integer totalSeatBooked) {
		this.totalSeatBooked = totalSeatBooked;
	}
	public String getSeatNumbers() {
		return seatNumbers;
	}
	public void setSeatNumbers(String seatNumbers) {
		this.seatNumbers = seatNumbers;
	}
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Reservation(Long reservationId, Customer customer, BusSchedule busSchedule, Long timestamp,
			String departureDate, Integer totalSeatBooked, String seatNumbers, String reservationStatus,
			Integer totalPrice) {
		super();
		this.reservationId = reservationId;
		this.customer = customer;
		this.busSchedule = busSchedule;
		this.timestamp = timestamp;
		this.departureDate = departureDate;
		this.totalSeatBooked = totalSeatBooked;
		this.seatNumbers = seatNumbers;
		this.reservationStatus = reservationStatus;
		this.totalPrice = totalPrice;
	}
	private String reservationStatus;
    private Integer totalPrice;

}
