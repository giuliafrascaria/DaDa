package control;

import java.sql.*;
import java.util.ArrayList;

import databaseINIT.Provider;
import entity.articles.*;
import entity.users.RegisteredUser;

/**
 * @author dandi
 */

public class DatabaseController {

    private static Provider provider = new Provider();

    //Singleton
    private static DatabaseController instance = new DatabaseController();

    private DatabaseController() {
    }

    public static DatabaseController getInstance(){
        return instance;
    }

    //protected DataSource dataSource;

    public ArrayList<Article> searchArticle(String sql, String kind) throws SQLException {

        Article nuovoArticolo;
        ArrayList<Article> array = new ArrayList<Article>();
        ResultSet rs = null;
        try {
            Statement stmt = provider.getConnection().createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (rs != null) {
            while (rs.next()) {
                if (kind.equals("Book")) {
                    nuovoArticolo = ArticleFactory.getInstance().getBook();
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    nuovoArticolo.setProprietario(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    ((Book) nuovoArticolo).setTitolo(rs.getString("TITOLO"));
                    ((Book) nuovoArticolo).setAutore(rs.getString("AUTORE"));
                    ((Book) nuovoArticolo).setEditore(rs.getString("CASA"));
                    ((Book) nuovoArticolo).setPagine(rs.getInt("PAGINE"));

                } else if (kind.equals("Electronics")) {
                    nuovoArticolo = ArticleFactory.getInstance().getElectronics();
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    nuovoArticolo.setProprietario(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    ((Electronics) nuovoArticolo).setModello(rs.getString("MODELLO"));
                    ((Electronics) nuovoArticolo).setMarca(rs.getString("MARCA"));

                } else if (kind.equals("Clothing")) {
                    nuovoArticolo = ArticleFactory.getInstance().getClothing();
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    nuovoArticolo.setProprietario(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    ((Clothing) nuovoArticolo).setTaglia(rs.getInt("TAGLIA"));
                    ((Clothing) nuovoArticolo).setTipo(rs.getString("TIPO"));
                    ((Clothing) nuovoArticolo).setMarca(rs.getString("MARCA"));

                } else if (kind.equals("TextBook")) {
                    nuovoArticolo = ArticleFactory.getInstance().getTextBook();
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    nuovoArticolo.setProprietario(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    ((TextBook) nuovoArticolo).setEdizione(rs.getInt("EDIZIONE"));
                    ((TextBook) nuovoArticolo).setMateria(rs.getString("MATERIA"));

                } else if (kind.equals("generic")) {
                    nuovoArticolo = ArticleFactory.getInstance().getArticle();
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    nuovoArticolo.setProprietario(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));

                } else {
                    return null;
                }
                array.add(nuovoArticolo);
            }
        }
        return array;
    }

    public boolean checkUser(String mail) throws Exception
    {
        RegisteredUser user;
        System.out.println("sto per cercare l'utente");
        user = this.findByPrimaryKey(mail);
        System.out.println("ricerca finita");
        return user == null;
    }

    private RegisteredUser findByPrimaryKey(String userID) throws Exception
    {

        Connection connection = null;
        PreparedStatement statement = null;
        RegisteredUser user = null;
        ResultSet result = null;
        final String query = "select * from USERS.UtenteRegistrato where EMAIL=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = this.provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, userID);
            result = statement.executeQuery();

            if (result.next()) {
                if (user == null) {
                    user = new RegisteredUser();
                    user.setEmail(result.getString("EMAIL"));
                    //user.setName(result.getString("NOME"));
                    System.out.println(user.getEmail());
                }
            } else {
                return null;
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
        return user;
    }

    void addRegisteredUser(RegisteredUser newUser) throws Exception
    {

        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO USERS.UtenteRegistrato(EMAIL, PASSWORD) values (?,?)";

        try
        {
            connection = this.provider.getConnection();


            statement = connection.prepareStatement(insert);
            statement.setString(1, newUser.getEmail());
            statement.setString(2, String.valueOf((newUser.getPwd())));

            statement.executeUpdate();


        }
        finally
        {
            // release resources
            if(statement != null)
            {
                statement.close();
            }
            if(connection  != null)
            {
                connection.close();
            }
        }



    }
}
/*
public class DatabaseController
{
    protected DataSource dataSource;
    private static DatabaseController ourInstance = new DatabaseController();
    public static DatabaseController getInstance() {
        return ourInstance;
    }

    protected DatabaseController()
    {
        this.dataSource = new DataSource();
    }


    public boolean checkUser(String mail) throws Exception
    {
        RegisteredUser user;
        System.out.println("sto per cercare l'utente");
        user = this.findByPrimaryKey(mail);
        System.out.println("ricerca finita");
        return user == null;
    }

    private RegisteredUser findByPrimaryKey(String userID) throws Exception
    {

        Connection connection = null;
        PreparedStatement statement = null;
        RegisteredUser user = null;
        ResultSet result = null;
        final String query = "select * from USERS.UtenteRegistrato where EMAIL=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = this.dataSource.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, userID);
            result = statement.executeQuery();

            if (result.next()) {
                if (user == null) {
                    user = new RegisteredUser();
                    user.setEmail(result.getString("EMAIL"));
                    //user.setName(result.getString("NOME"));
                    System.out.println(user.getEmail());
                }
            } else {
                return null;
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
        return user;
    }

    void addRegisteredUser(RegisteredUser newUser) throws Exception
    {

        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO USERS.UtenteRegistrato(EMAIL, PASSWORD) values (?,?)";

        try
        {
            connection = this.dataSource.getConnection();


            statement = connection.prepareStatement(insert);
            statement.setString(1, newUser.getEmail());
            statement.setString(2, String.valueOf((newUser.getPwd())));

            statement.executeUpdate();


        }
        finally
        {
            // release resources
            if(statement != null)
            {
                statement.close();
            }
            if(connection  != null)
            {
                connection.close();
            }
        }



    }

}
*/