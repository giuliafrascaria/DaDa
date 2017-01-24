package control;

import entity.users.RegisteredUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




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
