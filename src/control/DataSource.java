package control;

/**
 * Created by giogge on 24/01/17.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DataSource {

    /*private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL= "jdbc:mysql://v2devnull.dyndns.org:3306/mysql?autoReconnect=true&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "ispw2016";

    static
    {
        try
        {
            Class.forName(DRIVER_NAME).newInstance();
            System.out.println("*** Driver loaded");
        }
        catch(Exception e)
        {
            System.out.println("*** Error : "+e.toString());
            System.out.println("*** ");
            System.out.println("*** Error : ");
            e.printStackTrace();
        }

    }

    public static Connection getConnection()throws SQLException, ClassNotFoundException
    {
        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("Database connected!");
        return connection;
    }

*/
    private String dbURI = "jdbc:postgresql://localhost:5432/dada";
    private String user = "postgres";
    private String password = "postgres";

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        DriverManager.registerDriver(new org.postgresql.Driver());

        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(dbURI,user, password);
        return connection;
    }


}



