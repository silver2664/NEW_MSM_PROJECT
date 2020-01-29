package com.project.msm.exception;

public class AlreadyExistingEmailException extends RuntimeException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AlreadyExistingEmailException(String message) {
		super(message);
	}

}
