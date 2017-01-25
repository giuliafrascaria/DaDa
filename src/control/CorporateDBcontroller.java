package control;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
