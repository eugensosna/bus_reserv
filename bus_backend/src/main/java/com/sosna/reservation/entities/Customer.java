package com.sosna.reservation.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "customer")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long customerId;
	private String customerName;
	@Column(unique = true)
	private String mobile;
	@Column(unique = true)
	private String email;


	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Customer(Long customerId, String customerName, String mobile, String email) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.mobile = mobile;
		this.email = email;
	}


	public Customer() {
	}

}
