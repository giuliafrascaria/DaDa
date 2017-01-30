
package exceptions;

public class UserAlreadyRegisteredException extends Exception {


    private static final long serialVersionUID = 698067566767772941L;

    public UserAlreadyRegisteredException() {
        super("There was already an User with the input mail.");
    }

    public UserAlreadyRegisteredException(String mail) {
        super("There was already an User with this email: " + mail);
    }

    public UserAlreadyRegisteredException(Throwable cause) {
        super(cause);
    }
}