package database;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;


/**
 * Created by v2devnull on 17/01/17.
 */

public class DatabaseConnector {
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://v2devnull.dyndns.org:3306/mysql?autoReconnect=true&useSSL=false";
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
}
