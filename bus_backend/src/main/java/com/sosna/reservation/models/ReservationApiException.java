package com.sosna.reservation.models;

import org.springframework.http.HttpStatus;
S
public class ReservationApiException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	private final HttpStatus status;
	private final String message;

	public ReservationApiException(HttpStatus status, String message) {
		super();
		this.status = status;
		this.message = message;
	}

}
