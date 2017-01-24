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

class ArticleFactory {

    //Singleton
    private static ArticleFactory instance = new ArticleFactory();

    private ArticleFactory() {
    }

    static ArticleFactory getInstance(){
        return instance;
    }

    Article getArticle(){
        return new Article();
    }
    Book getBook(){
        return new Book();
    }
    Clothing getClothing(){
        return new Clothing();
    }
    Electronics getElectronics(){
        return new Electronics();
    }
    TextBook getTextBook(){
        return new TextBook();
    }

}
