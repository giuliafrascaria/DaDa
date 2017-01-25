package databaseINIT;

import java.sql.*;

public class Provider {

    private String JDBC_DRIVER;
    private String DB_URL;
    private String USER;
    private String PASS;


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


    public Provider()
    {
        this.JDBC_DRIVER = "org.postgresql.Driver";
        this.DB_URL = "jdbc:postgresql://localhost:5432/ispw";
        this.USER = "superuser";
        this.PASS = "password";

/*        DB_URL = "jdbc:postgresql://localhost:5432/dada";
        USER = "postgres";
        PASS = "postgres";*/
    }



    public Connection getConnection()
    {
        Connection conn = null;
        try {

            Class.forName(this.JDBC_DRIVER);
            conn = DriverManager.getConnection(this.DB_URL, this.USER, this.PASS);

        } catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }

}
