package exceptions;

public class UserDoNotExistsException extends Exception {
	//Mario exception for the login

	/**
	 * 
	 */
	private static final long serialVersionUID = -5773567565541794812L;
	
	public UserDoNotExistsException() {
		super("The user with the entered email does not exist.");
	}
	public UserDoNotExistsException(String mail) {
		super("The user with this email: " + mail + "do not exist.");
	}
	public UserDoNotExistsException(Throwable cause) {
		super(cause);
	}


}
