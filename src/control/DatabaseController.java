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

    protected static Provider provider = new Provider();

    //Singleton
    private static DatabaseController instance = null;

    DatabaseController() {
    }

    public static synchronized DatabaseController getInstance()
    {
        if(instance == null)
        {
            instance = new DatabaseController();
        }
        return instance;
    }

    synchronized ArrayList<Article> searchArticle(String sql, String kind) throws SQLException
    {

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
                    nuovoArticolo = ArticleFactory.getInstance().getArticolo("book");
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                    ru.setEmail(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setProprietario(ru);
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    nuovoArticolo.setImage(rs.getInt("IMMAGINE"));
                    ((Book) nuovoArticolo).setTitolo(rs.getString("TITOLO"));
                    ((Book) nuovoArticolo).setAutore(rs.getString("AUTORE"));
                    ((Book) nuovoArticolo).setEditore(rs.getString("CASA"));
                    ((Book) nuovoArticolo).setPagine(rs.getInt("PAGINE"));

                } else if (kind.equals("Electronics")) {
                    nuovoArticolo = ArticleFactory.getInstance().getArticolo("electronics");
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                    ru.setEmail(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setProprietario(ru);
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    nuovoArticolo.setImage(rs.getInt("IMMAGINE"));
                    ((Electronics) nuovoArticolo).setModello(rs.getString("MODELLO"));
                    ((Electronics) nuovoArticolo).setMarca(rs.getString("MARCA"));

                } else if (kind.equals("Clothing")) {
                    nuovoArticolo = ArticleFactory.getInstance().getArticolo("clothing");
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                    ru.setEmail(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setProprietario(ru);
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    nuovoArticolo.setImage(rs.getInt("IMMAGINE"));
                    ((Clothing) nuovoArticolo).setTaglia(rs.getInt("TAGLIA"));
                    ((Clothing) nuovoArticolo).setTipo(rs.getString("TIPO"));
                    ((Clothing) nuovoArticolo).setMarca(rs.getString("MARCA"));

                } else if (kind.equals("TextBook")) {
                    nuovoArticolo = ArticleFactory.getInstance().getArticolo("textBook");
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                    ru.setEmail(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setProprietario(ru);
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    nuovoArticolo.setImage(rs.getInt("IMMAGINE"));
                    ((TextBook) nuovoArticolo).setEdizione(rs.getInt("EDIZIONE"));
                    ((TextBook) nuovoArticolo).setMateria(rs.getString("MATERIA"));

                } else if (kind.equals("generic")) {
                    nuovoArticolo = ArticleFactory.getInstance().getArticolo("article");
                    nuovoArticolo.setNome(rs.getString("NOME"));
                    RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                    ru.setEmail(rs.getString("PROPRIETARIO"));
                    nuovoArticolo.setProprietario(ru);
                    nuovoArticolo.setPrezzo(rs.getFloat("PREZZO"));
                    nuovoArticolo.setQuantità(rs.getInt("QUANTITA"));
                    nuovoArticolo.setImage(rs.getInt("IMMAGINE"));

                } else {
                    return null;
                }
                array.add(nuovoArticolo);
            }
        }
        return array;
    }

    synchronized boolean checkUser(String mail) throws Exception
    {

        RegisteredUser user;
        System.out.println("sto per cercare l'utente");
        user = this.findByPrimaryKey(mail);
        System.out.println("ricerca finita");
/*            return user == null;*/
        return user == null;

    }

    synchronized RegisteredUser findByPrimaryKey(String userID) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        RegisteredUser user = null;
        ResultSet result = null;
        String query = "select * from USERS.UtenteRegistrato where EMAIL=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, userID);
            result = statement.executeQuery();

            if (result.next()) {
/*                if (user == null) {*/
                    user = UserFactory.getInstance().createRegisteredUser();

                    user.setEmail(result.getString("EMAIL"));
                    user.setPwd(result.getString("PASSWORD"));
                    user.setType(result.getInt("ACCOUNTTYPE"));
                    user.setBalance(result.getFloat("SALDO"));
                    user.setValid(result.getBoolean("ISVALID"));
                    //user.setName(result.getString("NOME"));
                    System.out.println("email presa dal database controller = " + user.getEmail());
/*                }*/
            } else {
                return null;
            }
        }
        finally
        {
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

    synchronized void addRegisteredUser(RegisteredUser newUser) throws SQLException
    {


        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO USERS.UtenteRegistrato(EMAIL, ACCOUNTTYPE, PASSWORD, ISVALID, SALDO) values (?, ?, ?, FALSE, 0 )";

        try
        {
            connection = provider.getConnection();

            statement = connection.prepareStatement(insert);
            statement.setString(1, newUser.getEmail());
            statement.setString(2, String.valueOf((newUser.getType())));
            statement.setString(3, String.valueOf((newUser.getPwd())));

            statement.executeUpdate();

        }
        catch (Exception e)
        {
            e.printStackTrace();
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

    synchronized boolean setReview(Review review) throws ClassNotFoundException
    {
        String sql = "INSERT INTO ARTICLES.recensione (SEGNALAZIONE, UTENTE, ARTICOLO, PROPRIETARIO, TESTO, RAITNG, TOCHECK) VALUES ("+
                review.isWarning() +", '" + review.getUser()+"', '" +
                review.getArticle()+"', '"+ review.getOwner() +"' , '" + review.getReview()+
                "' , '" + review.getRating()+"' , TRUE)";

        System.out.println(sql);
        try {
            Statement stmt = provider.getConnection().createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("fallimento");
            return false;
        }
        return true;
    }

    synchronized int setWarningUser(String testo, String proprietario, String utente) throws ClassNotFoundException
    {
        String sql = "INSERT INTO ARTICLES.segnalazioneUtente (UTENTE, PROPRIETARIO, TESTO, TOCHECK) VALUES ("+
                "'" + utente +"', '"+ proprietario +"' , '" + testo +
                "' , TRUE)";

        System.out.println(sql);
        try {
            Statement stmt = provider.getConnection().createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("fallito");
            return 0;
        }
        return 1;
    }

    synchronized ArrayList<String> getArticles(String sql) throws SQLException, ClassNotFoundException
    {
        ArrayList<String> articoli = new ArrayList<String>();
        Statement stmt = provider.getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        if(rs != null){
            while(rs.next()){
                articoli.add(rs.getString("NOME"));
                articoli.add(rs.getString("PROPRIETARIO"));
            }
        }
        return articoli;
    }

    synchronized boolean decreaseQuantity(String articleName, String proprietario, int quantitatot){
        String sql = "UPDATE ARTICLES.articolo SET QUANTITA='"+ quantitatot+ "' WHERE NOME = '"+ articleName+"' AND PROPRIETARIO = '"+proprietario+"'";
        System.out.println(sql);
        try{
            Statement stmt = provider.getConnection().createStatement();
            stmt.executeUpdate(sql);
            System.out.println("successo");
        } catch (SQLException e) {
            System.out.println("fallimento");
            return false;
        }
        return true;
    }

    synchronized void addArticle(Article article) throws Exception
    {


        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO ARTICLES.Articolo(NOME, PROPRIETARIO, PREZZO, QUANTITA, ISVALID) values (?,?,?,?, FALSE )";

        try
        {
            connection = provider.getConnection();

            statement = connection.prepareStatement(insert);
            statement.setString(1, article.getNome());
            statement.setString(2, article.getProprietario().getEmail());
            statement.setFloat(3, article.getPrezzo());
            statement.setInt(4, article.getQuantità());

            statement.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                statement.close();
            }

            if(connection != null)
            {
                connection.close();
            }

        }
    }

    synchronized void addBook(Book book) throws Exception
    {


        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO ARTICLES.libro(TITOLO, PROPRIETARIO, NOME, AUTORE, CASA) values (?,?,?,?,?)";

        try
        {
            connection = provider.getConnection();

            statement = connection.prepareStatement(insert);
            statement.setString(1, book.getTitolo());
            statement.setString(2, book.getProprietario().getEmail());
            statement.setString(3, book.getNome());
            statement.setString(4, book.getAutore());
            statement.setString(4, book.getEditore());

            statement.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                statement.close();
            }

            if(connection != null)
            {
                connection.close();
            }

        }
    }

    synchronized void addElectronics(Electronics electronics) throws Exception
    {


        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO ARTICLES.informatica(TIPO, PROPRIETARIO, NOME, MODELLO, MARCA) values (?,?,?,?,? )";

        try
        {
            connection = provider.getConnection();

            statement = connection.prepareStatement(insert);
            statement.setString(1, electronics.getTipo());
            statement.setString(2, electronics.getProprietario().getEmail());
            statement.setString(3, electronics.getNome());
            statement.setString(4, electronics.getModello());
            statement.setString(5, electronics.getMarca());

            statement.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                statement.close();
            }

            if(connection != null)
            {
                connection.close();
            }

        }
    }

    synchronized void addClothing(Clothing clothing) throws Exception
    {


        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO ARTICLES.Abbigliamento(TIPO, PROPRIETARIO, NOME, TAGLIA, MARCA) values (?,?,?,?,?)";

        try
        {
            connection = provider.getConnection();

            statement = connection.prepareStatement(insert);
            statement.setString(2, clothing.getTipo());
            statement.setString(2, clothing.getProprietario().getEmail());
            statement.setString(3, clothing.getNome());
            statement.setInt(4, clothing.getTaglia());
            statement.setString(5, clothing.getMarca());


            statement.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                statement.close();
            }

            if(connection != null)
            {
                connection.close();
            }

        }
    }

    synchronized void addTextBook(TextBook textBook) throws Exception
    {


        Connection connection = null;

        PreparedStatement statement = null;

        final String insert = "INSERT INTO ARTICLES.Scolastico(MATERIA, PROPRIETARIO, NOME, EDIZIONE) values (?,?,?,?)";

        try
        {
            connection = provider.getConnection();

            statement = connection.prepareStatement(insert);
            statement.setString(1, textBook.getMateria());
            statement.setString(2, textBook.getProprietario().getEmail());
            statement.setString(3, textBook.getNome());
            statement.setString(4, textBook.getEditore());

            statement.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                statement.close();
            }

            if(connection != null)
            {
                connection.close();
            }

        }
    }

    synchronized boolean checkArticle(String name, String mail) throws Exception
    {

        Article article;
        System.out.println("sto per cercare l'articolo");
        article = this.findByPrimaryKey(name, mail);
        System.out.println("ricerca finita");
        return article == null;

    }

    private synchronized Article findByPrimaryKey(String name, String owner) throws Exception
    {

        Connection connection = null;
        PreparedStatement statement = null;
        Article article = null;
        ResultSet result = null;
        final String query = "select * from ARTICLES.Articolo where NOME=? AND PROPRIETARIO=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, owner);
            result = statement.executeQuery();

            if (result.next()) {

                article = ArticleFactory.getInstance().getArticolo("article");

                article.setNome(result.getString("NOME"));
                RegisteredUser ru = UserFactory.getInstance().createRegisteredUser();
                ru.setEmail(result.getString("PROPRIETARIO"));
                article.setProprietario(ru);
                //user.setName(result.getString("NOME"));
                System.out.println("articolo già presente nel database");

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
        return article;

    }

    synchronized String getImageName(String name, String owner) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        String imageName;
        ResultSet result = null;
        final String query = "select IMMAGINE from ARTICLES.Articolo where NOME=? AND PROPRIETARIO=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, owner);
            result = statement.executeQuery();

            if (result.next()) {
                imageName = result.getString("IMMAGINE");
                System.out.println("nome immagine: " + imageName);

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
        return imageName;
    }

    synchronized boolean addMoney(String email, float money) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        final String query = "UPDATE USERS.UtenteRegistrato SET SALDO=? WHERE EMAIL=?";
        //final String query = "select * from USERS.UtenteRegistrato";

        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setFloat(1, money);
            statement.setString(2, email);

            statement.executeUpdate();
        }finally{

            // release resources
            if(statement != null){
                statement.close();
            }
            if(connection  != null){
                connection.close();
            }
        }
        return true;
    }

    synchronized public ArrayList<Article> listAllArticles() throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;

        ArrayList<Article> articles = new ArrayList<Article>();
        final String query = "select * " +
                "from ARTICLES.articolo";
        try {
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                String nome = result.getString(1);
                //System.out.println(nome + "\n");
                String proprietario = result.getString(2);
                RegisteredUser ru = new RegisteredUser(proprietario);
                //System.out.println(proprietario + "\n");
                Float prezzo = Float.parseFloat(result.getString(3));
                //System.out.print(prezzo  + "\n");
                Integer quantità = Integer.parseInt(result.getString(4));
                //System.out.print(quantità + "\n");
                Boolean isvalid = result.getBoolean(5);
                //System.out.print(isvalid  + "\n");
                String immagine = result.getString(6);
                //System.out.println(immagine + "\n");

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
}
