package control;


import entity.articles.Electronics;
import entity.users.PrivateUser;

import java.sql.*;

public class PrivateDBcontroller extends DatabaseController
{
    private static PrivateDBcontroller ourInstance = new PrivateDBcontroller();
    public static PrivateDBcontroller getOurInstance(){return ourInstance;}
    private PrivateDBcontroller(){
        super();
    }

    public void addUser(PrivateUser newUser) throws Exception
    {

        super.addRegisteredUser(newUser);

        Connection connection2 = null;

        PreparedStatement statement2 = null;

        final String insert2 = "INSERT INTO USERS.Privato(NOME, COGNOME, EMAIL, SALDO) values (?,?,?, 0)";

        try
        {
            connection2 = provider.getConnection();

            statement2 = connection2.prepareStatement(insert2);
            statement2.setString(1, newUser.getName());
            statement2.setString(2, newUser.getSurname());
            statement2.setString(3, newUser.getEmail());

            statement2.executeUpdate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement2 != null)
            {
                statement2.close();
            }

            if(connection2  != null)
            {
                connection2.close();
            }
        }
    }

    public PrivateUser findUser(String email) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        PrivateUser user = null;
        ResultSet result = null;
        final String query = "select * from USERS.Privato where EMAIL=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            result = statement.executeQuery();

            if (result.next()) {
/*                if (user == null) {*/
                user = new PrivateUser();
                user.setEmail(result.getString("EMAIL"));
                user.setName(result.getString("NOME"));
                user.setType(1);
                user.setBalance(result.getFloat("SALDO"));
                System.out.println("nome ritrovato: " + user.getName());
/*                }*/
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
        System.out.println("nome utente: " + user.getName());
        return user;
    }

    public float addMoney(String email, float money) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        PrivateUser user = null;
        ResultSet result = null;
        final String query = "UPDATE USERS.Privato SET SALDO=? WHERE EMAIL=?";
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
        return money;
    }

    public boolean removeMoney(String user, float newbalance)
    {
        String sql = "UPDATE USERS.Privato SET SALDO='"+ newbalance +"' WHERE EMAIL = '"+ user+"'";
        try{
            Statement stmt = provider.getConnection().createStatement();
            System.out.println("successo");
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("fallimento");
            return false;
        }
        return true;
    }
}
