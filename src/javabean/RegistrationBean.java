package javabean;


import control.PrivateDBcontroller;
import control.UserFactory;
import entity.users.PrivateUser;
import exceptions.IncompleteFormException;
import exceptions.PasswordMismatchException;
import exceptions.UserAlreadyRegisteredException;

import java.io.Serializable;
import java.sql.SQLException;


public class RegistrationBean implements Serializable {

    private PrivateDBcontroller dbController = PrivateDBcontroller.getOurInstance();


    private String name, surname, email, password, confirmpassword;


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

    private void saveData(String name, String email, String surname, String pwd, int type)
    {
        user = UserFactory.getInstance().createUser();

        user.setName(name);
        System.out.println(user.getName());
        user.setSurname(surname);
        System.out.println(user.getSurname());
        user.setEmail(email);
        System.out.println(user.getEmail());
        user.setPwd(pwd);
        System.out.println(user.getPwd());
        user.setType(type);

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
            if (dbController.checkUser(email)) {

                saveData(this.name, this.email, this.surname, this.password, 1);
                dbController.addUser(this.user);

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
