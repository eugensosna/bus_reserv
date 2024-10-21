package com.sosna.reservation.entities;
import jakarta.persistence.*;

@Entity
@Table(name = "bus_schedule")
public class BusSchedule {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduleId;
    @OneToOne
    @JoinColumn(name = "bus_id")
    private Bus bus;
    @OneToOne
    @JoinColumn(name = "bus_route_id")
    private BusRoute busRoute;
    private String departureTime;
    private Integer ticketPrice;
    private Integer discount;
    private Integer processingFee;
	public Long getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(Long scheduleId) {
		this.scheduleId = scheduleId;
	}
	public Bus getBus() {
		return bus;
	}
	public void setBus(Bus bus) {
		this.bus = bus;
	}
	public BusRoute getBusRoute() {
		return busRoute;
	}
	public void setBusRoute(BusRoute busRoute) {
		this.busRoute = busRoute;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public Integer getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(Integer ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public Integer getProcessingFee() {
		return processingFee;
	}
	public void setProcessingFee(Integer processingFee) {
		this.processingFee = processingFee;
	}
	public BusSchedule(Long scheduleId, Bus bus, BusRoute busRoute, String departureTime, Integer ticketPrice,
			Integer discount, Integer processingFee) {
		super();
		this.scheduleId = scheduleId;
		this.bus = bus;
		this.busRoute = busRoute;
		this.departureTime = departureTime;
		this.ticketPrice = ticketPrice;
		this.discount = discount;
		this.processingFee = processingFee;
	}
}
