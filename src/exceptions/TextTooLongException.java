package exceptions;


public class TextTooLongException extends Exception {

    private static final long serialVersionUID = -1637338714287138854L;

    public TextTooLongException()
    {
        super("The text is too long");
    }

    public TextTooLongException(Throwable cause)
    {
        super(cause);
    }
}
