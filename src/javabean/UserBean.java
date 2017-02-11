package javabean;

/**
 * Created by giogge on 23/01/17.
 */

import control.DaDaSystem;
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
    private int accountType;
    private float balance;



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


    public int getAccountType() {
        return accountType;
    }

    public void setAccountType(int accountType) {
        this.accountType = accountType;
    }

    private void fillUserBean(PrivateUser user) {
        this.name = user.getName();
        this.email = user.getEmail();
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public ArrayList<Article> getArticleList(){
        ArrayList<Article> lista = null;
        String generic = "generic";
        String sql = "SELECT * FROM ARTICLES.acquisti, ARTICLES.articolo WHERE ARTICLES.acquisti.ARTICOLO = ARTICLES.articolo.NOME " +
                "AND ARTICLES.acquisti.PROPRIETARIO = ARTICLES.articolo.PROPRIETARIO AND " +
                "UPPER(ARTICLES.acquisti.UTENTE) LIKE UPPER('"+ this.email+"')";
        try {
            System.out.println("faccio la ricerca");
            lista = DaDaSystem.getInstance().searchArticle(sql, generic);
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
