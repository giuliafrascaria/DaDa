package control;

import entity.articles.*;

/**
 * @author dandi
 * <p>
 * Questa classe è stata sviluppata come un Singleton.
 * Si occupa solamente di creare una interfaccia grafica per l'utente, prendere i dati inseriti
 * e passarli a un controller
 * <p>
 */

public class ArticleFactory {

    //Singleton
    private static ArticleFactory instance = new ArticleFactory();

    private ArticleFactory() {
    }

    public static ArticleFactory getInstance(){
        return instance;
    }

    public Article getArticolo(String kind){
        if (kind.equals("article")) {
            return getArticle();
        } else if (kind.equals("book")) {
            return getBook();
        } else if (kind.equals("clothing")) {
            return getClothing();
        } else if (kind.equals("electronics")) {
            return getElectronics();
        } else if (kind.equals("textBook")) {
            return getTextBook();
        } else {
            return null;
        }
    }

    private Article getArticle(){
        return new Article();
    }
    private Book getBook(){
        return new Book();
    }
    private Clothing getClothing(){
        return new Clothing();
    }
    private Electronics getElectronics(){
        return new Electronics();
    }
    private TextBook getTextBook(){
        return new TextBook();
    }

    Review getReview(int rating, String text, String user, String article, String owner, boolean warning){

        Review review = new Review();

        review.setOwner(owner);
        review.setArticle(article);
        review.setWarning(warning);
        review.setReview(text);
        review.setUser(user);
        review.setRating(rating);

        return review;
    }

}
