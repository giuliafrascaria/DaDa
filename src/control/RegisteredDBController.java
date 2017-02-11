package control;

import entity.users.RegisteredUser;

import java.util.ArrayList;
import java.sql.*;

/**
 * Created by v2devnull on 02/02/17.
 */
public class RegisteredDBController extends DatabaseController {

    private static RegisteredDBController ourInstance = new RegisteredDBController();
    public static RegisteredDBController getOurInstance(){return ourInstance;}
    private RegisteredDBController(){
        super();
    }


    public void delete(String email) throws Exception{
        Connection connection = null;
        PreparedStatement statement = null;
        final String query = "DELETE FROM USERS.UtenteRegistrato where email=?";
        try {

            connection = provider.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
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
    }

    public void validate(String email) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;

        final String query = "update USERS.UtenteRegistrato set isvalid=TRUE where email=?";
    try {

        connection = provider.getConnection();
        statement = connection.prepareStatement(query);
        statement.setString(1, email);
        statement.executeUpdate();

    }catch (Exception e){
        e.printStackTrace();
    }
    finally{
        // release resources
        if(statement != null){
            statement.close();
        }
        if(connection  != null){
            connection.close();
        }
    }
    }

    /*list all registered users not validate by the admin*/
    public ArrayList<RegisteredUser> listAllUsers() throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;

        ArrayList<RegisteredUser> listregisteredusers = new ArrayList<RegisteredUser>();
        final String query = "select * from USERS.UtenteRegistrato where isvalid=FALSE";
        try {
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                String email = result.getString(1);
                Integer type = Integer.parseInt(result.getString(2));
                String password = result.getString(3);
                String contatto = result.getString(4);
                Boolean isvalid = result.getBoolean(6);
                RegisteredUser registeredUser = new RegisteredUser(email, type, password, contatto, isvalid);
                listregisteredusers.add(registeredUser);
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
        return listregisteredusers;
    }

}
