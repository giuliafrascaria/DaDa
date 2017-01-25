package control;


import entity.users.CorporateUser;
import entity.users.PrivateUser;


public class UserFactory
{

    private static UserFactory ourInstance = new UserFactory();
    public static UserFactory getInstance() {
        return ourInstance;
    }

    private UserFactory() {}

    public static PrivateUser createUser()
    {
        return new PrivateUser();
    }

    CorporateUser createCorporateUser() {return new CorporateUser();}

}
