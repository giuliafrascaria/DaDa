package javabean;



import control.CorporateDBcontroller;
import control.UserFactory;
import entity.users.CorporateUser;
import exceptions.UserAlreadyRegisteredException;

import java.io.Serializable;
import java.sql.SQLException;


public class CorpRegistrationBean implements Serializable {

    private CorporateDBcontroller dbController = CorporateDBcontroller.getOurInstance();


    private String name, owner, email, password;


    private CorporateUser user;


    public CorpRegistrationBean()
    {
        this.name = "";
        this.email = "";
        this.password = "";

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private void saveData(String name, String email, String owner, String pwd)
    {
        user = UserFactory.getInstance().createCorporateUser();

        System.out.println("creato utente");

        user.setName(name);
        System.out.println(user.getName());
        user.setOwner(owner);
        System.out.println(user.getOwner());
        user.setEmail(email);
        System.out.println(user.getEmail());
        user.setPwd(pwd);
        System.out.println(user.getPwd());

    }



    public boolean validate()
    {
        try {
            if (dbController.checkUser(email)) {
                System.out.println("aggiungi questo utente");

                saveData(this.name, this.email, this.owner, this.password);
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
