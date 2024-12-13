package com.sosna.reservation.models;

public class AuthResponseModel {
	private int statusCode;
	private String message;
	private String accessToken;
	private Long loginTime;
	private Long expirationDuration;
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public Long getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Long loginTime) {
		this.loginTime = loginTime;
	}
	public Long getExpirationDuration() {
		return expirationDuration;
	}
	public void setExpirationDuration(Long expirationDuration) {
		this.expirationDuration = expirationDuration;
	}
	public AuthResponseModel() {
		super();
	}
	public AuthResponseModel(int statusCode, String message, String accessToken, Long loginTime,
			Long expirationDuration) {
		super();
		this.statusCode = statusCode;
		this.message = message;
		this.accessToken = accessToken;
		this.loginTime = loginTime;
		this.expirationDuration = expirationDuration;
	}
	
	
}
