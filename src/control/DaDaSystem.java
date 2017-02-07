package control;

import entity.users.CorporateUser;
import entity.users.PrivateUser;
import entity.users.RegisteredUser;


/**
 * Created by giogge on 07/02/17.
 */
public class DaDaSystem {
    private static DaDaSystem ourInstance = new DaDaSystem();

    public static DaDaSystem getInstance() {
        return ourInstance;
    }

    private DaDaSystem() {
    }

    public RegisteredUser findByPrimaryKey(String userID)
    {
        RegisteredUser user = null;
        try {
            user = DatabaseController.getInstance().findByPrimaryKey(userID);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }

    public PrivateUser findPrivateUser(String email)
    {
        PrivateUser user = null;
        try {
            user = PrivateDBcontroller.getOurInstance().findUser(email);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;

    }

    public CorporateUser findCorporateUser(String email)
    {
        CorporateUser user = null;
        try {
            CorporateDBcontroller.getOurInstance().findUser(email);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
