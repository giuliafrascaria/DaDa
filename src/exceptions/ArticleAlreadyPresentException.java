package exceptions;

/**
 * Created by giogge on 28/01/17.
 */
public class ArticleAlreadyPresentException extends Exception{
    private static final long serialVersionUID = 698067566767772941L;

    public ArticleAlreadyPresentException(){super("there is already an article with this email");}
}
