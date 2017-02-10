package exceptions;


public class NoArticlesReturned extends Exception{

    private static final long serialVersionUID = -1637338714287138854L;

    public NoArticlesReturned()
    {
        super("There is no articles that corrispondes to parameters");
    }

    public NoArticlesReturned(Throwable cause)
    {
        super(cause);
    }
}
