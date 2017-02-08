package control;
import entity.articles.Review;
import entity.articles.Article;
import entity.users.RegisteredUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ArticlesController extends DatabaseController{

    private static ArticlesController instance = new ArticlesController();


    private ArticlesController(){
    }

    public static ArticlesController getInstance(){
        return instance;
    }


    public ArrayList<Article> listAllArticles() throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;

        ArrayList<Article> articles = new ArrayList<Article>();
        final String query = "select * " +
                "from ARTICLES.articolo" +
                "group by PROPRIETARIO";
        try {
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                String nome = result.getString(1);
                String proprietario = result.getString(2);
                RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                ru.setEmail(proprietario);
                Integer prezzo = Integer.parseInt(result.getString(3));
                Integer quantità = Integer.parseInt(result.getString(4));
                Boolean isvalid = result.getBoolean(5);
                String immagine = result.getString(6);

                Article article = new Article(nome, ru, prezzo, quantità, isvalid, immagine);
                articles.add(article);
            }

        }finally{
            // release resources
            if(result != null){
                result.close();
            }
            // release resources
            if(statement != null){
                statement.close();
            }
            if(connection  != null){
                connection.close();
            }
        }
        return articles;
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
