package entity.users;


import java.util.ArrayList;

public class CorporateUser extends RegisteredUser
{
    private String name, owner, piva;

    private ArrayList articoliVenduti, articoliinVendita;

    public CorporateUser() {}

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getPiva() {
        return piva;
    }

    public void setPiva(String piva) {
        this.piva = piva;
    }


}
