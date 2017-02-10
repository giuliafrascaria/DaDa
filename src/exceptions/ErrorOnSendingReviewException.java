package exceptions;

/**
 * Created by dandi on 10/02/17.
 */
public class ErrorOnSendingReviewException extends Exception {

    private static final long serialVersionUID = -1637338714287138854L;

    public ErrorOnSendingReviewException()
    {
        super("The passwords do not match.");
    }

    public ErrorOnSendingReviewException(Throwable cause)
    {
        super(cause);
    }

}
