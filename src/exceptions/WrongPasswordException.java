package exceptions;

public class WrongPasswordException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1913477070690250120L;

	public WrongPasswordException() {
		super("The password associated with the input mail is wrong.");
	}

	public WrongPasswordException(Throwable cause) {
		super(cause);
	}
}
