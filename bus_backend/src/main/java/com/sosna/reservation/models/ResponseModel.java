package com.sosna.reservation.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ResponseModel <T>{
	


	private int statusCode;
	
	private String message;
	
	private T response;

	public ResponseModel(int statusCode, String message, T response) {
		super();
		this.statusCode = statusCode;
		this.message = message;
		this.response = response;
	}
	
	
	

}
