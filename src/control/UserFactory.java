package control;


import entity.users.CorporateUser;
import entity.users.PrivateUser;
import entity.users.RegisteredUser;


public class UserFactory
{

    private static UserFactory ourInstance = new UserFactory();
    public static UserFactory getInstance() {
        return ourInstance;
    }

    private UserFactory() {}

    public RegisteredUser createRegisteredUser(){return new RegisteredUser();}

    public PrivateUser createUser()
    {
        return new PrivateUser();
    }

    public CorporateUser createCorporateUser() {return new CorporateUser();}

}
