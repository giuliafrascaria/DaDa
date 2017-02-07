package javabean;



import control.CorporateDBcontroller;
import control.DaDaSystem;
import control.UserFactory;
import entity.users.CorporateUser;
import exceptions.IncompleteFormException;
import exceptions.PasswordMismatchException;
import exceptions.UserAlreadyRegisteredException;

import java.io.Serializable;
import java.sql.SQLException;


public class CorpRegistrationBean implements Serializable {

    private String name, owner, email, password, confirmpassword;


    private CorporateUser user;


    public CorpRegistrationBean()
    {
        this.name = "";
        this.owner = "";
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

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    private void saveData(String name, String email, String owner, String pwd, int type)
    {
        user = UserFactory.getInstance().createCorporateUser();


        user.setName(name);
        System.out.println(user.getName());
        user.setOwner(owner);
        System.out.println(user.getOwner());
        user.setEmail(email);
        System.out.println(user.getEmail());
        user.setPwd(pwd);
        System.out.println(user.getPwd());
        user.setType(type);

    }



    public int validate()
    {
        try {
            if(email.equals("") || name.equals("") || owner.equals("") || password.equals("") || confirmpassword.equals(""))
            {
                throw new IncompleteFormException();
            }

            if(!(password.equals(confirmpassword)))
            {
                throw new PasswordMismatchException();
            }
            if (DaDaSystem.getInstance().checkUser(email)) {

                saveData(this.name, this.email, this.owner, this.password, 2);
                DaDaSystem.getInstance().addUserCorp(this.user);

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
        catch (PasswordMismatchException e)
        {
            return 4;
        }
        catch (UserAlreadyRegisteredException e)
        {
            return 2;
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
