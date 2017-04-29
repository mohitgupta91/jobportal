package com.job.sro;

public class ResponseSRO {

	private String message;

	private Boolean error;

	public ResponseSRO(String message, Boolean error) {
		this.message = message;
		this.error = error;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Boolean getError() {
		return error;
	}

	public void setError(Boolean error) {
		this.error = error;
	}
}
