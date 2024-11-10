package com.sosna.reservation.entities;
 import jakarta.persistence.*;
 @Entity
 @Table(name = "bus_route")
public class BusRoute {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long routeId;
    private String routeName;
    private String cityFrom;
    private String cityTo;
    private Double distanceInKm;
	public Long getRouteId() {
		return routeId;
	}
	public void setRouteId(Long routeId) {
		this.routeId = routeId;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public String getCityFrom() {
		return cityFrom;
	}
	public void setCityFrom(String cityFrom) {
		this.cityFrom = cityFrom;
	}
	public String getCityTo() {
		return cityTo;
	}
	public void setCityTo(String cityTo) {
		this.cityTo = cityTo;
	}
	public Double getDistanceInKm() {
		return distanceInKm;
	}
	public void setDistanceInKm(Double distanceInKm) {
		this.distanceInKm = distanceInKm;
	}
	public BusRoute(Long routeId, String routeName, String cityFrom, String cityTo, Double distanceInKm) {
		super();
		this.routeId = routeId;
		this.routeName = routeName;
		this.cityFrom = cityFrom;
		this.cityTo = cityTo;
		this.distanceInKm = distanceInKm;
	}
	public BusRoute() {
		super();
	}
	
}
