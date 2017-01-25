
package exceptions;

public class InvalidMailException extends Exception{

    /**
     *
     */
    private static final long serialVersionUID = 5005432979013823797L;

    public InvalidMailException() {
        super("The email is not valid.");
    }

    public InvalidMailException(String mail) {
        super("The email, " + mail + ", is not valid (lack @).");
    }

    public InvalidMailException(Throwable cause) {
        super(cause);
    }
}