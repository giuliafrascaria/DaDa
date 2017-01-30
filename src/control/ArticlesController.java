package control;
import entity.articles.Review;


public class ArticlesController {

    private static ArticlesController instance = new ArticlesController();


    private ArticlesController(){
    }

    public static ArticlesController getInstance(){
        return instance;
    }

    public int sendReview(String text, String articlename, String username, int rating, String owner) throws ClassNotFoundException {
    /*invia la query al database e torna 1 in caso di successo, 0 o 2 altrimenti*/

        if(text.length() > 300)
            return 2;
        else {
            Review review;
            if (rating > 0)
                review = ArticleFactory.getInstance().getReview(rating, text.replace("\'", "\""), username, articlename, owner, false);
            else
                review = ArticleFactory.getInstance().getReview(0, text.replace("\'", "\""), username, articlename, owner, false);
            if (DatabaseController.getInstance().setReview(review)) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    public int sendWarning(String text, String vendor, String username,String articlename) throws ClassNotFoundException {

    /*come sendReview ma invia una segnalazione e non una recensione*/
        System.out.println("sono qui ------------");
        Review review = ArticleFactory.getInstance().getReview(0, text.replace("\'", "\""), username, articlename, vendor, true);
        if(DatabaseController.getInstance().setReview(review))
            return 1;
        else
            return 0;
    }

}
