package javabean;

import entity.users.CorporateUser;
import entity.users.PrivateUser;
import entity.users.RegisteredUser;
import exceptions.IncompleteFormException;
import exceptions.UserDoNotExistsException;
import exceptions.UserNotValidException;
import exceptions.WrongPasswordException;
import control.DaDaSystem;

public class LoginBean {


    private String email;
    private String password;
    private String name;
    private int accountType;
    private Float balance;

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

    public void setBalance(Float balance) {
        this.balance = balance;
    }

    public Float getBalance() {
        return balance;
    }

    public void setAccountType(int accountType) {
        this.accountType = accountType;
    }

    public int getAccountType() {
        return accountType;
    }

    public int validate() {

        try {
            // Controllo sintattico
            if (this.email.equals("") || this.password.equals("")) {
                throw new IncompleteFormException();
            }

            // Controllo nel db
            DaDaSystem system = DaDaSystem.getInstance();
            RegisteredUser user = system.findByPrimaryKey(this.email);
            if(user != null)
            {
                if((user.getValid())) {
                    // Controllo dati di accesso
                    if (this.email.equals(user.getEmail()) && this.getPassword().equals(user.getPwd())) {
                        if (user.getType() == 1) {
                            System.out.println("cerco un privato");
                            PrivateUser user1 = system.findPrivateUser(email);
                            this.name = user1.getName();
                            this.accountType = 1;
                            this.balance = user1.getBalance();
                            System.out.println("nome ritrovato: " + user1.getName());
                        } else if (user.getType() == 2) {
                            System.out.println("cerco un'azienda");
                            CorporateUser user2 = system.findCorporateUser(email);
                            this.name = user2.getName();
                            this.accountType = 2;
                            System.out.println("nome ritrovato: " + user2.getName());
                        }
                        return 1;
                    } else {
                        throw new WrongPasswordException();
                    }
                }
                else
                {
                    throw new UserNotValidException();
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
        catch (UserNotValidException e)
        {
            return 6;
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
