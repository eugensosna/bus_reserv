package com.sosna.reservation.entities;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.UUID;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.Version;

import com.github.f4b6a3.uuid.UuidCreator;

import jakarta.persistence.*;

@Entity
public class Bus {
	public static final String COLUMN_UUID = "UUID";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long busId;

	//@GeneratedValue(generator = "UUID")
	//@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")`
	//@GeneratedValue
	@Column(name = COLUMN_UUID, updatable = false, nullable = false, columnDefinition = "UUID")
	private UUID uuid;
	@Version
	//@Column()
	private Long version;

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

	public UUID getUuid() {
		return uuid;
	}

	public Bus(Long busId, UUID uuid, Long version, String busName, String busType, Integer totalSeat,
			String busNumber) {
		super();
		this.busId = busId;
		this.uuid = uuid;
		this.version = version;
		this.busName = busName;
		this.busType = busType;
		this.totalSeat = totalSeat;
		this.busNumber = busNumber;
	}

	public void setUuid(UUID uuid) {
		this.uuid = uuid;
	}

	/*public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}*/

	public Bus(Long busId, String busName, String busType, Integer totalSeat, String busNumber) {
		super();
		this.busId = busId;
		this.busName = busName;
		this.busType = busType;
		this.totalSeat = totalSeat;
		this.busNumber = busNumber;
	}

	public Bus() {
		uuid = UuidCreator.getTimeOrderedEpoch();

	}

}
