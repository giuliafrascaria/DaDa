package javabean;

import control.DatabaseController;
import control.UserFactory;
import entity.users.PrivateUser;
import exceptions.UserAlreadyRegisteredException;

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

    public boolean validate()
    {

        try {
            if (dbController.checkUser(email)) {
                System.out.println("aggiungi questo utente");

                //PrivateUser newUser = UserFactory.getInstance().createUser();
                //aggiungi utente
                return true;
            }
            else
            {
                throw new UserAlreadyRegisteredException();

            }
        }catch (UserAlreadyRegisteredException e)
        {
            System.out.println("this user already exists");
            return false;
        }
        catch (Exception e)
        {
            System.out.println("exception");
            return false;
        }
    }

}
