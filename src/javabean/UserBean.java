package javabean;

/**
 * Created by giogge on 23/01/17.
 */

import control.DatabaseController;
import entity.articles.Article;
import entity.users.PrivateUser;

import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Bean to perform the login.
 *
 * @author Mario
 */
public class UserBean
{
    private String name;
    private String email;


    public UserBean() {
    }

    /**
     * Getter for the attribute firstName.
     *
     * @return String first name of the user.
     */
    public String getName() {
        return name;
    }

    /**
     * Setter for the attribute firstName.
     *
     * @param name new first name of the user.
     */
    public void setName(String name) {
        this.name = name;
    }


    /**
     * Getter for the attribute email.
     *
     * @return String mail of the user.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Setter for the attribute email.
     *
     * @param email new mail of the user.
     */
    public void setEmail(String email) {
        this.email = email;
    }



    private void fillUserBean(PrivateUser user) {
        this.name = user.getName();
        this.email = user.getEmail();
    }

    /**
     * Principal method for the bean, it calls the controller
     * and control the input parameters.
     *
     * @param password the password of the user.
     * @return 0 if the login goes right
     * @return 1 if the user with email doesn't exist
     * @return 2 if the password for the entered email is incorrect
     * @return 3 if there was some error
     * @return 4 if is an administrator
     */
    public int validate(String password) {
        /*LoginController controller = LoginController.getInstance();
        try {
            UserInfo info = controller.login(this.email, password);
            this.fillUserBean(info);
            return 0;
        } catch (WrongPasswordException e) {
            return 2;
        } catch (UserDoNotExistsException e) {
            return 1;
        }catch (AdminException e) {
            this.firstName = "admin";
            this.accountType = "admin";
            this.email = "admin";
            this.premium = "admin";
            return 4;
        }catch(Exception e) {
            return 3;
        }*/
        return 1;
    }

    public ArrayList<Article> getArticleList(){
        ArrayList<Article> lista = null;
        String generic = "generic";
        String sql = "SELECT * FROM ARTICLES.acquisti, ARTICLES.articolo WHERE ARTICLES.acquisti.ARTICOLO = ARTICLES.articolo.NOME " +
                "AND ARTICLES.acquisti.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND " +
                "UPPER(ARTICLES.acquisti.UTENTE) LIKE UPPER('"+ this.email+"')";
        try {
            System.out.println("faccio la ricerca");
            lista = DatabaseController.getInstance().searchArticle(sql, generic);
            System.out.println("esco dalla ricerca");
            if(lista.size() == 0) {
                System.out.println("è a null");
                lista = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("ritorno la lista");
        return lista;
    }
}
