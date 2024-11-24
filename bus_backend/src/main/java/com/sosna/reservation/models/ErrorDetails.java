package com.sosna.reservation.models;

public class ErrorDetails {
	private int errorCode;
	private String errorMessage;
	private String devErrorMessage;
	private Long timestamp;
	public ErrorDetails(int errorCode, String errorMessage, String devErrorMessage, Long timestamp) {
		super();
		this.errorCode = errorCode;
		this.errorMessage = errorMessage;
		this.devErrorMessage = devErrorMessage;
		this.timestamp = timestamp;
	}
	public ErrorDetails() {
		super();
	}
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public String getDevErrorMessage() {
		return devErrorMessage;
	}
	public void setDevErrorMessage(String devErrorMessage) {
		this.devErrorMessage = devErrorMessage;
	}
	public Long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}
	

}
