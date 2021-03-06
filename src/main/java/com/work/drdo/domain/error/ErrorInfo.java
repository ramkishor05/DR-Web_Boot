// Generated by delombok at Wed May 25 04:56:32 CDT 2016

package com.work.drdo.domain.error;

import java.util.LinkedList;
import java.util.List;
import static ch.lambdaj.Lambda.extract;
import static ch.lambdaj.Lambda.on;

public class ErrorInfo {
	private List<Error> errors = new LinkedList<Error>();
	
	public ErrorInfo(String msg) {
		errors.add(new Error(msg));
	}
	
	public ErrorInfo(String code, String msg) {
		errors.add(new Error(code, msg));
	}
	
	public List<String> getAllErrors() {
		return extract(errors, on(Error.class).getErrorMessage());
	}
	
	public List<Error> getAll() {
		return errors;
	}
	
	protected class Error {
		private String errorCode;
		private String errorMessage;
		
		public Error(String errorMessage) {
			this.errorMessage = errorMessage;
		}
		
		public Error(String errorCode, String errorMessage) {
			this(errorMessage);
			this.errorCode = errorCode;
		}
		
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public String getErrorCode() {
			return this.errorCode;
		}
		
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public String getErrorMessage() {
			return this.errorMessage;
		}
		
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public void setErrorCode(final String errorCode) {
			this.errorCode = errorCode;
		}
		
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public void setErrorMessage(final String errorMessage) {
			this.errorMessage = errorMessage;
		}
		
		@java.lang.Override
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public boolean equals(final java.lang.Object o) {
			if (o == this) return true;
			if (!(o instanceof ErrorInfo.Error)) return false;
			final Error other = (Error)o;
			if (!other.canEqual((java.lang.Object)this)) return false;
			final java.lang.Object this$errorCode = this.getErrorCode();
			final java.lang.Object other$errorCode = other.getErrorCode();
			if (this$errorCode == null ? other$errorCode != null : !this$errorCode.equals(other$errorCode)) return false;
			final java.lang.Object this$errorMessage = this.getErrorMessage();
			final java.lang.Object other$errorMessage = other.getErrorMessage();
			if (this$errorMessage == null ? other$errorMessage != null : !this$errorMessage.equals(other$errorMessage)) return false;
			return true;
		}
		
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		protected boolean canEqual(final java.lang.Object other) {
			return other instanceof ErrorInfo.Error;
		}
		
		@java.lang.Override
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public int hashCode() {
			final int PRIME = 59;
			int result = 1;
			final java.lang.Object $errorCode = this.getErrorCode();
			result = result * PRIME + ($errorCode == null ? 0 : $errorCode.hashCode());
			final java.lang.Object $errorMessage = this.getErrorMessage();
			result = result * PRIME + ($errorMessage == null ? 0 : $errorMessage.hashCode());
			return result;
		}
		
		@java.lang.Override
		@java.lang.SuppressWarnings("all")
		@javax.annotation.Generated("lombok")
		public java.lang.String toString() {
			return "ErrorInfo.Error(errorCode=" + this.getErrorCode() + ", errorMessage=" + this.getErrorMessage() + ")";
		}
	}
}