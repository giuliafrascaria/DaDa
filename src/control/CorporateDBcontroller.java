package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.users.CorporateUser;

/**
 * Created by giogge on 27/12/16.
 */
public class CorporateDBcontroller extends DatabaseController
{
    private static CorporateDBcontroller ourInstance = new CorporateDBcontroller();
    public static CorporateDBcontroller getOurInstance(){return ourInstance;}
    private CorporateDBcontroller(){}

    public void addUser(CorporateUser newUser) throws Exception
    {

        super.addRegisteredUser(newUser);

        Connection connection2 = null;

        PreparedStatement statement2 = null;

        final String insert2 = "INSERT INTO USERS.Azienda(NOMEAZIENDA, PROPRIETARIO, EMAIL) values (?, ?, ?)";

        try
        {
            connection2 = provider.getConnection();

            statement2 = connection2.prepareStatement(insert2);
            statement2.setString(1, newUser.getName());
            statement2.setString(2, newUser.getOwner());
            statement2.setString(3, newUser.getEmail());

            statement2.executeUpdate();
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


    public CorporateUser findUser(String email) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        CorporateUser user = null;
        ResultSet result = null;
        final String query = "select * from USERS.Azienda where EMAIL=?";
        //final String query = "select * from USERS.UtenteRegistrato";


        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            result = statement.executeQuery();

            if (result.next()) {
/*                if (user == null) {*/
                user = new CorporateUser();
                user.setEmail(result.getString("EMAIL"));
                user.setName(result.getString("NOMEAZIENDA"));
                System.out.println("nome: "+ user.getName());
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
        return user;
    }

}
