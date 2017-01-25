package javabean;


import control.PrivateDBcontroller;
import control.UserFactory;
import entity.users.PrivateUser;
import exceptions.UserAlreadyRegisteredException;

import java.io.Serializable;
import java.sql.SQLException;


public class RegistrationBean implements Serializable {

    private PrivateDBcontroller dbController = PrivateDBcontroller.getOurInstance();


    private String name, surname, email;
    private char[] pwd;

    private PrivateUser user;

    public RegistrationBean()
    {
        this.name = "";
        this.surname = "";
        this.email = "";

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public char[] getPwd() {
        return pwd;
    }

    public void setPwd(char[] pwd) {
        this.pwd = pwd;
    }

    private void saveData(String name, String email, String surname, char[] pwd)
    {
        user = UserFactory.getInstance().createUser();

        System.out.println("creato utente");

        user.setName(name);
        System.out.println(user.getName());
        user.setSurname(surname);
        System.out.println(user.getSurname());
        user.setEmail(email);
        System.out.println(user.getEmail());
        user.setPwd(pwd);
        System.out.println(user.getPwd());

        System.out.println("ggggggg");
    }



    public boolean validate()
    {

        try {
            if (dbController.checkUser(email)) {
                System.out.println("aggiungi questo utente");

                saveData(this.name, this.email, this.surname, this.pwd);
                dbController.addUser(this.user);

                System.out.println("utente aggiunto");
                //aggiungi utente
                return true;
            }
            else
            {
                throw new UserAlreadyRegisteredException();

            }
        }
        catch (UserAlreadyRegisteredException e)
        {
            System.out.println("this user already exists");
            return false;
        }
        catch (SQLException e)
        {
            System.out.println("SQLexception");
            e.printStackTrace();
            return false;
        }
        catch (Exception e)
        {
            System.out.println("exception non meglio identificata");
            return false;
        }
    }

}
