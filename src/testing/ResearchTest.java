package testing;

import control.CatalogueController;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.*;

/**
 * Created by dandi on 10/02/17.
 */
public class ResearchTest {
    @Test
    public void createCatalogue() throws Exception {
        try {
            CatalogueController.getInstance().createCatalogue("a", "", "", "", "", "", "", "", 0, "", 0, "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            CatalogueController.getInstance().createCatalogue("", "", "", "", "", "", "", "", -1, "", -1, "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            CatalogueController.getInstance().createCatalogue("a", "a", "a", "a", "a", "a", "a", "a", 0, "a", 0, "a");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}