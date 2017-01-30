package exceptions;

public class IncompleteFormException extends Exception {

    /**
     *
     */
    private static final long serialVersionUID = 6479739361354063906L;

    public IncompleteFormException() {
        super("The form is not fully completed.");
    }

    public IncompleteFormException(Throwable cause) {
        super(cause);
    }
}
