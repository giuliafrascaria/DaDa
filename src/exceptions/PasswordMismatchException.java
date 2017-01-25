package exceptions;

/**
 * Created by giogge on 26/12/16.
 */
public class PasswordMismatchException extends Exception
{

        private static final long serialVersionUID = -1637338714287138854L;

        public PasswordMismatchException()
        {
            super("The passwords do not match.");
        }

        public PasswordMismatchException(Throwable cause)
        {
            super(cause);
        }

}
