package com.sosna.reservation.entities;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.*;

@Entity
public class Bus {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long busId;
	    private String busName;
	    private String busType;
	    private Integer totalSeat;
	    @Column(unique = true)
	    private String busNumber;
		public Long getBusId() {
			return busId;
		}
		public void setBusId(Long busId) {
			this.busId = busId;
		}
		public String getBusName() {
			return busName;
		}
		public void setBusName(String busName) {
			this.busName = busName;
		}
		public String getBusType() {
			return busType;
		}
		public void setBusType(String busType) {
			this.busType = busType;
		}
		public Integer getTotalSeat() {
			return totalSeat;
		}
		public void setTotalSeat(Integer totalSeat) {
			this.totalSeat = totalSeat;
		}
		public String getBusNumber() {
			return busNumber;
		}
		public void setBusNumber(String busNumber) {
			this.busNumber = busNumber;
		}
		public Bus(String busName, String busType, Integer totalSeat, String busNumber) {
			super();
			//this.busId = busId;
			this.busName = busName;
			this.busType = busType;
			this.totalSeat = totalSeat;
			this.busNumber = busNumber;
		}

}
