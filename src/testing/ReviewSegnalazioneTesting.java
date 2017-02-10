package testing;

import control.ArticlesController;
import databaseINIT.Provider;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

import java.sql.SQLException;
import java.sql.Statement;

import static org.junit.Assert.*;


public class ReviewSegnalazioneTesting {

    @Test
    public void sendReview() throws Exception {
        Assert.assertEquals(1, ArticlesController.getInstance().sendReview("testo", "Lieve", "a", 0, "simone@gmail.com"));
        Assert.assertEquals(0, ArticlesController.getInstance().sendReview("testo", "Lieve", "a", 0, "simone@gmail.com"));

        String sql = "DELETE FROM ARTICLES.recensione WHERE UPPER(UTENTE) " +
                "LIKE UPPER('a') AND UPPER(ARTICOLO) LIKE UPPER('Lieve')";

        Statement stmt;
        Provider p = new Provider();
        try {
            stmt = p.getConnection().createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}