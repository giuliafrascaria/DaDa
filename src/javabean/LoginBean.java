package javabean;


import control.CorporateDBcontroller;
import control.DatabaseController;
import control.PrivateDBcontroller;
import entity.users.CorporateUser;
import entity.users.PrivateUser;
import entity.users.RegisteredUser;
import exceptions.IncompleteFormException;
import exceptions.UserDoNotExistsException;
import exceptions.WrongPasswordException;

public class LoginBean {


    private String email;
    private String password;
    private String name;

    public LoginBean() {
        this.email = "";
        this.password = "";
        this.name = "";
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setPassword(String pwd) {
        this.password = pwd;
    }

    public String getPassword() {
        return this.password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }


    public int validate() {

        try {
            // Controllo sintattico
            if (this.email.equals("") || this.password.equals("")) {
                throw new IncompleteFormException();
            }

            // Controllo nel db
            DatabaseController controller = DatabaseController.getInstance();
            RegisteredUser user = controller.findByPrimaryKey(this.email);
            if(user != null)
            {
                // Controllo dati di accesso
                if( this.email.equals(user.getEmail()) && this.getPassword().equals(user.getPwd()))
                {
                    if(user.getType() == 1)
                    {
                        System.out.println("cerco un privato");
                        PrivateUser user1 = PrivateDBcontroller.getOurInstance().findUser(email);
                        this.name = user1.getName();
                        System.out.println("nome ritrovato: " + user1.getName());
                    }
                    else if(user.getType() == 2)
                    {
                        System.out.println("cerco un'azienda");
                        CorporateUser user2 = CorporateDBcontroller.getOurInstance().findUser(email);
                        this.name = user2.getName();
                        System.out.println("nome ritrovato: " + user2.getName());
                    }
                    return 1;
                }
                else
                {
                    throw new WrongPasswordException();
                }
            }
            else
            {
                throw new UserDoNotExistsException();
            }
        }catch (IncompleteFormException e)
        {
            return 2;
        }
        catch (UserDoNotExistsException e)
        {
            return 3;
        }
        catch (WrongPasswordException e)
        {
            return 4;
        }
        catch (Exception e)
        {
            return 5;
        }
    }

}
