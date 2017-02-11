package control;


import entity.users.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class AdminDBController extends DatabaseController{

    private static AdminDBController ourInstance = new AdminDBController();
    public static AdminDBController getOurInstance(){return ourInstance;}
    private AdminDBController(){
        super();
    }


    public Admin findAdmin(String email) throws Exception
    {
        Connection connection = null;
        PreparedStatement statement = null;
        Admin admin = null;
        ResultSet result = null;
        final String query = "select * from USERS.Admin where EMAIL=?";

        try{
            connection = provider.getConnection();

            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            result = statement.executeQuery();

            if (result.next()) {
                admin = new Admin();
                admin.setEmail(result.getString("EMAIL"));
                admin.setName(result.getString("NOME"));
                admin.setType(0);
                System.out.println("nome ritrovato: " + admin.getName());
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
        System.out.println("nome utente: " + admin.getName());
        return admin;
    }
}
