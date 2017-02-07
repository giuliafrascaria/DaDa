package javabean;


import control.DaDaSystem;
import entity.users.PrivateUser;
import exceptions.IncompleteFormException;
import exceptions.PasswordMismatchException;
import exceptions.UserAlreadyRegisteredException;

import java.io.Serializable;
import java.sql.SQLException;


public class RegistrationBean implements Serializable {

    //private PrivateDBcontroller dbController = PrivateDBcontroller.getOurInstance();


    private String name, surname, email, password, confirmpassword;

    private Float balance = 0f;


    private PrivateUser user;


    public RegistrationBean()
    {
        this.name = "";
        this.surname = "";
        this.email = "";
        this.password = "";
        this.confirmpassword = "";
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

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    public Float getBalance() {
        return balance;
    }

    public void setBalance(Float balance) {
        this.balance = balance;
    }

    private void saveData(String name, String email, String surname, String pwd, int type)
    {
        user = DaDaSystem.getInstance().saveDataPrivate(name, email, surname, pwd, type);

    }

    public int validate()
    {
        try {
            if(email.equals("") || name.equals("") || password.equals("") || confirmpassword.equals(""))
            {
                throw new IncompleteFormException();
            }

            if(!(password.equals(confirmpassword)))
            {
                throw new PasswordMismatchException();
            }
            if (DaDaSystem.getInstance().checkUserPriv(email)) {

                saveData(this.name, this.email, this.surname, this.password, 1);
                DaDaSystem.getInstance().addUserPriv(this.user);

                return 1;
            }
            else
            {
                throw new UserAlreadyRegisteredException();
            }
        }
        catch (IncompleteFormException e)
        {
            return 5;
        }
        catch (UserAlreadyRegisteredException e)
        {
            return 2;
        }
        catch (PasswordMismatchException e)
        {
            return 4;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return 3;
        }
        catch (Exception e)
        {
            return 3;
        }
    }
}
