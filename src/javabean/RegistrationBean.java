package javabean;

import control.DatabaseController;

import java.io.Serializable;

/**
 * Created by giogge on 24/01/17.
 */
public class RegistrationBean implements Serializable {

    private DatabaseController dbController = DatabaseController.getInstance();

    private String name, surname, email;
    private char[] pwd;

    public RegistrationBean()
    {
        this.name = "";
        this.surname = "";
        this.email = "";
    }

    public boolean validate() throws Exception
    {
        return dbController.checkUser(email);
    }

}
