package databaseINIT;

import java.sql.*;

public class Provider {

    private String JDBC_DRIVER;
    private String DB_URL;
    private String USER;
    private String PASS;

    public Provider()
    {
        this.JDBC_DRIVER = "org.postgresql.Driver";

        /*this.DB_URL = "jdbc:postgresql://localhost:5432/ispw";
        this.USER = "superuser";
        this.PASS = "password";*/
        DB_URL = "jdbc:postgresql://localhost:5432/dada";
        USER = "postgres";
        PASS = "postgres";
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
